class OrderDetailsModel {
  String? orderId;
  String? orderStatus;
  String? orderType;
  String? paymentMethod;
  dynamic note;
  Store? store;
  Customer? customer;
  Coupon? coupon;
  DeliveryMan? deliveryMan;
  String? pendingAt;
  dynamic processingAt;
  dynamic handoverAt;
  dynamic pickedUpAt;
  dynamic estimatedArrivalAt;
  String? currentTime;
  dynamic estimatedProcessingTime;
  List<ItemDetails>? itemDetails;
  int? subtotal;
  int? processingFee;
  int? deliveryCharge;
  int? deliveryTip;

  OrderDetailsModel({
    this.orderId,
    this.orderStatus,
    this.orderType,
    this.paymentMethod,
    this.note,
    this.store,
    this.customer,
    this.coupon,
    this.deliveryMan,
    this.pendingAt,
    this.processingAt,
    this.handoverAt,
    this.pickedUpAt,
    this.estimatedArrivalAt,
    this.currentTime,
    this.estimatedProcessingTime,
    this.itemDetails,
    this.subtotal,
    this.processingFee,
    this.deliveryCharge,
    this.deliveryTip,
  });

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderStatus = json['order_status'];
    orderType = json['order_type'];
    paymentMethod = json['payment_method'];
    note = json['note'];
    store = json['store'] != null ? Store.fromJson(json['store']) : null;
    customer = json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    coupon = json['coupon'] != null ? Coupon.fromJson(json['coupon']) : null;
    deliveryMan = json['delivery_man'] != null ? DeliveryMan.fromJson(json['delivery_man']) : null;
    pendingAt = json['pending_at'];
    processingAt = json['processing_at'];
    handoverAt = json['handover_at'];
    pickedUpAt = json['picked_up_at'];
    estimatedArrivalAt = json['estimated_arrival_at'];
    currentTime = json['current_time'];
    estimatedProcessingTime = json['estimated_processing_time'];
    if (json['item_details'] != null) {
      itemDetails = <ItemDetails>[];
      json['item_details'].forEach((v) {
        itemDetails!.add(ItemDetails.fromJson(v));
      });
    }
    subtotal = json['subtotal'];
    processingFee = json['processing_fee'];
    deliveryCharge = json['delivery_charge'];
    deliveryTip = json['delivery_tip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = orderId;
    data['order_status'] = orderStatus;
    data['order_type'] = orderType;
    data['payment_method'] = paymentMethod;
    data['note'] = note;
    if (store != null) {
      data['store'] = store!.toJson();
    }
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    if (coupon != null) {
      data['coupon'] = coupon!.toJson();
    }
    if (deliveryMan != null) {
      data['delivery_man'] = deliveryMan!.toJson();
    }
    data['pending_at'] = pendingAt;
    data['processing_at'] = processingAt;
    data['handover_at'] = handoverAt;
    data['picked_up_at'] = pickedUpAt;
    data['estimated_arrival_at'] = estimatedArrivalAt;
    data['current_time'] = currentTime;
    data['estimated_processing_time'] = estimatedProcessingTime;
    if (itemDetails != null) {
      data['item_details'] = itemDetails!.map((v) => v.toJson()).toList();
    }
    data['subtotal'] = subtotal;
    data['processing_fee'] = processingFee;
    data['delivery_charge'] = deliveryCharge;
    data['delivery_tip'] = deliveryTip;
    return data;
  }
}

class Store {
  String? name;
  String? logoUrl;
  String? phone;
  String? latitude;
  String? longitude;

  Store({this.name, this.logoUrl, this.phone, this.latitude, this.longitude});

  Store.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    logoUrl = json['logo_url'];
    phone = json['phone'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['logo_url'] = logoUrl;
    data['phone'] = phone;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}

class Customer {
  String? name;
  int? orderCount;
  String? phone;
  String? latitude;
  String? longitude;
  dynamic imageUrl;

  Customer({
    this.name,
    this.orderCount,
    this.phone,
    this.latitude,
    this.longitude,
    this.imageUrl,
  });

  Customer.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    orderCount = json['order_count'];
    phone = json['phone'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['order_count'] = orderCount;
    data['phone'] = phone;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['image_url'] = imageUrl;
    return data;
  }
}

class DeliveryMan {
  String? name;
  String? phone;
  int? ordersCount;
  String? imageUrl;

  DeliveryMan({this.name, this.phone, this.ordersCount, this.imageUrl});

  DeliveryMan.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    ordersCount = json['orders_count'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['phone'] = phone;
    data['orders_count'] = ordersCount;
    data['image_url'] = imageUrl;
    return data;
  }
}

class ItemDetails {
  String? name;
  int? quantity;
  String? image;
  List<Variation>? variation;
  List<AddOns>? addOns;
  int? price;

  ItemDetails({
    this.name,
    this.quantity,
    this.image,
    this.variation,
    this.addOns,
    this.price,
  });

  ItemDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    quantity = json['quantity'];
    image = json['image'];
    if (json['variation'] != null) {
      variation = <Variation>[];
      json['variation'].forEach((v) {
        variation!.add(Variation.fromJson(v));
      });
    }
    if (json['addOns'] != null) {
      addOns = <AddOns>[];
      json['addOns'].forEach((v) {
        addOns!.add(AddOns.fromJson(v));
      });
    }
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['quantity'] = quantity;
    data['image'] = image;
    if (variation != null) {
      data['variation'] = variation!.map((v) => v.toJson()).toList();
    }
    if (addOns != null) {
      data['addOns'] = addOns!.map((v) => v.toJson()).toList();
    }
    data['price'] = price;
    return data;
  }
}

class Variation {
  String? name;
  List<Values>? values;

  Variation({this.name, this.values});

  Variation.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['values'] != null) {
      values = <Values>[];
      json['values'].forEach((v) {
        values!.add(Values.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (values != null) {
      data['values'] = values!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Values {
  String? name;
  int? price;

  Values({this.name, this.price});

  Values.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['price'] = price;
    return data;
  }
}

class AddOns {
  String? name;
  int? price;
  String? quantity;

  AddOns({this.name, this.price, this.quantity});

  AddOns.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['price'] = price;
    data['quantity'] = quantity;
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
