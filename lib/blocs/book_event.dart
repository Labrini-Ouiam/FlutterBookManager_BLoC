import '../models/book.dart';

abstract class BookEvent {}

class SearchBooks extends BookEvent {
  final String query;
  SearchBooks(this.query);
}

class AddFavorite extends BookEvent {
  final Book book;
  AddFavorite(this.book);
}

class RemoveFavorite extends BookEvent {
  final String id;
  RemoveFavorite(this.id);
}

class LoadFavorites extends BookEvent {}
