import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vesti/common/constant/color_constant.dart';


class BigText extends StatelessWidget {
  final String text;
  final double fontSize;
  Color? color;
  final TextAlign textAlign;
  final int maxLine;
  final FontWeight fontWeight;
  final TextOverflow overflow;
  final bool softWrap;
  BigText({super.key,this.text="",this.fontSize=24,this.color,this.textAlign=TextAlign.start,this.fontWeight=FontWeight.normal,this.maxLine=1,this.overflow=TextOverflow.ellipsis,this.softWrap=false});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLine,
      softWrap: softWrap,
      textAlign: textAlign,
      style: TextStyle(
          color: color,
          fontSize: fontSize.sp,
          decoration: TextDecoration.none,
          overflow: overflow,
          fontWeight: fontWeight
      ),
    );
  }
}

class SmallText extends StatelessWidget {
  final String text;
  final double fontSize;
  Color? color;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final int maxLine;
  final TextOverflow overflow;
  final bool softWrap;
  SmallText({super.key,this.text="",this.fontSize=10,this.color,this.textAlign=TextAlign.start,this.fontWeight=FontWeight.normal,this.maxLine=1,this.overflow=TextOverflow.ellipsis,this.softWrap=false});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLine,
      softWrap: softWrap,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: fontSize.sp,
        decoration: TextDecoration.none,
        overflow: overflow,
        fontWeight: fontWeight
      ),
    );
  }
}


class ReadMoreText extends ConsumerStatefulWidget {
  final String text;

  const ReadMoreText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  ConsumerState createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends ConsumerState<ReadMoreText> {
  late String firstHalf;
  late String secondHalf;
  
  bool hiddenText = true;
  
  double textHeight = 1.sh/5.63;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.text.length>textHeight){
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt()+1, widget.text.length);
    }else{
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return secondHalf.isEmpty ? Text(firstHalf,): Column(
      children: [
        Text(
          hiddenText ? (firstHalf+"..."):(firstHalf+secondHalf),
          maxLines: 4,
          style: TextStyle(
            fontWeight: FontWeight.w300
          ),
        ),
        InkWell(
          onTap: (){
            setState(() {
              hiddenText=!hiddenText;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SmallText(text: "Read more",color: AppColor.mainColor,),
            ],
          ),
        )
      ],
    );
  }
}
