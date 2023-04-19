import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    String readContinents = """ 
    query{
  continents{
    code
    countries{
      languages{
        name
      }
    }
    name
  }
}
   """;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GraphqlClient'),
        ),
        body: Query(
            options: QueryOptions(
              document:
                  gql(readContinents), // the query string that i just created.
            ),
            builder: (QueryResult result,
                {VoidCallback? refetch, FetchMore? fetchMore}) {
              // checking for errors
              if (result.hasException) {
                return Text(result.exception.toString());
              }

              if (result.isLoading) {
                return const Text('Loading');
              }

              List continents = result.data?['continents'];

              return ListView.builder(
                itemCount: continents.length,
                itemBuilder: (context, index) {
                  final continent = continents[index];
                  return Text(continent['code']);
                },
              );
            }),
      ),
    );
  }
}
