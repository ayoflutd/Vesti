import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vesti/common/constant/color_constant.dart';
import 'package:vesti/common/constant/image_constant.dart';
import 'package:vesti/common/route/app_route.dart';
import 'package:vesti/common/widget/appbar/appbar_widget.dart';
import 'package:vesti/common/widget/books/books_widget.dart';
import 'package:vesti/common/widget/boxdecoration/boxdecoration_widget.dart';
import 'package:vesti/common/widget/header/app_box_header.dart';
import 'package:vesti/common/widget/image/image_widget.dart';
import 'package:vesti/common/widget/text/app_text.dart';
import 'package:vesti/global.dart';
import 'package:vesti/view/home/notifier/home_notifier.dart';
import 'package:vesti/view/home/widget/home_widget.dart';


class Home extends ConsumerWidget {
  const Home({super.key});


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final homeCategoryProvider = ref.watch(homeCategoryListProvider);
    final homeRecentBooks = ref.watch(homeRecentlyBorrowedProvider);
    final homeNewBooks = ref.watch(homeHomeNewArrivalProvider);
    final homeRecommendedBooks = ref.watch(homeRecommendedProvider);
    final selectedIndex = ref.watch(homeCategoryIndexNotifier);

    return Scaffold(
        appBar: appWidgetAppBar(
          title: Row(
            spacing: 10.w,
            children: [
              GestureDetector(
                  onTap: (){
                    Scaffold.of(context).openDrawer();
                  },
                  child: userProfileImage(
                      imgPath: "${Global.storageService.loadProfile().avatar}")
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                SmallText(text: "Welcome back!",color: AppColor.primaryGreyColor,fontSize: 8.sp,),
                SmallText(
                  text: "${Global.storageService.loadProfile().name} ${Global.storageService.loadProfile().lastname}",
                  fontWeight: FontWeight.bold,
                  fontSize: 10.sp,
                )
              ],
              )
            ],
          ),
          actions: [
            IconButton(
                onPressed: (){},
                icon: Icon(Icons.notification_important_rounded))
          ]
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Search Box
              Container(
                height: 40.h,
                child: Row(
                  spacing: 10.w,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: appBoxDecoration(),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Search',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent)
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent)
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent)
                              ),
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(right: 3.w),
                                child: Icon(Icons.search),
                              )
                          ),
                        ),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
                        child: Center(
                          child: Icon(Icons.category),
                        ),
                        decoration: appBoxDecoration()
                    )
                  ],
                ),
              ),

              // // Category List
              SizedBox(height: 20.h,),
              SmallText(
                text: "Category",
                fontWeight: FontWeight.bold,
                fontSize: 12.sp,
              ),
              SizedBox(height: 10.h),
              SizedBox(
                height: 30.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: homeCategoryProvider.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        ref.read(homeCategoryIndexNotifier.notifier)
                            .changeCategoryIndex(index);
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10.w),
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 10.h),
                        decoration: appBoxDecoration(
                          backColor: index == selectedIndex
                              ? AppColor.mainColor
                              : Colors.white,
                        ),
                        child: Center(
                          child: SmallText(
                            text: homeCategoryProvider[index],
                            color: index == selectedIndex
                                ? AppColor.primaryWhiteColor
                                : Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),


              SizedBox(height: 20.h,),
              //
              // //Recently Borrowed
              appBoxHeader(categoryTitle: "Recently Borrowed"),
              SizedBox(height: 5.h,),
              Container(
                height: 150.h,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: homeRecentBooks.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var recent = homeRecentBooks[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRoute.BOOK_DETAIL,
                          arguments: {"id": recent.id},
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
                                bookDetailImage(imgPath: recent.thumbnail!, height: 80.h),
                                if (recent.liked == true)
                                  Positioned(
                                    top: 11.h,
                                    right: 10.w,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 14.r,
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
                            SmallText(text: "${recent.time}"),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),



              //New Arrival
              appBoxHeader(categoryTitle: "New Arrival"),
              SizedBox(height: 5.h,),
              BooksWidget(book: homeNewBooks,),

              //New Arrival
              appBoxHeader(categoryTitle: "Recommended For You"),
              SizedBox(height: 5.h,),
              BooksWidget(book: homeRecommendedBooks,)

            ],
          ),
        ),

    );
  }
}
