import 'package:admin_app/common/widgets/custom_image.dart';
import 'package:admin_app/features/order/controllers/order_controller.dart';
import 'package:admin_app/features/order/domain/models/order_model.dart';
import 'package:admin_app/features/order/widget/order_details_widget.dart';
import 'package:admin_app/helper/string_formater.dart';
import 'package:admin_app/util/colors.dart';
import 'package:admin_app/util/dimensions.dart';
import 'package:admin_app/util/images.dart';
import 'package:admin_app/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OrderDetailsScreen extends StatefulWidget {
  final String? orderId;
  const OrderDetailsScreen({super.key, this.orderId});


  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  bool _isCollapsed = false;

  void _toggleCollapse() {
    setState(() {
      _isCollapsed = !_isCollapsed;
    });
  }

   loadOrderDetails(){
    Get.find<OrderController>().getOrderDetails(orderId: orderId!);
  }

  String ?orderId;

  @override
  void initState() {
    super.initState();
    orderId=widget.orderId;
    loadOrderDetails();
  }

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    final Orientation orientation = MediaQuery.of(context).orientation;

    return SafeArea(
      child: Scaffold(
        body: GetBuilder<OrderController>(builder:(orderController) {
          return Row(children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: size.height,
              width: _isCollapsed ? size.width * 0.10 : size.width * 0.20,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,children: [
                    Row(children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Theme.of(context).hintColor.withOpacity(0.1), width: 1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: const Icon(Icons.arrow_back, size: 20),
                        ),
                      ),

                      const Spacer(),

                      _isCollapsed == true ? const SizedBox(
                        height: 1, width: 1,
                      ) : InkWell(
                        onTap: _toggleCollapse,
                        child: const CollapsedButton(),
                      ),
                    ]),

                    _isCollapsed == false ? const SizedBox(
                        height: 1, width: 1,
                      ) : InkWell(
                        onTap: _toggleCollapse,
                        child: const CollapsedButton(),
                    ),

                    _isCollapsed == true ? const SizedBox(
                      height: 1, width: 1,
                    ) : Theme(
                      data: ThemeData(
                        dividerColor: Colors.transparent,
                      ),
                      child: ExpansionTile(
                        title: Text(
                          "Pending (${orderController.categorizedOrders.value!.pending.length})",
                          style: robotoMedium.copyWith(color: Theme.of(context).textTheme.bodyLarge?.color, fontSize: Dimensions.fontSizeLarge),
                        ),
                        iconColor: Theme.of(context).textTheme.bodyLarge?.color,
                        tilePadding: const EdgeInsets.all(0),
                        children: List.generate(orderController.categorizedOrders.value!.pending.length, (index) {
                          var data = orderController.categorizedOrders.value!.pending[index];
                          return collapsedCard(context, data);
                        }),
                      ),
                    ),

                    _isCollapsed == true ? const SizedBox(
                      height: 1, width: 1,
                    ) : Theme(
                      data: ThemeData(
                        dividerColor: Colors.transparent,
                      ),
                      child: ExpansionTile(
                        title: Text(
                          "Processing (${orderController.categorizedOrders.value!.processing.length})",
                          style: robotoMedium.copyWith(color: Theme.of(context).textTheme.bodyLarge?.color, fontSize: Dimensions.fontSizeLarge),
                        ),
                        iconColor: Theme.of(context).textTheme.bodyLarge?.color,
                        tilePadding: const EdgeInsets.all(0),
                        children: List.generate(orderController.categorizedOrders.value!.processing.length, (index) {
                          var data = orderController.categorizedOrders.value!.processing[index];
                          return collapsedCard(context, data);
                        }),
                      ),
                    ),

                    _isCollapsed == true ? const SizedBox(
                      height: 1, width: 1,
                    ) : Theme(
                      data: ThemeData(
                        dividerColor: Colors.transparent,
                      ),
                      child: ExpansionTile(
                        title: Text(
                          "Ready (${orderController.categorizedOrders.value!.handover.length})",
                          style: robotoMedium.copyWith(color: Theme.of(context).textTheme.bodyLarge?.color, fontSize: Dimensions.fontSizeLarge),
                        ),
                        iconColor: Theme.of(context).textTheme.bodyLarge?.color,
                        tilePadding: const EdgeInsets.all(0),
                        children: List.generate(orderController.categorizedOrders.value!.handover.length, (index) {
                          var data = orderController.categorizedOrders.value!.handover[index];
                          return collapsedCard(context, data);
                        }),
                      ),
                    ),

                    _isCollapsed == true ? const SizedBox(
                      height: 1, width: 1,
                    ): Theme(
                      data: ThemeData(
                        dividerColor: Colors.transparent,
                      ),
                      child: ExpansionTile(
                        title: Text(
                          "On the way (${orderController.categorizedOrders.value!.outForDelivery.length})",
                          style: robotoMedium.copyWith(color: Theme.of(context).textTheme.bodyLarge?.color, fontSize: Dimensions.fontSizeLarge),
                        ),
                        iconColor: Theme.of(context).textTheme.bodyLarge?.color,
                        tilePadding: const EdgeInsets.all(0),
                        children: List.generate(orderController.categorizedOrders.value!.outForDelivery.length, (index) {
                          var data = orderController.categorizedOrders.value!.outForDelivery[index];
                          return collapsedCard(context, data);
                        }),
                      ),
                    ),
                  ]),
                ),
              ),
            ),

            Container(
              width: 1.5,
              color: Theme.of(context).hintColor.withOpacity(0.1),
            ),

            Expanded(
              child: orderController.orderDetailsModel == null ? const Center(child: CircularProgressIndicator()) : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  height: 175,
                  padding:
                  const EdgeInsets.only(top: 15, left: 30, right: 30),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Row(children: [
                      ClipOval(
                        child: CustomImage(
                          image: orderController.orderDetailsModel!.store!.logoUrl ?? '',
                          height: 28, width: 28,
                        ),
                      ),
                      const SizedBox(width: 8),

                      Text(
                        "${orderController.orderDetailsModel!.store!.name}",
                        style: robotoRegular.copyWith(
                          color: Theme.of(context).textTheme.bodyLarge?.color, fontWeight: FontWeight.w600, fontSize:Dimensions.fontSizeLarge,
                        ),
                      ),
                    ]),
                    const SizedBox(height: 8),

                    Row(children: [
                      Text(
                        "Order #${orderController.orderDetailsModel!.orderId}",
                        style: robotoBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: CircleAvatar(
                          backgroundColor: Theme.of(context).textTheme.bodyLarge?.color,
                          maxRadius: 2,
                        ),
                      ),

                      Text(
                        "XX2435-L",
                        style: robotoRegular.copyWith(fontWeight: FontWeight.w300, fontSize: Dimensions.fontSizeExtraLarge),
                      ),

                      const Spacer(),

                      MaterialButton(
                        onPressed: () {
                          showDialog(context: context, builder: (context) => AlertDialog(
                            title: Row(children: [
                              IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: const Icon(Icons.arrow_back),
                              ),

                              Text(
                                "Adjust processing time",
                                style: robotoMedium.copyWith(color: AppColors.black, fontSize: Dimensions.fontSizeExtraLarge),
                              ),
                            ]),
                            content: const EstimatedTimeCard(),
                            actions: [
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: MaterialButton(
                                    onPressed: () {},
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: const BorderSide(width: 1.5, color: AppColors.grey8),
                                    ),
                                    child: Text(
                                      "Cancel",
                                      style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeDefault),
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: MaterialButton(
                                    color: Theme.of(context).primaryColor,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                    onPressed: () {},
                                    child: Text(
                                      "Update time",
                                      style: robotoMedium.copyWith(color: Colors.white, fontSize: Dimensions.fontSizeDefault),
                                    ),
                                  ),
                                ),
                              ]),
                            ],
                          ));
                        },
                        color: AppColors.black,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          "02:44",
                          style: robotoBold.copyWith(color: Colors.white),
                        ),
                      ),

                      InkWell(
                        onTap: () {
                          showDialog(context: context, builder: (context) => const ChangeStatusDialog());
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 12),
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Theme.of(context).hintColor, width: 1),
                          ),
                          child: Row(children: [
                            const CircleAvatar(maxRadius: 3, backgroundColor: Colors.green),
                            const SizedBox(width: 10),

                            Text(
                              "Open",
                              style: robotoBold.copyWith(color: Theme.of(context).textTheme.bodyLarge?.color, fontSize: Dimensions.fontSizeDefault, fontWeight: FontWeight.w600,),
                            ),

                            Icon(Icons.keyboard_arrow_down, size: 25, color: Theme.of(context).textTheme.bodyLarge?.color),
                          ]),
                        ),
                      ),
                    ]),
                    const SizedBox(height: 8),

                    Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            border: Border.all(color: Theme.of(context).primaryColor, width: 1),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            StringFormater.formatString(orderController.orderDetailsModel!.orderType ?? ''),
                            style: robotoRegular.copyWith(color: Theme.of(context).primaryColor),
                          ),
                        ),
                        const SizedBox(width: 10),

                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                          decoration: BoxDecoration(
                            color: AppColors.yellow,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text("${orderController.orderDetailsModel!.customer!.orderCount}", style: robotoRegular),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 4, right: 20),
                          child: CircleAvatar(backgroundColor: Theme.of(context).textTheme.bodyLarge?.color, maxRadius: 2),
                        ),

                        Image.asset(Images.cash, height: 20),
                        const SizedBox(width: 4),

                        Text(
                          StringFormater.formatString(orderController.orderDetailsModel!.paymentMethod ?? ''),
                          style: robotoRegular.copyWith(fontWeight: FontWeight.w300),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 4, right: 12),
                          child: CircleAvatar(backgroundColor: Theme.of(context).textTheme.bodyLarge?.color, maxRadius: 2),
                        ),

                        Image.asset(Images.coupon, height: 20),
                        const SizedBox(width: 4),

                        Text(
                          orderController.orderDetailsModel!.coupon?.title ?? "No Coupon",
                          style: robotoRegular.copyWith(fontWeight: FontWeight.w300),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 4, right: 12),
                          child: CircleAvatar(backgroundColor: Theme.of(context).textTheme.bodyLarge?.color, maxRadius: 2),
                        ),

                        Text(
                          "Ordered on : ${ DateFormat('hh:mm a').format(DateTime.parse(orderController.orderDetailsModel!.pendingAt.toString()))}",
                          style: robotoRegular.copyWith(fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ]),
                ),

                const Divider(endIndent: 0, indent: 0, thickness: 1.5, height: 0, color: AppColors.grey9),

                SizedBox(
                  height: size.height - 200,
                  child: RefreshIndicator(
                    onRefresh: ()async{
                      loadOrderDetails();
                      },
                    child: SingleChildScrollView(
                      child: Column(children: [
                        Row(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                          // First scrollable column
                          Expanded(
                            flex: 22,
                            child: Column(children: [
                              Container(
                                padding:  const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1.5, color: Theme.of(context).hintColor.withOpacity(0.1)),
                                ),
                                child: Column(children: [
                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                      Text(
                                        "Orders",
                                        style: robotoBold.copyWith(color: AppColors.black, fontSize: Dimensions.fontSizeExtraLarge),
                                      ),

                                      Text(
                                        "Total ${orderController.orderDetailsModel!.itemDetails!.length} items",
                                        style: robotoRegular.copyWith(color: AppColors.grey5, fontSize: Dimensions.fontSizeSmall),
                                      ),
                                    ]),

                                    orderController.orderDetailsModel!.note == null ? const SizedBox(height: 1): Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: const BoxDecoration(
                                        color: Color(0xffF5F5F4),
                                        borderRadius: BorderRadius.all(Radius.circular(12)),
                                      ),
                                      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                        Image.asset(Images.noteIcon, height: 20, width: 20),
                                        const SizedBox(width: 12),

                                        Text(
                                          "${orderController.orderDetailsModel!.note}",
                                          style: robotoRegular.copyWith(color: AppColors.grey2, fontSize: Dimensions.fontSizeSmall),
                                        ),
                                      ]),
                                    ),
                                  ]),

                                  const SizedBox(height: 8),
                                ]),
                              ),

                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                                decoration: BoxDecoration(
                                  color: AppColors.grey9,
                                  border: Border.all(width: 1.5, color: Theme.of(context).hintColor.withOpacity(0.1)),
                                ),
                                child: Row(children: [
                                  Expanded(
                                    flex: 10,
                                    child: Text(
                                      "ITEMS",
                                      style: robotoRegular.copyWith(color: AppColors.grey3, fontSize: Dimensions.fontSizeSmall),
                                    ),
                                  ),

                                  Expanded(
                                    flex: 3,
                                    child: Center(
                                      child: Text(
                                        "QTY",
                                        style: robotoRegular.copyWith(color: AppColors.grey3, fontSize: Dimensions.fontSizeSmall),
                                      ),
                                    ),
                                  ),

                                  Expanded(
                                    flex: 4,
                                    child: Column(children: [
                                      Text(
                                        "PRICE",
                                        style: robotoRegular.copyWith(color: AppColors.grey3, fontSize: Dimensions.fontSizeSmall),
                                      ),
                                    ]),
                                  ),
                                ]),
                              ),

                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: orderController.orderDetailsModel!.itemDetails!.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  var data = orderController.orderDetailsModel!.itemDetails![index];
                                  return Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1.5, color: Theme.of(context).hintColor.withOpacity(0.1)),
                                    ),
                                    child: Row(children: [
                                      Expanded(
                                        flex: 10,
                                        child: Container(
                                          padding: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              right: BorderSide(width: 1, color: AppColors.grey8),
                                            ),
                                          ),
                                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                            Row(mainAxisSize: MainAxisSize.max, children: [
                                              SizedBox(
                                                height: 40, width: 40,
                                                child: CustomImage(image: data.image ?? '', height: 40, width: 40, fit: BoxFit.cover),
                                              ),
                                              const SizedBox(width: 8),

                                              Flexible(
                                                child: Text(
                                                  '${data.name}',
                                                  style: robotoMedium.copyWith(color: AppColors.black, fontSize: Dimensions.fontSizeDefault,fontWeight: FontWeight.w600),
                                                  maxLines: 3,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ]),

                                             ListView.builder(
                                               shrinkWrap: true,physics: const NeverScrollableScrollPhysics(),
                                               itemCount: data.variation!.length,
                                               itemBuilder: (context, i){
                                                 return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                   Padding(
                                                     padding: const EdgeInsets.only(left: 48),
                                                     child: Text("${data.variation![i].name}",style: robotoMedium.copyWith(
                                                     color: AppColors.black,fontWeight: FontWeight.w600, fontSize: Dimensions.fontSizeSmall))
                                                   ),

                                                   ListView.builder(
                                                     shrinkWrap: true,
                                                     physics: const NeverScrollableScrollPhysics(),
                                                     itemCount: data.variation![i].values!.length,
                                                     itemBuilder: (context, index) {
                                                       return Padding(
                                                         padding: const EdgeInsets.only(left: 48),
                                                         child:  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                                           Text(
                                                             "${data.variation![i].values![index].name}",
                                                             style: robotoMedium.copyWith(color: AppColors.black, fontSize: Dimensions.fontSizeSmall),
                                                           ),

                                                           Text(
                                                             "\$${data.variation![i].values![index].price}",
                                                             style: robotoRegular.copyWith(color: AppColors.grey5, fontSize: Dimensions.fontSizeSmall),
                                                           ),
                                                         ]),
                                                       );
                                                     },
                                                   ),
                                                 ]);
                                               },
                                             ),

                                            data.addOns!.isEmpty ? const SizedBox(height: 8) : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                              const Divider(endIndent: 0, indent: 48, thickness: 1.5, color: AppColors.grey9),
                                              const SizedBox(height: 8),

                                              Padding(
                                                padding: const EdgeInsets.only(left: 48, top: 0),
                                                child: Text(
                                                  "ADD-ONS",
                                                  style: robotoRegular.copyWith(color: AppColors.grey5, fontSize: Dimensions.fontSizeExtraSmall),
                                                ),
                                              ),
                                            ]),

                                            data.addOns!.isEmpty ? const SizedBox() : ListView.builder(
                                              shrinkWrap: true,
                                              physics: const NeverScrollableScrollPhysics(),
                                              itemCount: data.addOns!.length,
                                              itemBuilder: (context,index){
                                                return Column(children: [
                                                  const SizedBox(height: 5),

                                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                                    Padding(padding: const EdgeInsets.only(left: 48, top: 0),
                                                      child: RichText(
                                                        text: TextSpan(
                                                          text: '${data.addOns![index].quantity}x',
                                                          style: robotoMedium.copyWith(color: Theme.of(context).primaryColor, fontSize: Dimensions.fontSizeSmall),
                                                          children: <TextSpan>[
                                                            TextSpan(
                                                              text: '  ${data.addOns![index].name}',
                                                              style: robotoMedium.copyWith(color: AppColors.black, fontSize: Dimensions.fontSizeSmall,fontWeight: FontWeight.w600),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),

                                                    Text(
                                                      "\$${data.addOns![index].price}",
                                                      style: robotoRegular.copyWith(color: AppColors.grey5, fontSize: Dimensions.fontSizeSmall),
                                                    ),
                                                  ]),
                                                  const Divider(endIndent: 5, indent: 48, thickness: 1.5, color: AppColors.grey9),

                                                  const SizedBox(height: 5),
                                                ]);
                                              },
                                            ),
                                          ]),
                                        ),
                                      ),

                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          alignment: Alignment.center,
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              right: BorderSide(width: 1.5, color: AppColors.grey9),
                                            ),
                                          ),
                                          child: Column(mainAxisSize: MainAxisSize.min, children: [
                                            RichText(
                                              text: TextSpan(
                                                text: '${data.quantity}',
                                                style: robotoMedium.copyWith(color: AppColors.black, fontSize: Dimensions.fontSizeExtraLarge),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: 'x',
                                                    style: robotoRegular.copyWith(color: AppColors.black, fontSize: Dimensions.fontSizeSmall),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ]),
                                        ),
                                      ),

                                      Expanded(
                                        flex: 4,
                                        child: Center(
                                          child: Text('\$${data.price}', style: robotoRegular.copyWith(color: AppColors.black, fontSize: Dimensions.fontSizeLarge)),
                                        ),
                                      ),
                                    ]),
                                  );
                                },
                              ),
                              const SizedBox(height: 20),

                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  width: 300,
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                    Text(
                                      "Subtotal",
                                      style: robotoRegular.copyWith(color: AppColors.grey5, fontSize: Dimensions.fontSizeDefault),
                                    ),

                                    Text(
                                      "\$${orderController.orderDetailsModel!.subtotal}",
                                      style: robotoRegular.copyWith(color: AppColors.black, fontSize: Dimensions.fontSizeLarge, fontWeight: FontWeight.w500),
                                    ),
                                  ]),
                                ),
                              ),

                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  width: 300,
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                    Text(
                                      "Processing Fee",
                                      style: robotoRegular.copyWith(color: AppColors.grey5, fontSize: Dimensions.fontSizeDefault),
                                    ),

                                    Text(
                                      "\$${orderController.orderDetailsModel!.processingFee}",
                                      style: robotoRegular.copyWith(color: AppColors.black, fontSize: Dimensions.fontSizeLarge, fontWeight: FontWeight.w500),
                                    ),
                                  ]),
                                ),
                              ),

                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  width: 300,
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                    Text(
                                      "Delivery Fee",
                                      style: robotoRegular.copyWith(color: AppColors.grey5, fontSize: Dimensions.fontSizeDefault),
                                    ),

                                    Text(
                                      "\$${orderController.orderDetailsModel!.deliveryCharge}",
                                      style: robotoRegular.copyWith(color: AppColors.black, fontSize: Dimensions.fontSizeLarge, fontWeight: FontWeight.w500),
                                    ),
                                  ]),
                                ),
                              ),

                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  width: 300,
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                    Text(
                                      "Discount",
                                      style: robotoRegular.copyWith(color: AppColors.grey5, fontSize: Dimensions.fontSizeDefault),
                                    ),

                                    Text(
                                      "\$0.00",
                                      style: robotoRegular.copyWith(color: AppColors.black, fontSize: Dimensions.fontSizeLarge, fontWeight:FontWeight.w500),
                                    ),
                                  ]),
                                ),
                              ),

                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  width: 265, height: 1,
                                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                  color: AppColors.grey8,
                                ),
                              ),

                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  width: 300,
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                    Text(
                                      "Total",
                                      style: robotoRegular.copyWith(color: AppColors.grey5, fontSize: Dimensions.fontSizeDefault),
                                    ),

                                    Text(
                                      "\$${orderController.orderDetailsModel!.subtotal}",
                                      style: robotoBold.copyWith(color: Theme.of(context).primaryColor, fontSize: Dimensions.fontSizeLarge),
                                    ),
                                  ]),
                                ),
                              ),
                            ]),
                          ),

                          // Second scrollable column
                          Expanded(
                            flex: 15,
                            child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 260),
                                child: TextButton(
                                  onPressed: () {
                                    showDialog(context: context, builder: (context) => const ActivityLogCard());
                                  },
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                                  ),
                                  child: Text(
                                    "View Activity Log",
                                    style: robotoMedium.copyWith(color: Theme.of(context).primaryColor, fontSize: Dimensions.fontSizeSmall),
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(left: 30, bottom: 20),
                                child: Column(children: [
                                  const Row(children: [
                                    PointWidget(statusColor: Colors.yellow),
                                    SizedBox(width: 15),

                                    StatusTitleWidget(
                                      statusText: 'Pending- 5 min',
                                      statusTime: '10:10 - 10:15, 24 Aug 2024',
                                    ),
                                  ]),
                                  const SizedBox(height: 30),

                                  Row(children: [
                                    Column(children: [
                                      const PointWidget(statusColor: Colors.green),
                                      Container(width: 1, height: 50, color: Colors.grey.withOpacity(0.2)),

                                      const PointWidget(statusColor: Colors.green),
                                    ]),
                                    const SizedBox(width: 15),

                                    const Column(children: [
                                      StatusTitleWidget(
                                        statusText: 'Processing- 10 min',
                                        statusTime: '10:10 - 10:15, 24 Aug 2024',
                                      ),
                                      SizedBox(height: 35),

                                      StatusTitleWidget(
                                        statusText: 'Processing- 5 min*',
                                        statusTime: '10:10 - 10:15, 24 Aug 2024',
                                      ),
                                    ]),
                                  ]),
                                ]),
                              ),

                              Container(
                                padding: const EdgeInsets.only(left: 30, right: 30),
                                child: Column(children: [
                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                    Text(
                                      "Deliveryman",
                                      style: robotoMedium.copyWith(color: AppColors.black, fontWeight: FontWeight.w600, fontSize: Dimensions.fontSizeSmall),
                                    ),

                                    TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                                      ),
                                      child: Text(
                                        "Change",
                                        style: robotoMedium.copyWith(color: Theme.of(context).primaryColor, fontSize: Dimensions.fontSizeSmall),
                                      ),
                                    ),
                                  ]),

                                  orderController.orderDetailsModel!.deliveryMan == null ? Container(
                                   padding: const EdgeInsets.symmetric(vertical: 25),
                                    width: double.infinity,
                                    constraints: const BoxConstraints(),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(width: 1, color: AppColors.grey8),
                                    ),
                                    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                                      Image.asset(
                                        Images.deliverymanIcon,
                                        height: 54, width: 54,
                                      ),
                                      const SizedBox(height: 10),

                                      Text(
                                        "No rider has been \n    assigned yet",
                                        style: robotoRegular.copyWith(color: AppColors.grey4, fontSize: Dimensions.fontSizeSmall),
                                      ),
                                    ]),
                                  ): Container(
                                    decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(12),
                                     border: Border.all(color: AppColors.grey9),
                                   ),
                                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                     Padding(
                                       padding: const EdgeInsets.all(12.0),
                                       child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                         Row(children: [
                                           SizedBox(
                                             height: 35, width: 35,
                                             child: CustomImage(
                                               image: orderController.orderDetailsModel!.deliveryMan!.imageUrl ?? '',
                                               height: 35, width: 35, fit: BoxFit.cover,
                                             ),
                                           ),
                                           const SizedBox(width: 12),

                                           Column(mainAxisSize: MainAxisSize.max, crossAxisAlignment: CrossAxisAlignment.start, children: [
                                             Text(
                                               "${orderController.orderDetailsModel!.deliveryMan!.name}",
                                               style: robotoMedium.copyWith(color: AppColors.black, fontSize: Dimensions.fontSizeDefault),
                                             ),

                                             Text(
                                               "Total ${orderController.orderDetailsModel!.deliveryMan!.ordersCount} Orders",
                                               style: robotoRegular.copyWith(color: AppColors.grey5, fontSize: Dimensions.fontSizeSmall),
                                             ),
                                           ]),
                                         ]),

                                         Row(children: [
                                           Image.asset(
                                             Images.messageIcon,
                                             height: 30, width: 30,
                                           ),
                                           const SizedBox(width: 8),

                                           Image.asset(
                                             Images.callIcon,
                                             height: 30, width: 30,
                                           ),
                                         ]),
                                       ]),
                                     ),

                                     Container(
                                       margin: const EdgeInsets.only(top: 0),
                                       height:150,
                                       color: AppColors.grey9,
                                     ),

                                   ]),
                                 ),
                                ]),
                              ),

                              Container(
                                padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                  Text(
                                    "Customer",
                                    style: robotoMedium.copyWith(color: AppColors.black, fontSize: Dimensions.fontSizeSmall),
                                  ),
                                  const SizedBox(height: 10),

                                  Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.grey10,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                            Text(
                                              "${orderController.orderDetailsModel!.customer!.name}",
                                              style: robotoMedium.copyWith(color: AppColors.black, fontSize: Dimensions.fontSizeDefault),
                                            ),

                                            Text(
                                              "${orderController.orderDetailsModel!.customer!.orderCount} Orders",
                                              style: robotoRegular.copyWith(color: AppColors.grey5, fontSize: Dimensions.fontSizeSmall),
                                            ),
                                          ]),

                                          Column(children: [
                                            Row(children: [
                                              Image.asset(
                                                Images.messageIcon,
                                                height: 40, width: 40,
                                              ),

                                              Image.asset(
                                                Images.callIcon,
                                                height: 40, width: 40,
                                              ),
                                            ]),
                                          ]),
                                        ]),
                                        const SizedBox(height: 15),

                                        Text(
                                          "25/17 Uttara, Sector 11, \nDhaka, Bangladesh",
                                          style: robotoRegular.copyWith(color: AppColors.black, fontSize: Dimensions.fontSizeSmall),
                                        ),

                                        TextButton(
                                          onPressed: () {},
                                          style: TextButton.styleFrom(
                                            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                                          ),
                                          child: Text(
                                            "Show location on map",
                                            style: robotoRegular.copyWith(color: Theme.of(context).primaryColor, fontSize: Dimensions.fontSizeSmall),
                                          ),
                                        ),
                                      ]),
                                    ),
                                  ),
                                ]),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                  Text(
                                    "Store",
                                    style: robotoMedium.copyWith(color: AppColors.black, fontSize: Dimensions.fontSizeSmall),
                                  ),
                                  const SizedBox(height: 10),

                                  Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.grey10,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: orientation == Orientation.portrait ? 10 : 20),
                                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                          Row(children: [
                                            CustomImage(image: orderController.orderDetailsModel!.store!.logoUrl ?? '', height: 35, width: 35, fit: BoxFit.cover),
                                            const SizedBox(width: 12),

                                            Column(mainAxisSize: MainAxisSize.max, crossAxisAlignment: CrossAxisAlignment.start, children: [
                                              Text(
                                                "${orderController.orderDetailsModel!.store!.name}",
                                                style: robotoMedium.copyWith(color: AppColors.black, fontSize: Dimensions.fontSizeDefault),
                                              ),
                                            ]),
                                          ]),

                                          Row(children: [
                                            Image.asset(
                                              Images.messageIcon,
                                              height: 30, width: 30,
                                            ),
                                            const SizedBox(width: 8),

                                            Image.asset(
                                              Images.callIcon,
                                              height: 30, width: 30,
                                            ),
                                          ]),
                                        ]),
                                      ]),
                                    ),
                                  ),
                                ]),
                              ),
                            ]),
                          ),
                        ]),

                        const SizedBox(height: 20),

                        /*Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(width: 1.5, color: AppColors.grey8),
                              ),
                              onPressed: () {
                                showDialog(context: context, builder: (context) => const CancelOrderCard());
                              },
                              child: Text(
                                "Cancel Order",
                                style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeDefault),
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: MaterialButton(
                              color: Theme.of(context).primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              onPressed: () {},
                              child: Text(
                                "Accept Order",
                                style: robotoMedium.copyWith(color: Colors.white, fontSize: Dimensions.fontSizeDefault),
                              ),
                            ),
                          ),
                        ]),*/
                      ]),
                    ),
                  ),
                ),
              ]),
            ),
          ]);
        }),
      ),
    );
  }
  InkWell collapsedCard(BuildContext context,OrderModel data) {
    return InkWell(
      onTap: () {
       orderId= data.orderId;
       loadOrderDetails();
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
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
                CircleAvatar(
                  maxRadius: 14,
                  backgroundImage: NetworkImage("${data.store!.logoUrl}"),
                ),
                const SizedBox(width: 8),
                Text(
                  "${data.store!.name}",
                  style: robotoRegular.copyWith(
                      color: Theme.of(context).textTheme.bodyLarge?.color),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              "Order Id ${data.orderId}",
              style: robotoBold.copyWith(
                  color: Theme.of(context).textTheme.bodyLarge?.color),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                border: Border.all(color: AppColors.primaryClr, width: 1.3),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                StringFormater.formatString(data.orderType ?? ""),
                style: robotoRegular.copyWith(color: AppColors.primaryClr),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
