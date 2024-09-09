import 'package:admin_app/helper/route_helper.dart';
import 'package:admin_app/util/colors.dart';
import 'package:admin_app/util/images.dart';
import 'package:admin_app/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderCard extends StatelessWidget {
  final bool isPending;
  final bool isProcessing;
  final bool isReady;
  final bool isOnTheWay;
  final bool isFirstOrder;
  const OrderCard({super.key, this.isPending = false, this.isProcessing = false, this.isReady = false, this.isOnTheWay = false, this.isFirstOrder = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(RouteHelper.getOrderDetailsRoute());
      },
      child: Container(
          margin: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).hintColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    maxRadius: 14,
                    backgroundImage: NetworkImage("https://media.designrush.com/inspiration_images/134933/conversions/_1511456189_555_McDonald's-preview.jpg"),
                  ),
                  const SizedBox(width: 8),

                  Text(
                    "McDonals",
                    style: robotoRegular.copyWith(color: Theme.of(context).textTheme.bodyLarge?.color),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              Text(
                "Order #203",
                style: robotoBold.copyWith(color: Theme.of(context).textTheme.bodyLarge?.color),
              ),

              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      border: Border.all(color: Theme.of(context).primaryColor, width: 1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      "Delivery",
                      style: robotoRegular.copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ),

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: CircleAvatar(backgroundColor: Theme.of(context).textTheme.bodyLarge?.color, maxRadius: 2),
                      ),

                      Image.asset(Images.rider, height: 16, width: 16, color: isProcessing ? Colors.blue : Theme.of(context).textTheme.bodyLarge?.color),
                      const SizedBox(width: 10),

                      Text(
                        isProcessing || isReady ? 'Rider Name' : "No rider yet",
                        style: robotoRegular.copyWith(color: Theme.of(context).textTheme.bodyLarge?.color),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 8),

              Row(
                children: [
                  Image.asset(Images.person, height: 16, width: 16),
                  const SizedBox(width: 10),

                  Text(
                    "Customer Name",
                    style: robotoRegular.copyWith(color: Theme.of(context).textTheme.bodyLarge?.color),
                  ),
                  const SizedBox(width: 10),

                  isFirstOrder ? Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                    decoration: BoxDecoration(
                      color: AppColors.yellow,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      "1st",
                      style: robotoRegular.copyWith(color: Theme.of(context).textTheme.bodyLarge?.color),
                    ),
                  ) : Container(),

                ],
              ),
              const SizedBox(height: 8),

              Row(
                children: [
                  Image.asset(Images.coupon, height: 16, width: 16),
                  const SizedBox(width: 10),

                  Text(
                    "\$10 discount",
                    style: robotoRegular.copyWith(color: Theme.of(context).textTheme.bodyLarge?.color),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              isProcessing ? Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  '03.30 left',
                  style: robotoRegular.copyWith(color: Theme.of(context).cardColor),
                ),
              ) : Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      isOnTheWay ? 'Arriving in 03:00' : '03.30',
                      style: robotoRegular.copyWith(color: Theme.of(context).cardColor),
                    ),
                  ),
                  const SizedBox(width: 16),

                  isOnTheWay ? const SizedBox() : Text(
                    "Ordered On 10.00 PM",
                    style: robotoRegular.copyWith(color: Theme.of(context).hintColor),
                  ),
                ],
              ),
            ],
          ),
      ),
    );
  }
}
