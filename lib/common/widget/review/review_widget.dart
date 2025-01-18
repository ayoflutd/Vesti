import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:vesti/common/widget/image/image_widget.dart';
import 'package:vesti/common/widget/text/app_text.dart';
import 'package:vesti/model/review.dart';
import 'package:vesti/view/book_detail/widget/book_detail_widget.dart';

class ReviewWidget extends StatelessWidget {
  final List<Review> review;
  const ReviewWidget({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: review.length,
      itemBuilder: (BuildContext context, int index) {
        var reviewItem = review[index];
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Profile Image
            userProfileImage(imgPath: "${reviewItem.user?.avatar}"),
            SizedBox(width: 10.w),

            // Review Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name and Timestamp Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // User Name
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SmallText(
                            text:
                            "${reviewItem.user!.name} ${reviewItem.user!.lastname}",
                            fontWeight: FontWeight.bold,
                            fontSize: 10.sp,
                          ),
                          bookRating()
                        ],
                      ),
                      // Time
                      SmallText(
                        text: "${reviewItem.time}",
                        color: Colors.grey,
                        fontSize: 10.sp,
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),

                  // Review Text
                  ReadMoreText(
                    text: reviewItem.comment ?? "",

                  ),
                ],
              ),
            ),
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 10.h);
      },
    );
  }
}
