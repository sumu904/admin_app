import 'package:flutter/material.dart';

import '../../../../util/colors.dart';
import '../../../../util/dimensions.dart';
import '../../../../util/styles.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:  Container(
            padding: EdgeInsets.only(left: 25,top: 25,right: 25),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Select language",style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeLarge,color: AppColors.black),),
                    SizedBox(height: 10,),
                    GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 15,crossAxisSpacing: 15,childAspectRatio: 2.2),
                      shrinkWrap: true,
                      //scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(width: 1,color: AppColors.grey8)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                child: Image.asset("assets/image/LangFlag_Hebrew.png"),
                                backgroundColor: Colors.white,
                              ),
                              SizedBox(height: 10,),
                              Text("Hebrew",style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeDefault,color: AppColors.black),),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(width: 1,color: AppColors.grey8)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                child: Image.asset("assets/image/LangFlag_Arabic.png"),
                                backgroundColor: Colors.white,
                              ),
                              SizedBox(height: 10,),
                              Text("Arabic",style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeDefault,color: AppColors.black),),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.secondaryLight,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(width: 1,color: Theme.of(context).primaryColor)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                child: Image.asset("assets/image/LangFlag_English.png"),
                                backgroundColor: Colors.white,
                              ),
                              SizedBox(height: 10,),
                              Text("English",style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeDefault,color: AppColors.black),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ]),
            )),
      ),
    );
  }
}
