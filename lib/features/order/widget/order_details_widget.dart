import 'package:admin_app/features/order/controllers/order_controller.dart';
import 'package:admin_app/features/order/domain/models/order_model.dart';
import 'package:admin_app/helper/string_formater.dart';
import 'package:admin_app/util/colors.dart';
import 'package:admin_app/util/dimensions.dart';
import 'package:admin_app/util/images.dart';
import 'package:admin_app/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityLogCard extends StatelessWidget {
  const ActivityLogCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
            ),
          ),
          Text(
            "Activity Log",
            style: robotoMedium.copyWith(
                color: AppColors.black,
                fontSize: Dimensions.fontSizeExtraLarge),
          )
        ],
      ),
      content: Container(
        height: 450,
        child: Padding(
          padding: EdgeInsets.only(left: 10, top: 15, right: 150),
          child: Column(
            children: [
              Row(
                children: [
                  PointWidget(statusColor: Colors.yellow),
                  const SizedBox(width: 15),
                  StatusTitleWidget(
                    statusText: 'Pending- 5 min',
                    statusTime: '10:10 - 10:15, 24 Aug 2024',
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Column(
                    children: [
                      const PointWidget(statusColor: Colors.green),
                      Container(
                          width: 1,
                          height: 50,
                          color: Colors.grey.withOpacity(0.2)),
                      const PointWidget(statusColor: Colors.green),
                    ],
                  ),
                  const SizedBox(width: 15),
                  Column(
                    children: [
                      StatusTitleWidget(
                        statusText: 'Processing- 10 min',
                        statusTime: '10:10 - 10:15, 24 Aug 2024',
                      ),
                      const SizedBox(height: 35),
                      StatusTitleWidget(
                        statusText: 'Processing- 5 min*',
                        statusTime: '10:10 - 10:15, 24 Aug 2024',
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  PointWidget(statusColor: AppColors.grey7),
                  const SizedBox(width: 15),
                  StatusTitleWidget(
                    statusText: 'Handed over',
                    statusTime: '10:22, 24 Aug 2024',
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  PointWidget(statusColor: AppColors.black),
                  const SizedBox(width: 15),
                  StatusTitleWidget(
                    statusText: 'Picked up',
                    statusTime: '10:24, 24 Aug 2024',
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  PointWidget(statusColor: AppColors.black),
                  const SizedBox(width: 15),
                  StatusTitleWidget(
                    statusText: 'Delivered- 12 min',
                    statusTime: '10:24 - 10:36, 24 Aug 2024',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChangeStatusDialog extends StatelessWidget {
  const ChangeStatusDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
              ),
            ),
            Text(
              "Change order status",
              style: robotoMedium.copyWith(
                  color: AppColors.black,
                  fontSize: Dimensions.fontSizeExtraLarge),
            )
          ],
        ),
        content: Container(
          height: 240,
          width: 332,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.grey9, width: 1)),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 12, top: 12, right: 12),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const CircleAvatar(
                        maxRadius: 4, backgroundColor: AppColors.yellow),
                    SizedBox(
                      width: 12,
                    ),
                    Text("Pending",
                        style: robotoRegular.copyWith(
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                          fontSize: Dimensions.fontSizeDefault,
                        )),
                    Spacer(),
                    //Icon(Icons.check,size: 18, color: Theme.of(context).primaryColor),
                  ],
                ),
              ),
              Divider(
                color: AppColors.grey9,
              ),
              Padding(
                padding: EdgeInsets.only(left: 12, top: 12, right: 12),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const CircleAvatar(
                        maxRadius: 4, backgroundColor: AppColors.green),
                    SizedBox(
                      width: 12,
                    ),
                    Text("Processing",
                        style: robotoMedium.copyWith(
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                          fontSize: Dimensions.fontSizeDefault,
                        )),
                    Spacer(),
                    Icon(Icons.check,
                        size: 20, color: Theme.of(context).primaryColor),
                  ],
                ),
              ),
              Divider(
                color: AppColors.grey9,
              ),
              Padding(
                padding: EdgeInsets.only(left: 12, top: 12, right: 12),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const CircleAvatar(
                        maxRadius: 4, backgroundColor: AppColors.grey7),
                    SizedBox(
                      width: 12,
                    ),
                    Text("Ready to handover",
                        style: robotoRegular.copyWith(
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                          fontSize: Dimensions.fontSizeDefault,
                        )),
                    Spacer(),
                    //Icon(Icons.check,size: 18, color: Theme.of(context).primaryColor),
                  ],
                ),
              ),
              Divider(
                color: AppColors.grey9,
              ),
              Padding(
                padding: EdgeInsets.only(left: 12, top: 12, right: 12),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const CircleAvatar(
                        maxRadius: 4, backgroundColor: AppColors.black),
                    SizedBox(
                      width: 12,
                    ),
                    Text("On the way",
                        style: robotoRegular.copyWith(
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                          fontSize: Dimensions.fontSizeDefault,
                        )),
                    Spacer(),
                    //Icon(Icons.check,size: 18, color: Theme.of(context).primaryColor),
                  ],
                ),
              ),
              Divider(
                color: AppColors.grey9,
              ),
              Padding(
                padding: EdgeInsets.only(left: 12, top: 12, right: 12),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const CircleAvatar(
                        maxRadius: 4, backgroundColor: AppColors.red),
                    SizedBox(
                      width: 12,
                    ),
                    Text("Canceled",
                        style: robotoRegular.copyWith(
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                          fontSize: Dimensions.fontSizeDefault,
                        )),
                    Spacer(),
                    //Icon(Icons.check,size: 18, color: Theme.of(context).primaryColor),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class EstimatedTimeCard extends StatelessWidget {
  const EstimatedTimeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(8),
                height: 90,
                width: 129,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.grey9,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("5",
                        style: robotoMedium.copyWith(
                          color: AppColors.black,
                          fontSize: Dimensions.fontSizeOverLarge,
                        )),
                    Text("min",
                        style: robotoRegular.copyWith(
                          color: AppColors.grey5,
                          fontSize: Dimensions.fontSizeDefault,
                        )),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8, right: 8, bottom: 8),
                height: 90,
                width: 129,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: Theme.of(context).primaryColor, width: 1.5),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("10",
                        style: robotoBold.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontSize: Dimensions.fontSizeOverLarge,
                        )),
                    Text("min",
                        style: robotoRegular.copyWith(
                          color: AppColors.grey5,
                          fontSize: Dimensions.fontSizeDefault,
                        )),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8, right: 8, bottom: 8),
                height: 90,
                width: 129,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.grey9,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("15",
                        style: robotoMedium.copyWith(
                          color: AppColors.black,
                          fontSize: Dimensions.fontSizeOverLarge,
                        )),
                    Text("min",
                        style: robotoRegular.copyWith(
                          color: AppColors.grey5,
                          fontSize: Dimensions.fontSizeDefault,
                        )),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8, right: 8, bottom: 8),
                height: 90,
                width: 129,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.grey9,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("20",
                        style: robotoMedium.copyWith(
                          color: AppColors.black,
                          fontSize: Dimensions.fontSizeOverLarge,
                        )),
                    Text("min",
                        style: robotoRegular.copyWith(
                          color: AppColors.grey5,
                          fontSize: Dimensions.fontSizeDefault,
                        )),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(8),
                height: 90,
                width: 129,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.grey9,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("30",
                        style: robotoMedium.copyWith(
                          color: AppColors.black,
                          fontSize: Dimensions.fontSizeOverLarge,
                        )),
                    Text("min",
                        style: robotoRegular.copyWith(
                          color: AppColors.grey5,
                          fontSize: Dimensions.fontSizeDefault,
                        )),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8, right: 8, bottom: 8),
                height: 90,
                width: 129,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.grey9,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("35",
                        style: robotoBold.copyWith(
                          color: AppColors.black,
                          fontSize: Dimensions.fontSizeOverLarge,
                        )),
                    Text("min",
                        style: robotoRegular.copyWith(
                          color: AppColors.grey5,
                          fontSize: Dimensions.fontSizeDefault,
                        )),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8, right: 8, bottom: 8),
                height: 90,
                width: 129,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.grey9,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("40",
                        style: robotoMedium.copyWith(
                          color: AppColors.black,
                          fontSize: Dimensions.fontSizeOverLarge,
                        )),
                    Text("min",
                        style: robotoRegular.copyWith(
                          color: AppColors.grey5,
                          fontSize: Dimensions.fontSizeDefault,
                        )),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8, right: 8, bottom: 8),
                height: 90,
                width: 129,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.grey9,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("45",
                        style: robotoMedium.copyWith(
                          color: AppColors.black,
                          fontSize: Dimensions.fontSizeOverLarge,
                        )),
                    Text("min",
                        style: robotoRegular.copyWith(
                          color: AppColors.grey5,
                          fontSize: Dimensions.fontSizeDefault,
                        )),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(8),
                height: 90,
                width: 129,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.grey9,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("50",
                        style: robotoMedium.copyWith(
                          color: AppColors.black,
                          fontSize: Dimensions.fontSizeOverLarge,
                        )),
                    Text("min",
                        style: robotoRegular.copyWith(
                          color: AppColors.grey5,
                          fontSize: Dimensions.fontSizeDefault,
                        )),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8, right: 8, bottom: 8),
                height: 90,
                width: 129,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.grey9,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("55",
                        style: robotoBold.copyWith(
                          color: AppColors.black,
                          fontSize: Dimensions.fontSizeOverLarge,
                        )),
                    Text("min",
                        style: robotoRegular.copyWith(
                          color: AppColors.grey5,
                          fontSize: Dimensions.fontSizeDefault,
                        )),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8, right: 8, bottom: 8),
                height: 90,
                width: 129,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.grey9,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("1",
                        style: robotoMedium.copyWith(
                          color: AppColors.black,
                          fontSize: Dimensions.fontSizeOverLarge,
                        )),
                    Text("hr",
                        style: robotoRegular.copyWith(
                          color: AppColors.grey5,
                          fontSize: Dimensions.fontSizeDefault,
                        )),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8, right: 8, bottom: 8),
                height: 90,
                width: 129,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.grey9,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Custom",
                        style: robotoMedium.copyWith(
                          color: AppColors.black,
                          fontSize: Dimensions.fontSizeLarge,
                        )),
                    Text("time",
                        style: robotoRegular.copyWith(
                          color: AppColors.black,
                          fontSize: Dimensions.fontSizeLarge,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}


class CollapsedButton extends StatelessWidget {
  const CollapsedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: Theme.of(context).hintColor.withOpacity(0.1), width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(8),
      child: Image.asset(Images.sidebarIcon, width: 20),
    );
  }
}

class PointWidget extends StatelessWidget {
  final Color statusColor;

  const PointWidget({super.key, required this.statusColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      width: 26,
      height: 26,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.withOpacity(0.2), width: 1),
      ),
      child: Container(
        decoration: BoxDecoration(color: statusColor, shape: BoxShape.circle),
      ),
    );
  }
}

class StatusTitleWidget extends StatelessWidget {
  final String statusText;
  final String statusTime;

  const StatusTitleWidget(
      {super.key, required this.statusText, required this.statusTime});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(statusText,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Text(statusTime,
            style: const TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    );
  }
}

class CancelOrderCard extends StatelessWidget {
  const CancelOrderCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
            ),
          ),
          Text(
            "Select an issue",
            style: robotoMedium.copyWith(
                color: AppColors.black,
                fontSize: Dimensions.fontSizeExtraLarge),
          )
        ],
      ),
      content: Container(
        height: 240,
        width: 332,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.grey9, width: 1)),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 12, top: 12, right: 12),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Item out of stock",
                      style: robotoRegular.copyWith(
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                        fontSize: Dimensions.fontSizeDefault,
                      )),
                  Spacer(),
                  //Icon(Icons.check,size: 18, color: Theme.of(context).primaryColor),
                ],
              ),
            ),
            Divider(
              color: AppColors.grey9,
            ),
            Padding(
              padding: EdgeInsets.only(left: 12, top: 12, right: 12),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Store is closed",
                      style: robotoMedium.copyWith(
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                        fontSize: Dimensions.fontSizeDefault,
                      )),
                  Spacer(),
                  Icon(Icons.check,
                      size: 20, color: Theme.of(context).primaryColor),
                ],
              ),
            ),
            Divider(
              color: AppColors.grey9,
            ),
            Padding(
              padding: EdgeInsets.only(left: 12, top: 12, right: 12),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Store is too busy",
                      style: robotoRegular.copyWith(
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                        fontSize: Dimensions.fontSizeDefault,
                      )),
                  Spacer(),
                  //Icon(Icons.check,size: 18, color: Theme.of(context).primaryColor),
                ],
              ),
            ),
            Divider(
              color: AppColors.grey9,
            ),
            Padding(
              padding: EdgeInsets.only(left: 12, top: 12, right: 12),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Customer called to cancel",
                      style: robotoRegular.copyWith(
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                        fontSize: Dimensions.fontSizeDefault,
                      )),
                  Spacer(),
                  //Icon(Icons.check,size: 18, color: Theme.of(context).primaryColor),
                ],
              ),
            ),
            Divider(
              color: AppColors.grey9,
            ),
            Padding(
              padding: EdgeInsets.only(left: 12, top: 12, right: 12),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Others",
                      style: robotoRegular.copyWith(
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                        fontSize: Dimensions.fontSizeDefault,
                      )),
                  Spacer(),
                  //Icon(Icons.check,size: 18, color: Theme.of(context).primaryColor),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        MaterialButton(
            //height: 56,
            color: AppColors.red,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: () {},
            child: Text(
              "Cancel Order",
              style: robotoMedium.copyWith(
                  color: Colors.white, fontSize: Dimensions.fontSizeDefault),
            )),
      ],
    );
  }
}
