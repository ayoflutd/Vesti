import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vesti/dummy/dummy.dart';
import 'package:vesti/model/book.dart';

class HomeCategoryIndexNotifer extends StateNotifier<int>{
  HomeCategoryIndexNotifer():super(0);

  void changeCategoryIndex(int value){
    state == value;
  }
}


final homeCategoryIndexNotifier = StateNotifierProvider<HomeCategoryIndexNotifer, int>((ref)=>HomeCategoryIndexNotifer());


List<String> fetchHomeCategoryList() {
    return AppDummyData.HOME_CATEGORY;
}

final homeCategoryListProvider = StateProvider<List<String>>((ref) {
  return fetchHomeCategoryList();
});

List<Book> fetchHomeRecentlyBorrowed() {
  List<Book> recent = AppDummyData.BOOKS.where((value)=>value.type == "recent").toList();
  return recent;
}

final homeRecentlyBorrowedProvider = StateProvider<List<Book>>((ref) {
  return fetchHomeRecentlyBorrowed();
});

List<Book> fetchHomeNewArrival() {
  var newbook = AppDummyData.BOOKS.where((data)=>data.type == "new").toList();
  return newbook;
}


final homeHomeNewArrivalProvider = StateProvider<List<Book>>((ref) {
  return fetchHomeNewArrival();
});

List<Book> fetchHomeRecommended() {
  var recommended = AppDummyData.BOOKS.where((data)=>data.type == "recommended").toList();
  return recommended;
}


final homeRecommendedProvider = StateProvider<List<Book>>((ref) {
  return fetchHomeRecommended();
});