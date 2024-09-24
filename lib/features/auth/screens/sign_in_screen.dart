import 'package:admin_app/common/widgets/custom_text_field_widget.dart';
import 'package:admin_app/helper/route_helper.dart';
import 'package:admin_app/util/dimensions.dart';
import 'package:admin_app/util/images.dart';
import 'package:admin_app/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Container(
          width: 320, height: 400,
          padding:   EdgeInsets.all(25),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(alignment: Alignment.center, child: Image.asset(Images.oneMomentIcon, width: 50, height: 50)),
                const SizedBox(height: 15),

                Align(alignment: Alignment.center, child: Text('Log in to 1Moment', style: robotoBold.copyWith(fontSize: 20))),
                const SizedBox(height: 15),

                CustomTextFieldWidget(
                  titleText: 'Email',
                  hintText: 'Write here...',
                  prefixIcon: Icons.email_rounded,
                  controller: _emailController,
                ),
                const SizedBox(height: 15),

                CustomTextFieldWidget(
                  titleText: 'Password',
                  hintText: 'Write here...',
                  prefixIcon: Icons.lock_rounded,
                  isPassword: true,
                  controller: _passwordController,
                ),
                const SizedBox(height: 15),

                Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Get.offAllNamed(RouteHelper.getInitialRoute());
                    },
                    child: Text('Log in', style: robotoBold.copyWith(color: Colors.white)),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
