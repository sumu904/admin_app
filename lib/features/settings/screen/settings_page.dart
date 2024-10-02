import 'package:admin_app/features/order/domain/models/settings_model.dart';
import 'package:admin_app/features/settings/screen/pages/help_support_page.dart';
import 'package:admin_app/features/settings/screen/pages/language_page.dart';
import 'package:admin_app/features/settings/screen/pages/privacy_policy_page.dart';
import 'package:admin_app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/dimensions.dart';
import '../../../util/styles.dart';
import 'pages/order_history_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int selectedIndex = 0;
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
        Padding(
        padding: EdgeInsets.only(left: 30, bottom: 15),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).hintColor.withOpacity(0.1),
                      width: 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(8),
                child: const Icon(Icons.arrow_back, size: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Settings",
                style: robotoMedium.copyWith(
                    fontSize: Dimensions.fontSizeExtraLarge,
                    fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
      Divider(
        thickness: 1,
        height: 0,
        color: AppColors.grey9,
      ),
        Expanded(
          child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      padding: EdgeInsets.only(left: 20,top: 25,right: 15),
                      child: ListView.builder(
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: (){
                                setState(() {
                                  selectedIndex = index;
                                  _pageController.jumpToPage(index);
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.only(bottom: 4),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: size.height*0.05,
                                        decoration: BoxDecoration(
                                          color: (selectedIndex == index) ? AppColors.secondaryLight : Colors.transparent,
                                          borderRadius: BorderRadius.circular(8)
          
                                        ),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(left: 10,right: 10),
                                              child: Icon(settingsModel[index].icon, color: (selectedIndex == index) ? Theme.of(context).primaryColor : AppColors.grey6,size: 18,),
                                            ),
                                            Text("${settingsModel[index].title}",style: robotoBold.copyWith(fontSize: Dimensions.fontSizeDefault),)
          
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }, itemCount: settingsModel.length),
                    ),
                  ),
                  VerticalDivider(width: 1,color: AppColors.grey8,),
                  Expanded(
                      flex:11,
                      child: Container(
                        child: PageView(
                          scrollDirection: Axis.vertical,
                          controller: _pageController,
                          children: [
                            Container(child: OrderHistoryPage()),
                            Center(child: Text("Conversations"),),
                            Container(child: LanguagePage()),
                            Container(child: HelpSupportPage()),
                            Container(child: PrivacyPolicyPage()),
                            Center(child: Text("Terms & Conditions"),),
                          ],
                        ),),
                      )
                ],
              ),
        ),
          ],
        ),
      ),
    );
  }
}
