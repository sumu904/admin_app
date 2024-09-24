class PaginatedOrderModel {
  int? totalSize;
  String? limit;
  String? offset;
  List<OrderModel>? orders;

  PaginatedOrderModel({this.totalSize, this.limit, this.offset, this.orders});

  PaginatedOrderModel.fromJson(Map<String, dynamic> json) {
    totalSize = json['total_size'];
    limit = json['limit'].toString();
    offset = json['offset'].toString();
    if (json['orders'] != null) {
      orders = [];
      json['orders'].forEach((v) {
        orders!.add(OrderModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_size'] = totalSize;
    data['limit'] = limit;
    data['offset'] = offset;
    if (orders != null) {
      data['orders'] = orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderModel {
  String? orderId;
  String? orderStatus;
  String? orderType;

  Store? store;
  Customer? customer;
  Coupon? coupon;
  DeliveryMan? deliveryMan;

  DateTime? pendingAt;
  DateTime? processingAt;
  DateTime? handoverAt;
  DateTime? pickedUpAt;
  DateTime? estimatedArrivalAt;
  DateTime? currentTime;
  int? estimatedProcessingTime;

  OrderModel({
    this.orderId,
    this.orderStatus,
    this.orderType,
    this.store,
    this.customer,
    this.coupon,
    this.pendingAt,
    this.processingAt,
    this.handoverAt,
    this.pickedUpAt,
    this.estimatedProcessingTime,
    this.estimatedArrivalAt,
    this.currentTime,
  });

  OrderModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderStatus = json['order_status'];
    orderType = json['order_type'];

    store = Store.fromJson(json['store']);
    customer = Customer.fromJson(json['customer']);
    coupon = json['coupon'] != null ? Coupon.fromJson(json['coupon']) : null;
    deliveryMan = json['delivery_man'] != null
        ? DeliveryMan.fromJson(json['delivery_man'])
        : null;

    pendingAt =
        json['pending_at'] != null ? DateTime.parse(json['pending_at']) : null;
    processingAt = json['processing_at'] != null
        ? DateTime.parse(json['processing_at'])
        : null;
    handoverAt = json['handover_at'] != null
        ? DateTime.parse(json['handover_at'])
        : null;
    pickedUpAt = json['picked_up_at'] != null
        ? DateTime.parse(json['picked_up_at'])
        : null;
    estimatedArrivalAt = json['estimated_arrival_at'] != null
        ? DateTime.parse(json['estimated_arrival_at'])
        : null;
    currentTime = json['current_time'] != null
        ? DateTime.tryParse(json['current_time'])
        : null;
    estimatedProcessingTime = json['estimated_processing_time'];
  }

  int? get timeInPending {
    if (pendingAt == null || currentTime == null) return null;
    return currentTime!.difference(pendingAt!).inSeconds;
  }

  int? get timeInHandover {
    if (handoverAt == null || currentTime == null) return null;
    return currentTime!.difference(handoverAt!).inSeconds;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = orderId;
    data['order_status'] = orderStatus;
    data['order_type'] = orderType;
    data['store'] = store?.toJson();
    data['customer'] = customer?.toJson();
    data['coupon'] = coupon?.toJson();
    data['pending_at'] = pendingAt;
    data['processing_at'] = processingAt;
    data['handover_at'] = handoverAt;
    data['picked_up_at'] = pickedUpAt;
    data['estimated_processing_time'] = estimatedProcessingTime;
    data['delivery_man'] = deliveryMan?.toJson();
    data['estimated_arrival_at'] = estimatedArrivalAt;
    return data;
  }
}

class DeliveryMan {
  String? name;

  DeliveryMan({
    this.name,
  });

  DeliveryMan.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}

class Store {
  String? name;
  String? logoUrl;

  Store({
    this.name,
    this.logoUrl,
  });

  Store.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    logoUrl = json['logo_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['logo_url'] = logoUrl;
    return data;
  }
}

class Customer {
  String? name;
  int? numberOfOrders;

  Customer({
    this.name,
    this.numberOfOrders,
  });

  Customer.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    numberOfOrders = json['number_of_orders'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['number_of_orders'] = numberOfOrders;
    return data;
  }
}

class Coupon {
  String? title;

  Coupon({
    this.title,
  });

  Coupon.fromJson(Map<String, dynamic> json) {
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    return data;
  }
}
