import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/book_bloc.dart';
import '../blocs/book_event.dart';
import '../blocs/book_state.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<BookBloc>().add(LoadFavorites());

    return Scaffold(
      appBar: AppBar(title: Text('Favorites')),
      body: BlocBuilder<BookBloc, BookState>(
        builder: (context, state) {
          if (state is FavoritesLoaded) {
            final favorites = state.favorites;
            if (favorites.isEmpty) return Center(child: Text("No favorites yet"));
            return ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (_, i) {
                final book = favorites[i];
                return ListTile(
                  title: Text(book.title),
                  subtitle: Text(book.author),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      context.read<BookBloc>().add(RemoveFavorite(book.id));
                    },
                  ),
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
