import 'package:profile/presentation/widgets/toast/toast_utils.dart';
import 'package:url_launcher/url_launcher.dart';

void launchExternalUrl(String url) async {
  if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
    showErrorToast('Could not launch app!');
  }
}