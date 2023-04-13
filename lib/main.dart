import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // add http link.link that points to the graphql server with the desired data.
    final HttpLink httpLink =
        HttpLink('https://countries.trevorblades.com/graphql');
    // add value notifier
    // takes two parameters. link and cache.

    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        link: httpLink,
        cache: GraphQLCache(store: InMemoryStore()),
      ),
    );

    // return graphqlProvider which takes two parameters . client and a child.

    return GraphQLProvider(
      client: client,
      child: const HomePage(),
    );
  }
}
