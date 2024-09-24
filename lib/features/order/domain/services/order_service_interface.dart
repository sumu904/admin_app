import 'package:admin_app/features/order/domain/models/categorized_order_model.dart';
import 'package:admin_app/features/order/domain/models/order_details.dart';

abstract class OrderServiceInterface {
  Future<CategorizedOrderModel?> getCategorizedOrders();
  Future<OrderDetailsModel?> getOrderDetails({required String orderId});
}