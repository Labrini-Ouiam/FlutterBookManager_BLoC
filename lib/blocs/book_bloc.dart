import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/book.dart';
import '../repositories/book_repository.dart';
import '../services/db_service.dart';
import 'book_event.dart';
import 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final BookRepository repository;

  BookBloc(this.repository) : super(BookInitial()) {
    on<SearchBooks>((event, emit) async {
      emit(BookLoading());
      try {
        final books = await repository.searchBooks(event.query);
        emit(BookLoaded(books));
      } catch (e) {
        emit(BookError("Error fetching books"));
      }
    });

    on<AddFavorite>((event, emit) async {
      await DBService.insertItem(event.book);
      add(LoadFavorites());
    });

    on<RemoveFavorite>((event, emit) async {
      await DBService.deleteItem(event.id);
      add(LoadFavorites());
    });

    on<LoadFavorites>((event, emit) async {
      final favorites = await DBService.getItems();
      emit(FavoritesLoaded(favorites));
    });
  }
}
