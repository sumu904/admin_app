import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../util/colors.dart';
import '../../../../util/dimensions.dart';
import '../../../../util/images.dart';
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
        padding: EdgeInsets.only(left: 25,top: 25,right: 50,bottom: 25),
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
                        color: AppColors.grey10,
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
                        color: AppColors.grey10,
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
                        color: AppColors.grey10,
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
              SizedBox(height: 30,),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10,top: 20,right: 70,bottom: 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Order #204",
                                style: robotoBold.copyWith(fontSize: Dimensions.fontSizeDefault),
                              ),
                              const Spacer(),
                              Text(
                                "10:00 PM, 12 August 2024",
                                style: robotoRegular.copyWith(color: AppColors.grey5, fontSize: Dimensions.fontSizeSmall),
                              ),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 1),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  border: Border.all(color: Theme.of(context).primaryColor, width: 1),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Text("Delivery",
                                  style: robotoRegular.copyWith(color: Theme.of(context).primaryColor,fontSize: Dimensions.fontSizeSmall),
                                ),
                              ),
                              const SizedBox(width: 7),
                              Padding(
                                padding: const EdgeInsets.only(left: 4, right: 12),
                                child: CircleAvatar(backgroundColor: Theme.of(context).textTheme.bodyLarge?.color, maxRadius: 2),
                              ),

                              Image.asset(Images.cash, height: 15),
                              const SizedBox(width: 8),

                              Text("Cash Payment",
                                style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall),
                              ),
                            ],
                          ),
                          SizedBox(height: 7,),
                          Row(
                            children: [
                              Icon(Icons.person_2_outlined,size: 20,),
                              const SizedBox(width: 5),
                              Text("Customer Name",style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall)),
                            ],
                          )
                        ],
                      ),
                    ),
                    Divider(indent: 10,endIndent: 70,color: AppColors.grey9,),
                    Container(
                      padding: EdgeInsets.only(left: 10,top: 20,right: 70,bottom: 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Order #204",
                                style: robotoBold.copyWith(fontSize: Dimensions.fontSizeDefault),
                              ),
                              const Spacer(),
                              Text(
                                "10:00 PM, 12 August 2024",
                                style: robotoRegular.copyWith(color: AppColors.grey5, fontSize: Dimensions.fontSizeSmall),
                              ),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 1),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  border: Border.all(color: Theme.of(context).primaryColor, width: 1),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Text("Pickup",
                                  style: robotoRegular.copyWith(color: Theme.of(context).primaryColor,fontSize: Dimensions.fontSizeSmall),
                                ),
                              ),
                              const SizedBox(width: 7),
                              Padding(
                                padding: const EdgeInsets.only(left: 4, right: 12),
                                child: CircleAvatar(backgroundColor: Theme.of(context).textTheme.bodyLarge?.color, maxRadius: 2),
                              ),

                              Image.asset(Images.card, height: 20),
                              const SizedBox(width: 10),

                              Text("Cash Payment",
                                style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall),
                              ),
                            ],
                          ),
                          SizedBox(height: 7,),
                          Row(
                            children: [
                              Icon(Icons.person_2_outlined,size: 20,),
                              const SizedBox(width: 5),
                              Text("Customer Name",style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall)),
                            ],
                          )
                        ],
                      ),
                    ),
                    Divider(indent: 10,endIndent: 70,color: AppColors.grey9,),
                    Container(
                      padding: EdgeInsets.only(left: 10,top: 20,right: 70,bottom: 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Order #204",
                                style: robotoBold.copyWith(fontSize: Dimensions.fontSizeDefault),
                              ),
                              const Spacer(),
                              Text(
                                "10:00 PM, 12 August 2024",
                                style: robotoRegular.copyWith(color: AppColors.grey5, fontSize: Dimensions.fontSizeSmall),
                              ),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 1),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  border: Border.all(color: Theme.of(context).primaryColor, width: 1),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Text("Delivery",
                                  style: robotoRegular.copyWith(color: Theme.of(context).primaryColor,fontSize: Dimensions.fontSizeSmall),
                                ),
                              ),
                              const SizedBox(width: 7),
                              Padding(
                                padding: const EdgeInsets.only(left: 4, right: 12),
                                child: CircleAvatar(backgroundColor: Theme.of(context).textTheme.bodyLarge?.color, maxRadius: 2),
                              ),

                              Image.asset(Images.cash, height: 15),
                              const SizedBox(width: 10),

                              Text("Cash Payment",
                                style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall),
                              ),
                            ],
                          ),
                          SizedBox(height: 7,),
                          Row(
                            children: [
                              Icon(Icons.person_2_outlined,size: 20,),
                              const SizedBox(width: 5),
                              Text("Customer Name",style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall)),
                            ],
                          )
                        ],
                      ),
                    ),
                    Divider(indent: 10,endIndent: 70,color: AppColors.grey9,),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
