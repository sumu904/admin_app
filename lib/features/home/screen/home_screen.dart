import 'dart:async';
import 'package:admin_app/features/home/widgets/order_card.dart';
import 'package:admin_app/features/order/controllers/order_controller.dart';
import 'package:admin_app/helper/route_helper.dart';
import 'package:admin_app/util/app_constants.dart';
import 'package:admin_app/util/dimensions.dart';
import 'package:admin_app/util/images.dart';
import 'package:admin_app/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Timer _timer;

  Future<void> _loadData() async {
    await Get.find<OrderController>().getCategorizedOrders();
  }

  void _startApiCall() {
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      _loadData();
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData(); // todo: check if i need this? if the start api call doing the call immediately then there is no need for it
    // _startApiCall();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).textTheme.bodyLarge!.color?.withOpacity(0.85),
        leading: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
          child: Image.asset(Images.logo, height: 30, width: 30),
        ),
        titleSpacing: 0,
        elevation: 0,
        title: Text(AppConstants.appName, maxLines: 1, overflow: TextOverflow.ellipsis,
          style: robotoMedium.copyWith(color: Theme.of(context).cardColor, fontSize: Dimensions.fontSizeDefault),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(RouteHelper.getSignInRoute());
            },
            icon: Icon(Icons.menu, color: Theme.of(context).cardColor),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).cardColor,
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                child: Row(
                  children: [
                    Text("Orders", style: robotoMedium.copyWith(color: Theme.of(context).textTheme.bodyLarge?.color, fontSize: Dimensions.fontSizeExtraLarge, fontWeight: FontWeight.w600)),
                    const Spacer(),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Theme.of(context).hintColor, width: 0.5),
                      ),
                      child: Image.asset(Images.search, height: 20, width: 20),
                    ),

                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Theme.of(context).hintColor, width: 0.5),
                      ),
                      child: Row(
                        children: [
                          const CircleAvatar(maxRadius: 3, backgroundColor: Colors.green),
                          const SizedBox(width: 5),

                          Text("Open", style: robotoBold.copyWith(color: Theme.of(context).textTheme.bodyLarge?.color, fontSize: Dimensions.fontSizeDefault, fontWeight: FontWeight.w600)),
                          Icon(Icons.keyboard_arrow_down, size: 25, color: Theme.of(context).textTheme.bodyLarge?.color),
                        ],
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.add, size: 20, color: Theme.of(context).cardColor),
                          const SizedBox(width: 5),

                          Text(
                            "Add Order",
                            style: robotoBold.copyWith(color: Theme.of(context).cardColor, fontSize: Dimensions.fontSizeDefault, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: List.generate(1, (index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 340,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Text(
                                  "Pending (4)",
                                  style: robotoBold.copyWith(color: Theme.of(context).textTheme.bodyLarge?.color, fontSize: Dimensions.fontSizeLarge),
                                ),
                              ),

                              ListView.builder(
                                itemCount: 3,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return const OrderCard(isPending: true, isFirstOrder: true);
                                },
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          width: 340,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Text(
                                  "Processing (4)",
                                  style: robotoBold.copyWith(color: Theme.of(context).textTheme.bodyLarge?.color, fontSize: Dimensions.fontSizeLarge),
                                ),
                              ),

                              ListView.builder(
                                itemCount: 3,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return const OrderCard(isProcessing: true);
                                },
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          width: 340,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Text(
                                  "Ready (4)",
                                  style: robotoBold.copyWith(color: Theme.of(context).textTheme.bodyLarge?.color, fontSize: Dimensions.fontSizeLarge),
                                ),
                              ),

                              ListView.builder(
                                itemCount: 3,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return const OrderCard(isReady: true);
                                },
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          width: 340,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Text(
                                  "On the way (3)",
                                  style: robotoBold.copyWith(color: Theme.of(context).textTheme.bodyLarge?.color, fontSize: Dimensions.fontSizeLarge),
                                ),
                              ),

                              ListView.builder(
                                itemCount: 3,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return const OrderCard(isOnTheWay: true);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    /*return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
        leading: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
          child: Image.asset(Images.logo, height: 30, width: 30),
        ),
        titleSpacing: 0,
        elevation: 0,
        title: Text(AppConstants.appName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: robotoMedium.copyWith(
              color: Theme.of(context).textTheme.bodyLarge!.color,
              fontSize: Dimensions.fontSizeDefault,
            )),
      ),
      body: const SizedBox(),





      // body: RefreshIndicator(
      //   onRefresh: () async {
      //     await _loadData();
      //   },
      //   child: SingleChildScrollView(
      //     padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
      //     physics: const AlwaysScrollableScrollPhysics(),
      //     child: Column(children: [
      //       GetBuilder<OrderController>(builder: (orderController) {
      //         List<OrderModel> orderList = [];
      //         if (orderController.runningOrders != null) {
      //           orderList = orderController
      //               .runningOrders![orderController.orderIndex].orderList;
      //         }
      //
      //         return Column(children: [
      //           orderController.runningOrders != null
      //               ? Container(
      //                   height: 40,
      //                   decoration: BoxDecoration(
      //                     border: Border.all(
      //                         color: Theme.of(context).disabledColor, width: 1),
      //                     borderRadius:
      //                         BorderRadius.circular(Dimensions.radiusSmall),
      //                   ),
      //                   child: ListView.builder(
      //                     scrollDirection: Axis.horizontal,
      //                     itemCount: orderController.runningOrders!.length,
      //                     itemBuilder: (context, index) {
      //                       return OrderButtonWidget(
      //                         title: orderController
      //                             .runningOrders![index].status.tr,
      //                         index: index,
      //                         orderController: orderController,
      //                         fromHistory: false,
      //                       );
      //                     },
      //                   ),
      //                 )
      //               : const SizedBox(),
      //           orderController.runningOrders != null
      //               ? orderList.isNotEmpty
      //                   ? ListView.builder(
      //                       physics: const NeverScrollableScrollPhysics(),
      //                       shrinkWrap: true,
      //                       itemCount: orderList.length,
      //                       itemBuilder: (context, index) {
      //                         return OrderWidget(
      //                             orderModel: orderList[index],
      //                             hasDivider: index != orderList.length - 1,
      //                             isRunning: true);
      //                       },
      //                     )
      //                   : Padding(
      //                       padding: const EdgeInsets.only(top: 50),
      //                       child: Center(child: Text('no_order_found'.tr)),
      //                     )
      //               : ListView.builder(
      //                   physics: const NeverScrollableScrollPhysics(),
      //                   shrinkWrap: true,
      //                   itemCount: 10,
      //                   itemBuilder: (context, index) {
      //                     return OrderShimmerWidget(
      //                         isEnabled: orderController.runningOrders == null);
      //                   },
      //                 ),
      //         ]);
      //       }),
      //     ]),
      //   ),
      // ),
    );*/
  }
}
