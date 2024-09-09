import 'package:admin_app/features/order/domain/models/categorized_order_model.dart';

abstract class OrderServiceInterface {
  Future<CategorizedOrderModel?> getCategorizedOrders();
}