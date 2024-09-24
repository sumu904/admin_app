import 'dart:async';

import 'package:admin_app/features/home/widgets/order_card.dart';
import 'package:admin_app/features/order/controllers/order_controller.dart';
import 'package:admin_app/features/order/domain/models/categorized_order_model.dart';
import 'package:admin_app/features/order/domain/models/order_model.dart';
import 'package:admin_app/features/order/screens/order_details_screen.dart';
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
    print("Api calling startttttttttttttttttttttttttt");
    await Get.find<OrderController>().getCategorizedOrders();
  }

  void _startApiCall() {
    _timer = Timer.periodic(const Duration(seconds: 200), (timer) {
      _loadData();
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
    _startApiCall();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      backgroundColor: Theme.of(context).cardColor,
      body: SizedBox(
        width: double.infinity,
        child: RefreshIndicator(
          onRefresh: _loadData,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),

            child:Obx(() {
              // Listen for changes in the OrderController state
              final orderController = Get.find<OrderController>();

              if (orderController.categorizedOrders.value == null &&
                  orderController.errorMessage.value.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              if (orderController.errorMessage.value.isNotEmpty) {
                return Center(
                    child: Text(orderController.errorMessage.value));
              }

              return _buildOrderLists(
                  orderController.categorizedOrders.value!);
            }),
          ),
        ),
      ),
    );
  }



  Widget _buildOrderLists(CategorizedOrderModel categorizedOrders) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildOrderColumn("Pending (${categorizedOrders.pending.length})",
                categorizedOrders.pending),
            _buildOrderColumn(
                "Processing (${categorizedOrders.processing.length})",
                categorizedOrders.processing),
            _buildOrderColumn("Ready (${categorizedOrders.handover.length})",
                categorizedOrders.handover),
           if(categorizedOrders.outForDelivery.isNotEmpty) _buildOrderColumn(
                "On the way (${categorizedOrders.outForDelivery.length})",
                categorizedOrders.outForDelivery),
          ],
        ),
        Container(height: 900,
        )
      ],
    );
  }

  Widget _buildOrderColumn(String title, List<OrderModel> orders) {
    return Expanded(
      flex: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              title,
              style: robotoBold.copyWith(
                color: Theme.of(context).textTheme.bodyLarge?.color,
                fontSize: Dimensions.fontSizeLarge,
              ),
            ),
          ),
          ListView.builder(
            itemCount: orders.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  Get.to(OrderDetailsScreen(orderId: orders[index].orderId,));
                },
                child: OrderCard(order: orders[index]),
              );
            },
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor:
      Theme.of(context).textTheme.bodyLarge!.color?.withOpacity(0.85),
      leading: Padding(
        padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
        child: Image.asset(Images.logo, height: 30, width: 30),
      ),
      titleSpacing: 0,
      elevation: 0,
      title: Text(
        AppConstants.appName,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: robotoMedium.copyWith(
          color: Theme.of(context).cardColor,
          fontSize: Dimensions.fontSizeDefault,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu, color: Theme.of(context).cardColor),
        ),
      ],
    );
  }
}
