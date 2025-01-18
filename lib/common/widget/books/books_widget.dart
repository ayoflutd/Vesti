import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vesti/common/constant/color_constant.dart';
import 'package:vesti/common/route/app_route.dart';
import 'package:vesti/common/widget/image/image_widget.dart';
import 'package:vesti/common/widget/text/app_text.dart';
import 'package:vesti/model/book.dart';

class BooksWidget extends StatelessWidget {
  final List<Book> book;
  const BooksWidget({super.key,required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.h,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: book.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var books = book[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoute.BOOK_DETAIL,
                arguments: {"id": books.id},
              );
            },
            child: Container(
              height: 100.h,
              margin: EdgeInsets.only(right: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      bookDetailImage(imgPath: books.thumbnail!, height: 80.h,width: 150.w),
                      if (books.liked == true)
                        Positioned(
                          top: 11.h,
                          right: 10.w,
                          child: CircleAvatar(
                            radius: 14.r,
                            backgroundColor: Colors.white,
                            child: Center(
                              child: Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 14.sp,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  SmallText(text: "${books.title}",fontWeight: FontWeight.bold,),
                  SmallText(text: "${books.author}",color: AppColor.primaryGreyColor,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.star_rate_rounded,color: Colors.amber,),
                      SmallText(text: "${books.rating}",)
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
