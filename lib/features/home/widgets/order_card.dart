import 'package:admin_app/common/widgets/custom_image.dart';
import 'package:admin_app/features/home/widgets/order_timing_widget.dart';
import 'package:admin_app/features/order/domain/models/order_model.dart';
import 'package:admin_app/helper/string_formater.dart';
import 'package:admin_app/util/images.dart';
import 'package:admin_app/util/styles.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatefulWidget {
  final OrderModel order;

  const OrderCard({super.key, required this.order});

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Theme.of(context).hintColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStoreInfo(context, widget.order.store!),
          const SizedBox(height: 8),
          _buildOrderNumber(context, widget.order.orderId!),
          const SizedBox(height: 8),
          _buildDeliveryStatus(context, widget.order.orderType!),
          const SizedBox(height: 8),
          _buildCustomerInfo(context, widget.order.customer!),
          const SizedBox(height: 8),
          widget.order.coupon != null ? _buildCouponInfo(context, widget.order.coupon!) : const SizedBox(),
          // const SizedBox(height: 8),
          /*_buildOrderTiming(context, widget.order.pendingAt, widget.order.processingAt, widget.order.handoverAt, widget.order.pickedUpAt, widget.order.estimatedArrivalAt,widget.order.estimatedProcessingTime),*/

          OrderTimingWidget(
            orderStatus: widget.order.orderStatus!,
            pendingAt: widget.order.pendingAt ?? DateTime.now(),
            processingAt: widget.order.processingAt ?? DateTime.now(),
            estimatedProcessingTime: widget.order.estimatedProcessingTime ?? 0,
            handoverAt: widget.order.handoverAt ?? DateTime.now(),
            estimatedArrivalAt: widget.order.estimatedArrivalAt ?? DateTime.now(),
            currentTime: widget.order.currentTime ?? DateTime.now(),
          ),
        ],
      ),
    );
  }

  Widget _buildStoreInfo(BuildContext context, Store store) {
    return Row(
      children: [
        ClipOval(
          child: CustomImage(image: store.logoUrl!, height: 28, width: 28),
        ),
        const SizedBox(width: 8),

        Text(
          store.name!,
          style: robotoRegular.copyWith(
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
      ],
    );
  }

  Widget _buildOrderNumber(BuildContext context, String orderId) {
    return Text(
      "Order #$orderId",
      style: robotoBold.copyWith(
        color: Theme.of(context).textTheme.bodyLarge?.color,
      ),
    );
  }

  Widget _buildDeliveryStatus(BuildContext context, String orderType) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDeliveryMethod(context, orderType),
        if (orderType == "delivery") _buildRiderInfo(context),
      ],
    );
  }

  Widget _buildDeliveryMethod(BuildContext context, String orderType) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border.all(color: Theme.of(context).primaryColor, width: 1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        StringFormater.formatString(orderType),
        style: robotoRegular.copyWith(
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  Widget _buildRiderInfo(BuildContext context) {
    // Determine the rider icon color and text based on deliveryMan presence
    final riderIconColor = widget.order.deliveryMan != null
        ? Colors.blue
        : Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black;

    final riderText = widget.order.deliveryMan?.name ?? "No rider yet";

    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: CircleAvatar(
            backgroundColor: Theme.of(context).textTheme.bodyLarge?.color,
            maxRadius: 2,
          ),
        ),
        Image.asset(
          Images.rider,
          height: 16,
          width: 16,
          color: riderIconColor,
        ),
        const SizedBox(width: 10),
        Text(
          riderText,
          style: robotoRegular.copyWith(
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildCustomerInfo(BuildContext context, Customer customer) {
    return Row(
      children: [
        Image.asset(Images.person, height: 16, width: 16),
        const SizedBox(width: 10),
        Text(
          customer.name!,
          style: robotoRegular.copyWith(
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
        const SizedBox(width: 10),
        if (customer.numberOfOrders == 1) _buildFirstOrderBadge(context),
      ],
    );
  }

  Widget _buildFirstOrderBadge(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
      decoration: BoxDecoration(
        color: const Color(0xFFF9DB4A),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        "1st",
        style: robotoRegular.copyWith(
          color: Theme.of(context).textTheme.bodyLarge?.color,
        ),
      ),
    );
  }

  Widget _buildCouponInfo(BuildContext context, Coupon coupon) {
    return Row(
      children: [
        Image.asset(Images.coupon, height: 16, width: 16),
        const SizedBox(width: 10),
        Text(
          coupon.title!,
          style: robotoRegular.copyWith(
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
      ],
    );
  }

/*  Widget _buildOrderTiming(BuildContext context, DateTime? pendingAt, DateTime? processingAt, DateTime? handoverAt, DateTime? pickedUpAt,
      DateTime? estimatedArrivalAt, int? estimatedProcessingTime) {
    return widget.order.orderStatus == 'processing'
        ? _buildProcessingTimeBadge(context, widget.order.currentTime!,
            widget.order.processingAt!, widget.order.estimatedProcessingTime!)
        : _buildTimeBadge(context);
  }

  Widget _buildProcessingTimeBadge(BuildContext context, DateTime currentTime,
      DateTime processingAt, int estimatedProcessingTime) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        calculateRemainingTime(currentTime, processingAt, estimatedProcessingTime),
        style: robotoRegular.copyWith(
          color: Theme.of(context).cardColor,
        ),
      ),
    );
  }

  String calculateRemainingTime(DateTime currentTime, DateTime processingAt, int estimatedProcessingTime) {
    // Calculate end time by adding the estimated processing time to processingAt
    DateTime endTime =
    processingAt.add(Duration(minutes: estimatedProcessingTime));

    // Calculate remaining time duration
    Duration remainingTime = endTime.difference(currentTime);

    if (remainingTime.isNegative) {
      // If the remaining time is negative, calculate elapsed time since end time
      Duration elapsedTime = currentTime.difference(endTime);
      int hours = elapsedTime.inHours;
      int minutes = elapsedTime.inMinutes % 60;
      int seconds = elapsedTime.inSeconds % 60;

      // Format the elapsed time based on the duration
      if (hours > 0) {
        // Include hours if more than an hour
        return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
      } else {
        // Only minutes and seconds if less than an hour
        return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
      }
    }

    // Convert remaining time to hours, minutes, and seconds
    int hours = remainingTime.inHours;
    int minutes = remainingTime.inMinutes % 60;
    int seconds = remainingTime.inSeconds % 60;

    // Format the remaining time based on the duration
    if (hours > 0) {
      // Include hours if more than an hour
      return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    } else {
      // Only minutes and seconds if less than an hour
      return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    }
  }

  Widget _buildTimeBadge(BuildContext context) {
    // isProcessing ? Container(
    //   margin: const EdgeInsets.symmetric(vertical: 8),
    //   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
    //   decoration: BoxDecoration(
    //     color: Colors.green,
    //     borderRadius: BorderRadius.circular(30),
    //   ),
    //   child: Text(
    //     '03.30 left',
    //     style: robotoRegular.copyWith(color: Theme
    //         .of(context)
    //         .cardColor),
    //   ),
    // ) : Row(
    //   children: [
    //     Container(
    //       margin: const EdgeInsets.symmetric(vertical: 8),
    //       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
    //       decoration: BoxDecoration(
    //         color: Theme
    //             .of(context)
    //             .textTheme
    //             .bodyLarge
    //             ?.color,
    //         borderRadius: BorderRadius.circular(30),
    //       ),
    //       child: Text(
    //         isOnTheWay ? 'Arriving in 03:00' : '03.30',
    //         style: robotoRegular.copyWith(color: Theme
    //             .of(context)
    //             .cardColor),
    //       ),
    //     ),
    //     const SizedBox(width: 16),
    //
    //     isOnTheWay ? const SizedBox() : Text(
    //       "Ordered On 10.00 PM",
    //       style: robotoRegular.copyWith(color: Theme
    //           .of(context)
    //           .hintColor),
    //     ),
    //   ],
    // );

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: Theme.of(context).textTheme.bodyLarge?.color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        true ? 'Arriving in 03:00' : '03.30',
        style: robotoRegular.copyWith(
          color: Theme.of(context).cardColor,
        ),
      ),
    );
  }*/

}
