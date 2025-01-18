import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vesti/common/constant/color_constant.dart';
import 'package:vesti/common/route/app_route.dart';
import 'package:vesti/common/widget/appbar/appbar_widget.dart';
import 'package:vesti/common/widget/books/books_widget.dart';
import 'package:vesti/common/widget/header/app_box_header.dart';
import 'package:vesti/common/widget/image/image_widget.dart';
import 'package:vesti/common/widget/review/review_widget.dart';
import 'package:vesti/common/widget/text/app_text.dart';
import 'package:vesti/view/book_detail/provider/book_detail_provider.dart';
import 'package:vesti/view/book_detail/widget/book_detail_widget.dart';


class BookDetail extends ConsumerStatefulWidget {
  const BookDetail({super.key});

  @override
  ConsumerState<BookDetail> createState() => _BookDetailState();
}

class _BookDetailState extends ConsumerState<BookDetail> {
  late var args;
  @override
  void didChangeDependencies() {
    var id = ModalRoute.of(context)?.settings.arguments as Map;

    args = id["id"];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final bookDetail = ref.watch(bookDetailProvider(index: args.toInt()));
    final moreBooks = ref.watch(moreBooksProvider.notifier).state;

    return Scaffold(
      appBar: borderAppBar(title: "Book Detail"),
      body: Padding(
        padding: EdgeInsets.only(left: 15.w,right: 15.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: Center(
                    child: bookDetailImage(
                        imgPath: bookDetail!.thumbnail!,width: 150.w,height: 150.h
                    )
                ),
              ),
              SizedBox(height: 15.h,),
              Center(
                child: SmallText(text: "${bookDetail.title}",fontWeight: FontWeight.bold,),
              ),
              Center(
                child: SmallText(text: "${bookDetail.author}",color: AppColor.primaryGreyColor,),
              ),
              SizedBox(height: 10.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  bookDetailBox(title: "Rating",value: "${bookDetail.rating}",icon: true),
                  bookDetailBox(title: "Pages",value: "${bookDetail.pages}"),
                  bookDetailBox(title: "Language",value: "${bookDetail.language}"),
                ],
              ),
              SizedBox(height: 15.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 15.w,
                    children: [
                      SmallText(text: "Action",fontWeight: FontWeight.bold,fontSize: 12.sp,),
                      SmallText(text: "Thriller",),
                      SmallText(text: "Suspense",)
                    ],
                  ),
                  bookDetail.liked == true ? Icon(Icons.favorite,size: 14.sp,color: Colors.red,) :
                      SizedBox()
                ],
              ),
              SizedBox(height: 20.h,),
              ReadMoreText(text: "${bookDetail.content}",),
              SizedBox(height: 10.h,),
              appBoxHeader(categoryTitle: "Reviews"),
              SizedBox(height: 5.h,),
              bookDetail.reviews!.isNotEmpty ?
              ReviewWidget(review: bookDetail.reviews!) : SizedBox(
                height: 50.h,
                child: Center(
                  child: SmallText(text: "Now Review Yet",),
                ),
              ),

              //New Arrival
              appBoxHeader(categoryTitle: "More Like This"),
              SizedBox(height: 5.h,),
              BooksWidget(book: moreBooks,)
            ],
          ),
        )
      )
    );
  }
}
