import 'package:vesti/model/review.dart';
import 'package:vesti/model/user.dart';

class Book{
  int? id;
  String? title;
  String? content;
  String? thumbnail;
  String? time;
  List<Review>? reviews;
  String? author;
  double? rating;
  int? pages;
  String? language;
  bool? liked;
  String? type;
  Book({this.id,this.title,this.thumbnail,this.time,this.reviews,this.content,
    this.author,this.rating,this.liked,this.type,this.pages,this.language});

  factory Book.fromJson(Map<String, dynamic> json){
    return Book(
      id: json["id"],
      title: json["title"],
      content: json["content"],
      thumbnail: json["thumbnail"],
      time: json["addtime"],
      reviews: json["reviews"] == null ? [] : List<Review>.from(json["reviews"].map((x)=> Review.fromJson(x))),
      author: json["author"],
      rating: json["rating"],
      liked: json["liked"],
      type: json["type"],
      pages: json["pages"],
      language: json["language"],
    );
  }

}


class BookId{
  int? id;
  BookId({this.id});

  Map<String, dynamic> toJson()=>{
    "id": id,
  };
}