import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/book_bloc.dart';
import '../blocs/book_event.dart';
import '../blocs/book_state.dart';

class SearchPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Books (BLoC)'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () => Navigator.pushNamed(context, '/favorites'),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter book name...',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    context.read<BookBloc>().add(SearchBooks(_controller.text));
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<BookBloc, BookState>(
              builder: (context, state) {
                if (state is BookLoading) return Center(child: CircularProgressIndicator());
                if (state is BookLoaded) {
                  return ListView.builder(
                    itemCount: state.books.length,
                    itemBuilder: (_, i) {
                      final book = state.books[i];
                      return ListTile(
                        title: Text(book.title),
                        subtitle: Text(book.author),
                        trailing: IconButton(
                          icon: Icon(Icons.favorite_border),
                          onPressed: () {
                            context.read<BookBloc>().add(AddFavorite(book));
                          },
                        ),
                      );
                    },
                  );
                }
                if (state is BookError) return Center(child: Text(state.message));
                return Center(child: Text("Search for books"));
              },
            ),
          )
        ],
      ),
    );
  }
}
