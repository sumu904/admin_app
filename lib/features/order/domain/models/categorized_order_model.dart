import 'package:admin_app/features/order/domain/models/order_model.dart';

class CategorizedOrderModel {
  late List<OrderModel> pending;
  late List<OrderModel> processing;
  late List<OrderModel> handover;
  late List<OrderModel> outForDelivery;

  CategorizedOrderModel({
    required this.pending,
    required this.processing,
    required this.handover,
    required this.outForDelivery,
  });

  CategorizedOrderModel.fromJson(Map<String, dynamic> json) {
    pending = List<OrderModel>.from(
        json['pending'].map((item) => OrderModel.fromJson(item)));
    processing = List<OrderModel>.from(
        json['processing'].map((item) => OrderModel.fromJson(item)));
    handover = List<OrderModel>.from(
        json['handover'].map((item) => OrderModel.fromJson(item)));
    outForDelivery = List<OrderModel>.from(
        json['outForDelivery'].map((item) => OrderModel.fromJson(item)));
  }

  Map<String, dynamic> toJson() {
    return {
      'pending': pending.map((v) => v.toJson()).toList(),
      'processing': processing.map((v) => v.toJson()).toList(),
      'handover': handover.map((v) => v.toJson()).toList(),
      'outForDelivery': outForDelivery.map((v) => v.toJson()).toList(),
    };
  }
}
