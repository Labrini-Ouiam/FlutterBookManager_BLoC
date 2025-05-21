import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'pages/search_page.dart';
import 'pages/favorites_page.dart';
import 'repositories/book_repository.dart';
import 'blocs/book_bloc.dart';

void main() {
  runApp(BookApp());
}

class BookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BookBloc(BookRepository()),
      child: MaterialApp(
        title: 'BookApp BLoC',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: SearchPage(),
        routes: {
          '/favorites': (context) => FavoritesPage(),
        },
      ),
    );
  }
}
