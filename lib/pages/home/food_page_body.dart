import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:zestybites/utils/app_color.dart';
import 'package:zestybites/utils/dimensions.dart';
import 'package:zestybites/widgets/big_text.dart';
import 'package:zestybites/widgets/food_header.dart';
import 'package:zestybites/widgets/small_text.dart';
import 'package:zestybites/widgets/text_and_icon_widget.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.84);
  var _currPageValue=0.0;
  final double _scaleFactor=0.8;
  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue=pageController.page!;
      });
    });
  }
  @override
  void dispose(){
    super.dispose();
    pageController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(top: Dimensions.width5)),
        Container(
            //color: Colors.red,
            height: Dimensions.fullPageBodyHeight,
            child: PageView.builder(
                controller: pageController,
                itemCount: 5,
                itemBuilder: (context, position) {
                  return _buildPageItem(position);
                }),
          ),
        DotsIndicator(
        dotsCount: 5,
        position: _currPageValue,
        decorator: DotsDecorator(
          activeColor: AppColor.mainColor,
        size: Size.square(9.0*(Dimensions.width10/10)),
        activeSize: Size(18.0*(Dimensions.width10/10), 9.0*(Dimensions.width10/10)),
        activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
        ),
        SizedBox(height: Dimensions.height10,),
        Container(
          padding: EdgeInsets.only(left:Dimensions.width20),
          child: Row(crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular",),
              SizedBox(width: Dimensions.width5,),
              Container(margin: const EdgeInsets.only(bottom: 3),child: BigText(text: ".",color: Colors.black26,),),
              SizedBox(width: Dimensions.width5,),
              Container(margin:const EdgeInsets.only(bottom: 2),child: SmallText(text: "Food Pairing",color: Colors.black26,)),




            ],),
        ),
        //list of food and Images
        SizedBox(height: Dimensions.height20,),
        ListView.builder(
            padding: const EdgeInsets.only(bottom: 10),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context,index){
          return Container(
            margin: EdgeInsets.only(bottom: Dimensions.height10,left: Dimensions.width20,right: Dimensions.width20),
            child: Row(
              children: [
              // Image Part
              Container(
                width: Dimensions.listImageSize,
                height: Dimensions.listImageSize,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white38,
                  image: const DecorationImage(
                      image: AssetImage("assets/image/food6.jpg"),
                      fit: BoxFit.cover),

                ),
              ),

              //right Text Part
              Expanded(
                child: Container(

                  height: Dimensions.listTextBoxSize,
                  decoration: BoxDecoration(
                    //border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.only( topRight: Radius.circular(Dimensions.radius20),bottomRight: Radius.circular(Dimensions.radius20)),
                    color: Colors.white,
                    ),
                  child: Padding(
                    padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: Dimensions.height8,),
                        BigText(text: "Extravaganza Burger with Double the Fillings"),
                        SizedBox(height: Dimensions.width5,),
                        Padding(
                          padding: EdgeInsets.only(left: Dimensions.width10),
                          child: SmallText(overFlow:TextOverflow.ellipsis,text: "with 2 times Veggies then before, A perfect burger with the goodness of spinach ,onion, Cabbage , Tomato etc."),
                        ),
                        SizedBox(height: Dimensions.width5,),
                         const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextAndIconWidget( icon: Icons.location_on,relativeSize: 0.8, text: "7.1 km", textColor: AppColor.textColor, iconColor:AppColor.mainColor, ),
                            TextAndIconWidget( icon: Icons.alarm,relativeSize:0.8, text: "24 min", textColor: AppColor.textColor, iconColor: Colors.black),
                            TextAndIconWidget( icon: Icons.monetization_on,relativeSize:0.8, text: "~\$70", textColor: AppColor.textColor, iconColor:Color.fromARGB(
                                255, 72, 184, 7) )
                          ],
                        ),


                      ],
                    ),
                  ),
                ),
              ),
            ],),
          );
        })
      ],
    );
  }

  Widget _buildPageItem(int index) {
    double height=Dimensions.pageViewContainerHeight;
    Matrix4 matrix4 =Matrix4.identity();
    if(index==_currPageValue.floor()){
      var currScale=1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans=height*(1-currScale)/2;
      matrix4 = Matrix4.diagonal3Values(1,currScale,1)..setTranslationRaw(0, currTrans, 0);
    }
    else if(index==_currPageValue.floor()+1){
      var currScale=_scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
      var currTrans=height*(1-currScale)/2;
      matrix4 = Matrix4.diagonal3Values(1,currScale,1)..setTranslationRaw(0, currTrans, 0);
    }
    else if(index==_currPageValue.floor()-1){
      var currScale=1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans=height*(1-currScale)/2;
      matrix4 = Matrix4.diagonal3Values(1,currScale,1)..setTranslationRaw(0, currTrans, 0);
    }
    else{
      var currScale=0.8;
      var currTrans=height*(1-currScale)/2;
      matrix4 = Matrix4.diagonal3Values(1,currScale,1)..setTranslationRaw(0, currTrans, 0);
    }
    return Transform(
      transform: matrix4,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainerHeight,

            margin: EdgeInsets.only(left: Dimensions.width15, right: Dimensions.width15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                image: const DecorationImage(
                    image: AssetImage(
                      "assets/image/food0.jpg",
                    ),
                    fit: BoxFit.cover)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(

              height: Dimensions.textViewContainerHeight,

              margin: EdgeInsets.only(left: Dimensions.width30, right: Dimensions.width30, bottom: Dimensions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 3.0,
                      color: Color(0xFFe8e8e8),
                      offset: Offset(0, 5)
                  ),
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0)
                  ),
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0)
                  )
                ],
                color: Colors.white,
              ),
              child: Container(
                padding: EdgeInsets.only(left: Dimensions.width15, right: Dimensions.width15, top: Dimensions.height15 ),
                child: const FoodHeader(text: "PizzaHub",),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
