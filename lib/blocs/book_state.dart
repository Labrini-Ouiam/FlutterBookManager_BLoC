import '../models/book.dart';

abstract class BookState {}

class BookInitial extends BookState {}

class BookLoading extends BookState {}

class BookLoaded extends BookState {
  final List<Book> books;
  BookLoaded(this.books);
}

class FavoritesLoaded extends BookState {
  final List<Book> favorites;
  FavoritesLoaded(this.favorites);
}

class BookError extends BookState {
  final String message;
  BookError(this.message);
}
