import 'package:flutter/material.dart';

import '../../../../util/colors.dart';
import '../../../../util/dimensions.dart';
import '../../../../util/styles.dart';

class HelpSupportPage extends StatefulWidget {
  const HelpSupportPage({super.key});

  @override
  State<HelpSupportPage> createState() => _HelpSupportPageState();
}

class _HelpSupportPageState extends State<HelpSupportPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body:        Container(
        padding: EdgeInsets.symmetric(horizontal: 25,vertical: 25),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Help & Support",style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeLarge,color: AppColors.black),),
              SizedBox(height: 10,),
              Row(
                children: [
                  Container(
                    height: size.height*0.175,
                    width: size.width*0.20,
                    margin: EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(width: 1,color: AppColors.grey8)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 25,
                          child: Image.asset("assets/image/Phone.png",),
                        ),
                        SizedBox(height: 14,),
                        Text("Call",style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeDefault,color: AppColors.black),),
                        SizedBox(height: 1,),
                        Text("+972 52-509-5302",style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeDefault,color: AppColors.black),),
                      ],
                    ),
                  ),
                  Container(
                    height: size.height*0.175,
                    width: size.width*0.20,
                    margin: EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(width: 1,color: AppColors.grey8)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 25,
                          child: Image.asset("assets/image/Email.png",),
                        ),
                        SizedBox(height: 14,),
                        Text("Email",style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeDefault,color: AppColors.black),),
                        SizedBox(height: 1,),
                        Text("one.moment.tech@gmail.com",style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeDefault,color: AppColors.black),),
                      ],
                    ),
                  ),
                  Container(
                    height: size.height*0.175,
                    width: size.width*0.20,
                    margin: EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(width: 1,color: AppColors.grey8)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 25,
                          child: Image.asset("assets/image/Message.png",),
                        ),
                        SizedBox(height: 14,),
                        Text("Live Chat",style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeDefault,color: AppColors.black),),
                        SizedBox(height: 1,),
                        Text("Talk with us real time",style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeDefault,color: AppColors.black),),
                      ],
                    ),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
