import 'package:graphql_flutter/graphql_flutter.dart';

class AppGraphQLClient extends GraphQLClient {
  AppGraphQLClient()
      : super(
          link: HttpLink('https://api.lens.dev'),
          cache: GraphQLCache(),
        );
}