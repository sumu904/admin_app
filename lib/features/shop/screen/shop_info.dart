import 'package:admin_app/common/widgets/custom_image.dart';
import 'package:admin_app/common/widgets/custom_text_field_widget.dart';
import 'package:admin_app/features/order/controllers/order_controller.dart';
import 'package:admin_app/features/order/domain/models/order_model.dart';
import 'package:admin_app/features/order/widget/order_details_widget.dart';
import 'package:admin_app/features/settings/screen/settings_page.dart';
import 'package:admin_app/helper/string_formater.dart';
import 'package:admin_app/util/colors.dart';
import 'package:admin_app/util/dimensions.dart';
import 'package:admin_app/util/images.dart';
import 'package:admin_app/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';


class ShopInfoScreen extends StatefulWidget {
    ShopInfoScreen({super.key});

  @override
  State<ShopInfoScreen> createState() => _ShopInfoScreenState();
}

class _ShopInfoScreenState extends State<ShopInfoScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isSwitched = false;
  double rating = 3;
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return   Scaffold(
      key: _scaffoldKey,
      endDrawer: Container(
        width: 358,
        child: Drawer(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                bottomLeft: Radius.circular(0)),
          ),
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8),bottomRight: Radius.circular(8)),
                          child: Image.asset("assets/image/IMG.png",fit: BoxFit.cover,)),
                      Positioned(
                          bottom: 310,
                          left: 20,
                          child: InkWell(
                            onTap: (){
                              Get.back();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Theme.of(context).hintColor.withOpacity(0.1), width: 1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.all(8),
                              child: const Icon(Icons.arrow_back, size: 20),
                            ),
                          ),)
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                              Text("Double Whooper",style: robotoBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge),),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                                decoration: BoxDecoration(
                                    color: AppColors.yellow,
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.star,color: Colors.black,size: 16,),
                                    SizedBox(width: 8,),
                                    Text("4.85",style: robotoMedium,)
                                  ],
                                ),
                              ),
                          ],
                        ),
                        Text("\$5.65",style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeDefault,color: Theme.of(context).primaryColor),),
                        SizedBox(height: 10,),
                    ReadMoreText(
                      'Flame-grilled beef patties with juicy tomatoes, crisp lettuce, creamy mayonnaise ketchup.',textAlign: TextAlign.justify,
                      trimMode: TrimMode.Line,
                      trimLines: 1,
                      colorClickableText: Theme.of(context).primaryColor,
                      trimCollapsedText: 'Read more',
                      trimExpandedText: 'Read less',
                      moreStyle: robotoRegular.copyWith(fontSize: Dimensions.fontSizeDefault,fontWeight: FontWeight.w700),
                    ),
                        //Text("Flame-grilled beef patties with juicy tomatoes, crisp lettuce, creamy mayonnaise ketchup... Read more",style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall),),
                        SizedBox(height: 15,),
                        Container(
                          height: size.height*0.14,
                          width: size.width*0.328,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(width: 1,color: AppColors.grey8)
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 12,top: 8,right: 12,bottom: 4),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Available",style: robotoBold.copyWith(fontSize: Dimensions.fontSizeSmall),),
                                    Row(
                                      children: [
                                        Container(
                                            //margin: EdgeInsets.only(left: 20),
                                            //padding: EdgeInsets.only(left: 20,bottom: 10,top: 10),
                                            child:CustomSwitch(
                                              value: isSwitched,
                                              onChanged: (value){
                                                setState(() {
                                                  isSwitched=!isSwitched;
                                                });
                                              },
                                              width: 52,
                                              height: 30,
                                              enableColor: Theme.of(context).primaryColor,
                                              disableColor: AppColors.grey8,
                                              switchHeight: 50,switchWidth: 27,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Divider(color: AppColors.grey8,),
                              Padding(
                                padding: EdgeInsets.only(left: 12,top: 4,right: 12,bottom: 6),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Recommended",style: robotoBold.copyWith(fontSize: Dimensions.fontSizeSmall),),
                                    Row(
                                      children: [
                                        Container(
                                          //margin: EdgeInsets.only(left: 20),
                                          //padding: EdgeInsets.only(left: 20,bottom: 10,top: 10),
                                            child:CustomSwitch(
                                              value: isSwitched,
                                              onChanged: (value){
                                                setState(() {
                                                  isSwitched=!isSwitched;
                                                });
                                              },
                                              width: 52,
                                              height: 30,
                                              enableColor: Theme.of(context).primaryColor,
                                              disableColor: AppColors.grey8,
                                              switchHeight: 50,switchWidth: 27,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15,),
                        Text("Variations",style: robotoBold.copyWith(fontSize: Dimensions.fontSizeDefault),),
                        SizedBox(height: 10,),
                        Text("Roast beef/Asado",style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeDefault,color: AppColors.grey3),),
                        SizedBox(height: 10,),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.grey9)
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 10,
                                    child: Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.grey10,
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(8)),
                                        ),
                                        padding: EdgeInsets.only(left: 20,bottom: 10,top: 10),
                                        child: Text("Items",style: robotoRegular.copyWith(color: AppColors.grey3),)),
                                  ), Expanded(
                                    flex: 5,
                                    child: Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.grey10,
                                          borderRadius: BorderRadius.only(topRight: Radius.circular(8)),
                                        ),
                                        padding: EdgeInsets.only(left: 20,bottom: 10,top: 10),
                                        child: Text("Available",style: robotoRegular.copyWith(color: AppColors.grey3),)),
                                  ),
                                ],
                              ),
                              //drawer done
                              Padding(
                                padding: EdgeInsets.only(left: 20,bottom: 5,top: 10,right: 35),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Roast beef",style: robotoBold.copyWith(fontSize: Dimensions.fontSizeSmall),),
                                    Row(
                                      children: [
                                        Container(
                                          //margin: EdgeInsets.only(left: 20),
                                          //padding: EdgeInsets.only(left: 20,bottom: 10,top: 10),
                                            child:CustomSwitch(
                                              value: isSwitched,
                                              onChanged: (value){
                                                setState(() {
                                                  isSwitched=!isSwitched;
                                                });
                                              },
                                              width: 52,
                                              height: 30,
                                              enableColor: Theme.of(context).primaryColor,
                                              disableColor: AppColors.grey8,
                                              switchHeight: 50,switchWidth: 27,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Divider(color: AppColors.grey8,),
                              Padding(
                                padding: EdgeInsets.only(left: 20,bottom: 10,top: 5,right: 35),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Asado",style: robotoBold.copyWith(fontSize: Dimensions.fontSizeSmall),),
                                    Row(
                                      children: [
                                        Container(
                                          //margin: EdgeInsets.only(left: 20),
                                          //padding: EdgeInsets.only(left: 20,bottom: 10,top: 10),
                                            child:CustomSwitch(
                                              value: isSwitched,
                                              onChanged: (value){
                                                setState(() {
                                                  isSwitched=!isSwitched;
                                                });
                                              },
                                              width: 52,
                                              height: 30,
                                              enableColor: Theme.of(context).primaryColor,
                                              disableColor: AppColors.grey8,
                                              switchHeight: 50,switchWidth: 27,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15,),
                        Text("Degree of action",style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeDefault,color: AppColors.grey3),),
                        SizedBox(height: 10,),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: AppColors.grey9)
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 10,
                                    child: Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.grey10,
                                          borderRadius: BorderRadius.only(topLeft: Radius.circular(8)),
                                        ),
                                        padding: EdgeInsets.only(left: 20,bottom: 10,top: 10),
                                        child: Text("Items",style: robotoRegular.copyWith(color: AppColors.grey3),)),
                                  ), Expanded(
                                    flex: 5,
                                    child: Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.grey10,
                                          borderRadius: BorderRadius.only(topRight: Radius.circular(8)),
                                        ),
                                        padding: EdgeInsets.only(left: 20,bottom: 10,top: 10),
                                        child: Text("Available",style: robotoRegular.copyWith(color: AppColors.grey3),)),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20,bottom: 5,top: 10,right: 35),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Raw",style: robotoBold.copyWith(fontSize: Dimensions.fontSizeSmall),),
                                    Row(
                                      children: [
                                        Container(
                                          //margin: EdgeInsets.only(left: 20),
                                          //padding: EdgeInsets.only(left: 20,bottom: 10,top: 10),
                                            child:CustomSwitch(
                                              value: isSwitched,
                                              onChanged: (value){
                                                setState(() {
                                                  isSwitched=!isSwitched;
                                                });
                                              },
                                              width: 52,
                                              height: 30,
                                              enableColor: Theme.of(context).primaryColor,
                                              disableColor: AppColors.grey8,
                                              switchHeight: 50,switchWidth: 27,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Divider(color: AppColors.grey8,),
                              Padding(
                                padding: EdgeInsets.only(left: 20,bottom: 5,top: 5,right: 35),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Medium",style: robotoBold.copyWith(fontSize: Dimensions.fontSizeSmall),),
                                    Row(
                                      children: [
                                        Container(
                                          //margin: EdgeInsets.only(left: 20),
                                          //padding: EdgeInsets.only(left: 20,bottom: 10,top: 10),
                                            child:CustomSwitch(
                                              value: isSwitched,
                                              onChanged: (value){
                                                setState(() {
                                                  isSwitched=!isSwitched;
                                                });
                                              },
                                              width: 52,
                                              height: 30,
                                              enableColor: Theme.of(context).primaryColor,
                                              disableColor: AppColors.grey8,
                                              switchHeight: 50,switchWidth: 27,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Divider(color: AppColors.grey8,),
                              Padding(
                                padding: EdgeInsets.only(left: 20,bottom: 5,top: 5,right: 35),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Well",style: robotoBold.copyWith(fontSize: Dimensions.fontSizeSmall),),
                                    Row(
                                      children: [
                                        Container(
                                          //margin: EdgeInsets.only(left: 20),
                                          //padding: EdgeInsets.only(left: 20,bottom: 10,top: 10),
                                            child:CustomSwitch(
                                              value: isSwitched,
                                              onChanged: (value){
                                                setState(() {
                                                  isSwitched=!isSwitched;
                                                });
                                              },
                                              width: 52,
                                              height: 30,
                                              enableColor: Theme.of(context).primaryColor,
                                              disableColor: AppColors.grey8,
                                              switchHeight: 50,switchWidth: 27,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Divider(color: AppColors.grey8,),
                              Padding(
                                padding: EdgeInsets.only(left: 20,bottom: 10,top: 5,right: 35),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Well Done",style: robotoBold.copyWith(fontSize: Dimensions.fontSizeSmall),),
                                    Row(
                                      children: [
                                        Container(
                                          //margin: EdgeInsets.only(left: 20),
                                          //padding: EdgeInsets.only(left: 20,bottom: 10,top: 10),
                                            child:CustomSwitch(
                                              value: isSwitched,
                                              onChanged: (value){
                                                setState(() {
                                                  isSwitched=!isSwitched;
                                                });
                                              },
                                              width: 52,
                                              height: 30,
                                              enableColor: Theme.of(context).primaryColor,
                                              disableColor: AppColors.grey8,
                                              switchHeight: 50,switchWidth: 27,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15,),
                        Divider(color: AppColors.grey8,),
                        SizedBox(height: 25,),
                        Text("Add-ons",style: robotoBold.copyWith(fontSize: Dimensions.fontSizeDefault),),
                        SizedBox(height: 10,),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: AppColors.grey9)
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 10,
                                    child: Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.grey10,
                                          borderRadius: BorderRadius.only(topLeft: Radius.circular(8)),
                                        ),
                                        padding: EdgeInsets.only(left: 20,bottom: 10,top: 10),
                                        child: Text("Items",style: robotoRegular.copyWith(color: AppColors.grey3),)),
                                  ), Expanded(
                                    flex: 5,
                                    child: Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.grey10,
                                          borderRadius: BorderRadius.only(topRight: Radius.circular(8)),
                                        ),
                                        padding: EdgeInsets.only(left: 20,bottom: 10,top: 10),
                                        child: Text("Available",style: robotoRegular.copyWith(color: AppColors.grey3),)),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20,top: 10,right: 35),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Cheese",style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeDefault),),
                                        Row(
                                          children: [
                                            Container(
                                              //margin: EdgeInsets.only(left: 20),
                                              //padding: EdgeInsets.only(top: 10),
                                                child:CustomSwitch(
                                                  value: isSwitched,
                                                  onChanged: (value){
                                                    setState(() {
                                                      isSwitched=!isSwitched;
                                                    });
                                                  },
                                                  width: 52,
                                                  height: 30,
                                                  enableColor: Theme.of(context).primaryColor,
                                                  disableColor: AppColors.grey8,
                                                  switchHeight: 50,switchWidth: 27,
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Text("\$0.75",style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall,color: AppColors.grey4),),
                                  ],
                                ),
                              ),
                              Divider(color: AppColors.grey8,),
                              Padding(
                                padding: EdgeInsets.only(left: 20,top: 5,right: 35),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Mushrooms",style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeDefault),),
                                        Row(
                                          children: [
                                            Container(
                                              //margin: EdgeInsets.only(left: 20),
                                              //padding: EdgeInsets.only(left: 20,bottom: 10,top: 10),
                                                child:CustomSwitch(
                                                  value: isSwitched,
                                                  onChanged: (value){
                                                    setState(() {
                                                      isSwitched=!isSwitched;
                                                    });
                                                  },
                                                  width: 52,
                                                  height: 30,
                                                  enableColor: Theme.of(context).primaryColor,
                                                  disableColor: AppColors.grey8,
                                                  switchHeight: 50,switchWidth: 27,
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Text("\$0.75",style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall,color: AppColors.grey4),),
                                  ],
                                ),
                              ),
                              Divider(color: AppColors.grey8,),
                              Padding(
                                padding: EdgeInsets.only(left: 20,bottom: 5,top: 5,right: 35),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Onions",style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeDefault),),
                                        Row(
                                          children: [
                                            Container(
                                              //margin: EdgeInsets.only(left: 20),
                                              //padding: EdgeInsets.only(left: 20,bottom: 10,top: 10),
                                                child:CustomSwitch(
                                                  value: isSwitched,
                                                  onChanged: (value){
                                                    setState(() {
                                                      isSwitched=!isSwitched;
                                                    });
                                                  },
                                                  width: 52,
                                                  height: 30,
                                                  enableColor: Theme.of(context).primaryColor,
                                                  disableColor: AppColors.grey8,
                                                  switchHeight: 50,switchWidth: 27,
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Text("\$0.75",style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall,color: AppColors.grey4),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        leadingWidth: 250,
        backgroundColor: Theme.of(context).textTheme.bodyLarge!.color?.withOpacity(0.85),
        leading: Padding(
          padding:   EdgeInsets.all(Dimensions.paddingSizeSmall),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.menu, color: Theme.of(context).cardColor),
              ),
              SizedBox(width: 20,),
              Image.asset(Images.logo, height: 30, width: 30),
              SizedBox(width: 10,),
              Text(
                "1Moment",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: robotoMedium.copyWith(
                  color: Theme.of(context).cardColor,
                  fontSize: Dimensions.fontSizeDefault,
                ),
              ),
            ],
          ),
        ),
        titleSpacing: 0,
        elevation: 0,

        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.message, color: Theme.of(context).cardColor),
          ),
          IconButton(
            onPressed: () {
              Get.to(SettingsPage());
            },
            icon: Icon(Icons.settings, color: Theme.of(context).cardColor),
          ),SizedBox(width: 20,),
        ],
      ),
      body: Container(
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: AppColors.grey8,
                      width: 1.5,
                    ),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                  
                    children: [
                      
                       Container(
                        height: 305,
                        child: Stack(
                          children: [
                            Image.asset("assets/image/cover.png",height: 250,fit: BoxFit.cover,),
                            Positioned(
                                bottom: 0,
                                left: 30,
                                child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(image: AssetImage("assets/image/burger_king.png"))
                              ),
                            ))
                          ],
                        ),
                      ),
                  
                      Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Burger King",style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeOverLarge),),
                          SizedBox(height: 6,),
                          Text("Flame-grilled beef patties with juicy tomatoes, crisp lettuce, creamy mayonnaise ketchup.",style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeDefault,color: AppColors.grey4),),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Reviews",style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeLarge),),
                  
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                                decoration: BoxDecoration(
                                  color: AppColors.yellow,
                                  borderRadius: BorderRadius.circular(15)
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.star,color: Colors.black,size: 16,),
                                    SizedBox(width: 8,),
                                    Text("4.85",style: robotoMedium,)
                  
                                  ],
                                ),
                              )
                  
                            ],
                          )
                        ],
                      ),
                      ),
                  
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: 10,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context,index){
                  
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 16,vertical: 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: AppColors.grey8,
                              width: 1.3
                            )
                          ),
                          padding: EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                                decoration: BoxDecoration(
                                    color: AppColors.grey10,
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset("assets/image/burger.png",height: 30,width: 30,fit: BoxFit.cover,),
                                    SizedBox(width: 8,),
                                    Text("Double Wrapper",style: robotoMedium,),



                                  ],
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4),
                                child: PannableRatingBar(
                                  rate: rating,
                                  items: List.generate(5, (index) =>
                                  const RatingWidget(
                                    selectedColor: Colors.yellow,
                                    unSelectedColor: Colors.grey,
                                    child: Icon(
                                      Icons.star,
                                      size: 16,
                                    ),
                                  )),
                                  onChanged: (value) { // the rating value is updated on tap or drag.
                                    setState(() {
                                      rating = value;
                                    });
                                  },
                                ),
                              ),
                              Text("Really like the item",style: robotoMedium,),
                              Text("Ayal . 15 Aug 24",style: robotoMedium.copyWith(color: AppColors.grey5),),


                            ],
                          ),
                        );
                      })
                  
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 11,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(top: 40,left: 20,right: 20,bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Food Items",style: robotoBold.copyWith(fontSize: Dimensions.fontSizeOverLarge),),
                        Text("Total 45 items",style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeDefault,color: AppColors.grey4),),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            SizedBox(
                              width: size.width*0.25,
                              height: 40,
                              child: TextField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.search_outlined,color: AppColors.grey7,),
                                  filled: true,
                                  fillColor: AppColors.grey10,
                                  hintText: 'Search here',
                                  hintStyle: robotoRegular.copyWith(fontSize: Dimensions.fontSizeDefault,color: AppColors.grey4),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                    borderSide: BorderSide(
                                      color: AppColors.grey8,
                                      width: 1.3,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                    borderSide: BorderSide(
                                      color: AppColors.grey8,
                                      width: 1.3,
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
                
                                ),)
                            ),
                
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                  border: Border.all(
                                  color: AppColors.grey8,
                                  width: 1.3,
                                )
                              ),
                              child: InkWell(
                                onTap: (){},
                                child: Row(
                                  children: [
                                    Icon(Icons.filter_list,color: AppColors.grey6,),
                                    SizedBox(width: 8,),
                                    Text("Filter",style: robotoBold,)
                                  ],
                                ),
                              ),
                            ),
                            Spacer(),
                
                            Container(
                              margin: EdgeInsets.only(right: 20),
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                  border: Border.all(
                                    color: AppColors.grey8,
                                    width: 1.3,
                                  )
                              ),
                              child: InkWell(
                                onTap: (){},
                                child: Row(
                                  children: [
                                    Icon(Icons.account_balance,color: AppColors.grey6,),
                                    SizedBox(width: 8,),
                                    Text("MultiSelect",style: robotoBold,)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    ),
                
                
                    Row(
                      children: [
                        Expanded(
                          flex: 10,
                          child: Container(
                            padding: EdgeInsets.only(left: 20,bottom: 10,top: 10),
                              color: AppColors.grey10,
                            child: Text("Items",style: robotoRegular.copyWith(color: AppColors.grey3),)),
                        ), Expanded(
                          flex: 5,
                          child: Container(
                            padding: EdgeInsets.only(left: 20,bottom: 10,top: 10),
                              color: AppColors.grey10,
                            child: Text("Available",style: robotoRegular.copyWith(color: AppColors.grey3),)),
                        ), Expanded(
                          flex: 5,
                          child: Container(
                            padding: EdgeInsets.only(left: 20,bottom: 10,top: 10),
                              color: AppColors.grey10,
                            child: Text("Recommended",style: robotoRegular.copyWith(color: AppColors.grey3),)),
                        ),
                      ],
                    ),
                
                
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: 50,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context,index){
                      return Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 10,
                                child: InkWell(
                                  onTap: (){_scaffoldKey.currentState!.openEndDrawer();},
                                  child: ListTile(
                                    leading: Container(
                                    //  height: 45,width: 45,
                                    /*  decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1.3,
                                          color: AppColors.grey5
                                        ),
                                      ),*/
                                      child: Image.asset("assets/image/burger.png"),
                                    ),
                                    title: Text("Double Whooper",style: robotoMedium,),
                                    subtitle: Text("\$5.65",style: robotoMedium.copyWith(color: AppColors.grey5),),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Row(
                                  children: [
                                    Container(
                                        padding: EdgeInsets.only(left: 20,bottom: 10,top: 10),
                                        child:CustomSwitch(
                                          value: isSwitched,
                                          onChanged: (value){
                                           setState(() {
                                             isSwitched=!isSwitched;
                                           });
                                          },
                                          width: 52,
                                          height: 30,
                                          enableColor:Theme.of(context).primaryColor,
                                          disableColor: AppColors.grey8,
                                          switchHeight: 50,switchWidth: 27,
                                        )),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 20),
                                        padding: EdgeInsets.only(left: 20,bottom: 10,top: 10),
                                        child:CustomSwitch(
                                          value: isSwitched,
                                          onChanged: (value){
                                            setState(() {
                                              isSwitched=!isSwitched;
                                            });
                                          },
                                          width: 52,
                                          height: 30,
                                          enableColor: Theme.of(context).primaryColor,
                                          disableColor: AppColors.grey8,
                                          switchHeight: 50,switchWidth: 27,
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          const Divider(
                            height: 0,color: AppColors.grey8,
                          )
                        ],
                      );
                
                    })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSwitch extends StatefulWidget {
  final bool  value;
  final Color? enableColor;
  final Color ?disableColor;
  final double ?width;
  final double ?height;
  final double ?switchHeight;
  final double? switchWidth;
  final ValueChanged<bool>  onChanged;

  CustomSwitch({

  required  this.value,
    this.enableColor,
    this.disableColor,
    this.width,
    this.height,
    this.switchHeight,
    this.switchWidth,
    required   this.onChanged}) ;

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  Animation? _circleAnimation;
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 60));
    _circleAnimation = AlignmentTween(
        begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
        end: widget.value ? Alignment.centerLeft :Alignment.centerRight).animate(CurvedAnimation(
        parent: _animationController!, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController!,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController!.isCompleted) {
              _animationController!.reverse();
            } else {
              _animationController!.forward();
            }
            widget.value == false ? widget.onChanged(true) : widget.onChanged(false);
          },
          child: Container(
            width: widget.width ?? 48.0,
            height: widget.height ?? 24.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              color: _circleAnimation!.value ==  Alignment.centerLeft ? widget.disableColor : widget.enableColor,),
            child: Padding(padding: const EdgeInsets.only(top: 2.0, bottom: 2.0, right: 2.0, left: 2.0),
              child:  Container(
                alignment: widget.value ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  width: widget.switchWidth ?? 20.0,
                  height: widget.switchHeight ?? 20.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}