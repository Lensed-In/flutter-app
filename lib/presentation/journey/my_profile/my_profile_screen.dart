import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:profile/common/constants/app_icons.dart';
import 'package:profile/common/constants/layout_constants.dart';
import 'package:profile/common/constants/png_constants.dart';
import 'package:profile/common/util/widget_utils.dart';
import 'package:profile/localization/languages.dart';
import 'package:profile/presentation/app/route_constants.dart';
import 'package:profile/presentation/journey/common/app_bar.dart';
import 'package:profile/presentation/journey/common/ui_utils.dart';
import 'package:profile/presentation/journey/main/bloc/main_screen_bloc.dart';
import 'package:profile/presentation/journey/main/bottom_navigation_bar.dart';
import 'package:profile/presentation/themes/app_colors.dart';
import 'package:profile/presentation/widgets/button_widget/button_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet_connect/wallet_connect.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart' as http;


class MyProfileScreen extends StatefulWidget {
  final MainScreenBloc mainScreenBloc;

  const MyProfileScreen({
    Key? key,
    required this.mainScreenBloc,
  }) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

final maticRpcUri =
    'https://rpc-mainnet.maticvigil.com/v1/140d92ff81094f0f3d7babde06603390d7e581be';


class _MyProfileScreenState extends State<MyProfileScreen> {
  Languages? lang;
  late ScrollController _scrollController;
  PackageInfo? packageInfo;

  MainScreenBloc get mainScreenBloc => widget.mainScreenBloc;

  late WCClient _wcClient;
  late SharedPreferences _prefs;
  late InAppWebViewController _webViewController;
  late TextEditingController _textEditingController;
  late String walletAddress, privateKey;
  bool connected = false;
  WCSessionStore? _sessionStore;
  final _web3client = Web3Client(
    maticRpcUri,
    http.Client(),
  );

  @override
  void initState() {
    super.initState();
    // _initialize();
    _scrollController = ScrollController();
    getPackageInfo();
  }

  // _initialize() async {
  //   _wcClient = WCClient(
  //     onSessionRequest: _onSessionRequest,
  //     onFailure: _onSessionError,
  //     onDisconnect: _onSessionClosed,
  //     onEthSign: _onSign,
  //     onEthSignTransaction: _onSignTransaction,
  //     onEthSendTransaction: _onSendTransaction,
  //     onCustomRequest: (_, __) {},
  //     onConnect: _onConnect,
  //   );
  //   // TODO: Mention walletAddress and privateKey while connecting
  //   walletAddress = '';
  //   privateKey = '';
  //   _textEditingController = TextEditingController();
  //   _prefs = await SharedPreferences.getInstance();
  // }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Scaffold build(BuildContext context) {
    lang = Languages.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: padding20().copyWith(
            bottom: LayoutConstants.dimen_128.h,
            top: LayoutConstants.dimen_52.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              mainScreenBloc.state.isGuest == true
                  ? pageTitle(context, 'Your profile')
                  : Container(),
              mainScreenBloc.state.isGuest == true
                  ? captionLeft(context, 'Login to your profile')
                  : Container(),
              mainScreenBloc.state.isGuest == true
                  ? gap16(v: true)
                  : Container(),
              mainScreenBloc.state.isGuest == true
                  ? buttonPrimary(context, 'Login', onPress: () {
                      Navigator.pushNamed(context, RouteConstants.myHomePage);
                    })
                  : Row(
                      children: [
                         CircleAvatar(
                          backgroundImage: mainScreenBloc.state.user?.profilePic != null ? CachedNetworkImageProvider(
                            mainScreenBloc.state.user?.profilePic ?? '',
                          ) : null,
                          radius: LayoutConstants.dimen_32.r,
                           backgroundColor: AppColor.primaryColor,
                          child: mainScreenBloc.state.user?.profilePic == null ? userIcon(context, AppIcons.person) : null,
                        ) ,
                        gap16(h: true),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            headline6(
                              context,
                              mainScreenBloc.state.user?.name,
                              fontWeight: FontWeight.w900,
                              // maxLines: 3,
                            ),
                            gap2(v: true),
                            captionLeft(
                              context,
                              mainScreenBloc.state.user?.email,
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ],
                    ),
              // gap8(v: true),
              // Wrap(
              //   spacing: LayoutConstants.dimen_8.w,
              //   children: _buildSkillsList(getSampleRoles(context)),
              // ),
              // gap8(v: true),
              // subtitle2(
              //   context,
              //   'Building @ORB_club: Your portal to Web3 world \nFormer Co-founder @Blink_dating & @Dwellfood (100K+ meals served)\nCreator @Resume_X(70K+ downloads)',
              //   maxLines: 4,
              //   fontSize: 12,
              // ),
              // gap8(v: true),
              // Row(
              //   children: [
              //     // Icon(
              //     //   Icons.location_on_outlined,
              //     //   size: LayoutConstants.dimen_12.r,
              //     // ),
              //     headline6(context, '🇺🇸'),
              //     gap4(h: true),
              //     captionLeft(
              //       context,
              //       ' San Fransisco, CA, US',
              //       fontSize: 12,
              //       maxLines: 2,
              //     )
              //   ],
              // ),
              // gap8(v: true),
              // Wrap(
              //   spacing: LayoutConstants.dimen_8.w,
              //   children: _buildSocialHandleList(sampleSocialHandles),
              // ),
              gap24(v: true),
              Card(
                elevation: 0,
                margin: EdgeInsets.zero,
                shape: roundedRectangleBorder16(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildOptionItem(
                        context, Icons.ios_share, 'Share with friends',
                        onTap: () {}),
                    divider(margin: padding16(v: false)),
                    buildOptionItem(context, Icons.star, 'Rate App',
                        onTap: () => InAppReview.instance
                            .openStoreListing(appStoreId: '1566410911')),
                    divider(margin: padding16(v: false)),
                    buildOptionItem(context, Icons.info, 'About', onTap: () {
                      Navigator.of(context).pushNamed(RouteConstants.aboutApp);
                    }),
                    mainScreenBloc.state.isGuest == false
                        ? divider(margin: padding16(v: false))
                        : Container(),
                    mainScreenBloc.state.isGuest == false
                        ? buildOptionItem(context, Icons.logout, 'Log out',
                            onTap: () =>
                                mainScreenBloc.add(MainScreenLogoutEvent()))
                        : Container(),
                  ],
                ),
              ),
              gap12(v: true),
              Padding(
                padding: padding2(v: false),
                child: captionLeft(
                    context, 'Version: ${packageInfo?.version ?? '-'}',
                    fontSize: 12),
              )
            ],
          ),
        ),
      ),
    );
  }

  void getPackageInfo() async {
    PackageInfo package = await PackageInfo.fromPlatform();
    setState(() {
      packageInfo = package;
    });
  }

  SvgPicture userIcon(BuildContext context, String icon) =>
      SvgPicture.asset(
        icon,
        width: LayoutConstants.dimen_32.r,
        height: LayoutConstants.dimen_32.r,
        color: AppColor.white,
      );
}
