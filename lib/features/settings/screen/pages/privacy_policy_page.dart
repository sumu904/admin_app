import 'package:flutter/material.dart';

import '../../../../util/colors.dart';
import '../../../../util/dimensions.dart';
import '../../../../util/styles.dart';

class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({super.key});

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        padding: EdgeInsets.symmetric(horizontal: 25,vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Privacy Policy",style: robotoBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge,color: AppColors.black),),
            SizedBox(height: 10,),
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting.",textAlign: TextAlign.justify,maxLines: 10,style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeDefault,color: AppColors.grey3),),
            SizedBox(height: 15,),
            Text("This is a point",style: robotoBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge,color: AppColors.black),),
            SizedBox(height: 10,),
            Row(
              children: [
                Image.asset("assets/image/dot.png",height: 20,width: 20,),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.",textAlign: TextAlign.justify,style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeDefault,color: AppColors.grey3),),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Image.asset("assets/image/dot.png",height: 20,width: 20,),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",textAlign: TextAlign.justify,maxLines: 2,overflow: TextOverflow.ellipsis,style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeDefault,color: AppColors.grey3),),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Image.asset("assets/image/dot.png",height: 20,width: 20,),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("It has survived not only five centuries, but also the leap into electronic typesetting.",maxLines: 2,textAlign:TextAlign.justify,style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeDefault,color: AppColors.grey3),),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15,),
            Text("This is a point",style: robotoBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge,color: AppColors.black),),
            SizedBox(height: 10,),
            Row(
              children: [
                Image.asset("assets/image/dot.png",height: 20,width: 20,),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.",textAlign: TextAlign.justify,style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeDefault,color: AppColors.grey3),),
                ),
              ],
            ),
            Row(
              children: [
                Image.asset("assets/image/dot.png",height: 20,width: 20,),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",textAlign: TextAlign.justify,maxLines: 2,style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeDefault,color: AppColors.grey3),),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Image.asset("assets/image/dot.png",height: 20,width: 20,),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("It has survived not only five centuries, but also the leap into electronic typesetting.",textAlign: TextAlign.justify,maxLines: 2,style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeDefault,color: AppColors.grey3),),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
