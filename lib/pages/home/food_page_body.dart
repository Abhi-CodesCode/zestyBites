import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:zestybites/api/food_item.dart';
import 'package:zestybites/utils/app_color.dart';
import 'package:zestybites/utils/dimensions.dart';
import 'package:zestybites/widgets/big_text.dart';
import 'package:zestybites/widgets/carousel_navigator_object.dart';
import 'package:zestybites/widgets/food_header.dart';
import 'package:zestybites/widgets/list_navigator_object.dart';
import 'package:zestybites/widgets/small_text.dart';
import 'package:zestybites/widgets/text_and_icon_widget.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {

  FoodItem foodItemService = FoodItem();
  int foodItemLength=1;
  late List<dynamic> snapshotData=[];

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
        SizedBox(
          //color: Colors.red,
            height: Dimensions.fullPageBodyHeight,
            child:FutureBuilder<List>(future: foodItemService.getAllFoodItem(),

              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return const Center(child: CircularProgressIndicator()); // Show a loading indicator while waiting for data.
                }
                snapshotData=snapshot.data!;
                foodItemLength=snapshot.data!.length;
                //print(snapshot.data);
                if(snapshot.hasData){
                  return PageView.builder(
                      controller: pageController,
                      itemCount: foodItemLength,
                      itemBuilder: (context, position) {
                        return CarouselNavigatorObject(pageData: snapshotData[position],
                        child: _buildPageItem(position,snapshot));
                      }
                  );

                }else{
                  return const Center(
                      child: Text("No Data found")
                  );

                }
              },

            )

        ),
        DotsIndicator(
          dotsCount: foodItemLength,
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
          itemCount: foodItemLength, // Use the foodItemLength variable
          itemBuilder: (context, index) {
            if (snapshotData.isEmpty) {
              return const Center(child: CircularProgressIndicator()); // Show a loading indicator while waiting for data.
            }
            return ListNavigatorObject(
              pageData: snapshotData[index],
              child: Container(
                margin: EdgeInsets.only(bottom: Dimensions.height10, left: Dimensions.width20, right: Dimensions.width20),
                child: Row(
                  children: [
                    // Image Part
                    Container(
                      width: Dimensions.listImageSize,
                      height: Dimensions.listImageSize,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white38,
                        image: DecorationImage(
                          image: NetworkImage(snapshotData[index]['image'].replaceFirst("http://127.0.0.1:8000/","http://10.0.2.2:8000/")),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Right Text Part
                    Expanded(
                      child: Container(
                        height: Dimensions.listTextBoxSize,
                        padding: EdgeInsets.only(top: Dimensions.height15*0.7),
                        decoration: BoxDecoration(
                          boxShadow: const [BoxShadow(
                              blurRadius: 3.0,
                              color: Color(0xFFe8e8e8),
                              offset: Offset(0, 5)
                          ),
                            BoxShadow(
                                blurRadius: 3.0,
                                color: Color(0xFFe8e8e8),
                                offset: Offset(5, 0)
                            ),
                          ],
                          borderRadius: BorderRadius.only(topRight: Radius.circular(Dimensions.radius20), bottomRight: Radius.circular(Dimensions.radius20)),
                          color: Colors.white,
                        ),
                        child: FoodHeader(data:snapshotData[index],iconSize: 0.8,bigTextSize: 0.8,),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        )
      ],
    );
  }

  Widget _buildPageItem(int index,var snapshot) {
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
                image:  DecorationImage(
                    image: NetworkImage(snapshotData[index]['image'].replaceFirst("http://127.0.0.1:8000/","http://10.0.2.2:8000/")),
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
                child:  FoodHeader(data:snapshotData[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}