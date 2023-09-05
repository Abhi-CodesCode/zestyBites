import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zestybites/utils/app_color.dart';
import 'package:zestybites/utils/dimensions.dart';
import 'package:zestybites/widgets/small_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  final double textHeightRatio;
  const ExpandableTextWidget({
    super.key,
    required this.text,
    this.textHeightRatio=1,
  });

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText=true;


  @override
  void initState() {
    super.initState();
    double textHeight=Dimensions.screenHeight/2.2*widget.textHeightRatio;
    if(widget.text.length>textHeight){
      firstHalf=widget.text.substring(0,textHeight.toInt());
      secondHalf=widget.text.substring(textHeight.toInt()+1,widget.text.length);
    }
    else{
      firstHalf=widget.text;
      secondHalf="";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?SmallText(text: firstHalf,relativeSize: 1.25,height: 1.4,):Column(
        children: [
        SmallText(text:hiddenText?("$firstHalf..."):(firstHalf+secondHalf),relativeSize: 1.25,height: 1.4,),
        InkWell(
          onTap: (){
            setState(() {
              hiddenText=!hiddenText;
            });
          },
          child: Row(
            children: [
              SmallText(text: hiddenText?"Show more":"Show less",color: AppColor.primaryTextColor,),
              Icon(hiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up,color: AppColor.primaryTextColor,)
          ],)
          ,),
          SizedBox(height: Dimensions.height10,)
      ],
      ),
    );
  }
}
