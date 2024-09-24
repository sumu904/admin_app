import 'package:flutter/material.dart';

import '../../../../util/colors.dart';
import '../../../../util/dimensions.dart';
import '../../../../util/styles.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({super.key});

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25,vertical: 25),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Order History",style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeLarge,color: AppColors.black),),
              SizedBox(height: 10,),
              Row(
                children: [
                  Container(
                    height: size.height*0.15,
                    width: size.width*0.20,
                    padding: EdgeInsets.only(top: 30,left: 20),
                    margin: EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                        color: AppColors.grey8,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Today’s orders",style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall,color: AppColors.grey3),),
                        Text("23",style: robotoMedium.copyWith(fontSize: 35,color: AppColors.grey3),),
                      ],
                    ),
                  ),
                  Container(
                    height: size.height*0.15,
                    width: size.width*0.20,
                    padding: EdgeInsets.only(top: 30,left: 20),
                    margin: EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                        color: AppColors.grey8,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("This week’s orders",style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall,color: AppColors.grey3),),
                        Text("164",style: robotoMedium.copyWith(fontSize: 35,color: AppColors.grey3),),
                      ],
                    ),
                  ),
                  Container(
                    height: size.height*0.15,
                    width: size.width*0.20,
                    padding: EdgeInsets.only(top: 30,left: 20),
                    decoration: BoxDecoration(
                        color: AppColors.grey8,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("This month’s orders",style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall,color: AppColors.grey3),),
                        Text("678",style: robotoMedium.copyWith(fontSize: 35,color: AppColors.grey3),),
                      ],
                    ),
                  )
                ],
              ),
              /* ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: 5,
                            itemBuilder: (context,index){
                              return Column(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    color: Colors.red,
                                  ),
                                  Container(
                                    height: 100,
                                    width: 100,
                                    color: Colors.blue,
                                  ),
                                  Container(
                                    height: 100,
                                    width: 100,
                                    color: Colors.yellow,
                                  ),
                                ],
                              );
                            }),*/
            ]),
      ),
    );
  }
}
