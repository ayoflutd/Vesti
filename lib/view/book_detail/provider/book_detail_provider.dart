import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vesti/dummy/dummy.dart';
import 'package:vesti/model/book.dart';
part 'book_detail_provider.g.dart';

@riverpod
Book? bookDetail(Ref ref,{required int index}){
  BookId postId = BookId();
  postId.id = index;

  var bookDetail = AppDummyData.BOOKS.firstWhere((data)=>data.id == index);
  return bookDetail;

}

List<Book> fetchMoreBooks() {
  return AppDummyData.BOOKS;
}

final moreBooksProvider = StateProvider<List<Book>>((ref) {
  return fetchMoreBooks();
});