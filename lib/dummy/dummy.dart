import 'package:vesti/common/constant/image_constant.dart';
import 'package:vesti/model/book.dart';
import 'package:vesti/model/review.dart';
import 'package:vesti/model/user.dart';

class AppDummyData{


  static const List<String> HOME_CATEGORY = [
    "All",
    "Historical Fiction",
    "Engineering",
    "Comedy"
  ];

  static  List<Book> BOOKS = [
    Book(
      id: 1,
      title: "The Island of the missing trees",
      thumbnail: AppImageConstant.RECENTLY_BORROWED_IMG1,
      time: "2 days left",
      content: "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Dolor blanditiis consectetur animi enim, reiciendis sunt? Odit reprehenderit blanditiis quis quidem nam nulla perferendis optio saepe, ad iure quos consequuntur magnam fugiat aperiam culpa reiciendis officia quod, quibusdam pariatur minus architecto!",
      reviews: [],
      author: "Leke Tolu",
      rating: 4.5,
      liked: true,
      type: "recent",
      pages: 290,
      language: "YOR"
    ),
    Book(
      id: 2,
      title: "Theology and economics",
        content: "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Dolor blanditiis consectetur animi enim, reiciendis sunt? Odit reprehenderit blanditiis quis quidem nam nulla perferendis optio saepe, ad iure quos consequuntur magnam fugiat a",
        thumbnail: AppImageConstant.RECENTLY_BORROWED_IMG2,
      time: "5 days left",
      reviews: [
        Review(
          id: 1,
          comment: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Ut sed soluta excepturi amet accusantium optio itaque labore at modi voluptate!",
          time: "2 days ago",
          user: User(
            id: 1,
            name: "Modola",
            lastname: "John",
            avatar: AppImageConstant.USER
          ),
        ),
        Review(
          id: 2,
          comment: "Ut sed soluta excepturi amet accusantium optio itaque labore at modi voluptate!",
          time: "2 days ago",
          user: User(
              id: 2,
              name: "Leke",
              lastname: "Biyi",
              avatar: AppImageConstant.USER
          ),
        )
      ],
      author: "Dele Ben",
      rating: 4.5,
      liked: true,
      type: "recent",
      pages: 240,
      language: "HUN"
    ),
    Book(
      id: 3,
      title: "Chemistry",
        content: "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Dolor blanditiis consectetur animi enim, reiciendis sunt? Odit reprehenderit blanditiis quis quidem nam nulla perferendis optio saepe, ad iure quos consequuntur magnam quibusdam pariatur minus architecto!",
        thumbnail: AppImageConstant.RECENTLY_BORROWED_IMG3,
      time: "3 days left",
      reviews: [],
      author: "Mide Layo",
      rating: 4.5,
      liked: true,
      type: "recent",
      pages: 100,
      language: "CHI"
    ),
    Book(
        id: 4,
        title: "Clap When You Land",
        content: "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Dolor blanditiis consectetur animi enim, reiciendis sunt? Odit reprehenderit blanditiis quis quidem nam nulla perferendis optio saepe, ad iure quos consequuntur magnam quibusdam pariatur minus architecto!",
        thumbnail: AppImageConstant.NEW_ARRIVAL_IMG1,
        time: "3 days left",
        reviews: [],
        author: "Elizabeth Acevedo",
        rating: 4.5,
        liked: true,
        type: "new",
        pages: 150,
        language: "ESP"
    ),
    Book(
        id: 5,
        title: "The Attic Child",
        content: "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Dolor blanditiis consectetur animi enim, reiciendis sunt? Odit reprehenderit blanditiis quis quidem nam nulla perferendis optio saepe, ad iure quos consequuntur magnam fugiat aperiams architecto!",
        thumbnail: AppImageConstant.NEW_ARRIVAL_IMG2,
        time: "3 days left",
        reviews: [],
        author: "Lola Jaye",
        rating: 4.5,
        liked: true,
        type: "new",
        pages: 200,
        language: "500"
    ),
    Book(
        id: 6,
        title: "Chemistry",
        content: "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Dolor blanditiis consectetur animi enim, reiciendis sunt? Odit reprehenderit blanditiis quis quidem nam nulla perferendis optio saepe, ad iure quos consequuntur magnam f",
        thumbnail: AppImageConstant.NEW_ARRIVAL_IMG2,
        time: "3 days left",
        reviews: [],
        author: "David R Khan",
        rating: 4.5,
        liked: true,
        type: "recommended",
        pages: 300,
        language: "FRA"
    ),
    Book(
        id: 7,
        title: "Take The Risk",
        content: "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Dolor blanditiis consectetur animi enim, reiciendis sunt? Odit reprehenderit blanditiis quis quidem nam nulla perferendis optio saepe, ad iure quos consequuntur magnam fugiat aperiam culpa reiciendis officia quod, quibusdam pariatur minus architecto!",
        thumbnail: AppImageConstant.NEW_ARRIVAL_IMG1,
        time: "3 days left",
        reviews: [
          Review(
            id: 2,
            comment: "Ut sed soluta excepturi amet accusantium optio itaque labore at modi voluptate!",
            time: "2 days ago",
            user: User(
                id: 2,
                name: "Leke",
                lastname: "Biyi",
                avatar: AppImageConstant.USER
            ),
          ),
          Review(
            id: 2,
            comment: "Ut sed soluta excepturi amet accusantium optio itaque labore at modi voluptate!",
            time: "2 days ago",
            user: User(
                id: 2,
                name: "Tunde",
                lastname: "Biyi",
                avatar: AppImageConstant.USER
            ),
          )
        ],
        author: "Ben Carson",
        rating: 4.5,
        liked: true,
        type: "recommended",
        pages: 400,
        language: "ENG"
    )
  ];
}