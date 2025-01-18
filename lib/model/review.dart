import 'package:vesti/model/user.dart';

class Review {
  int? id;
  String? comment;
  String? time;
  User? user;


  Review({this.id, this.comment, this.time, this.user,});

  factory Review.fromJson(Map<String, dynamic> json){
    return Review(
      id: json["id"],
      comment: json["review"],
      time: json["time"],
      user: User.fromJson(json["user"]),
    );
  }

}