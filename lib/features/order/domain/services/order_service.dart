import 'package:admin_app/features/order/domain/models/categorized_order_model.dart';
import 'package:admin_app/features/order/domain/models/order_details.dart';
import 'package:admin_app/features/order/domain/repositories/order_repository_interface.dart';
import 'package:admin_app/features/order/domain/services/order_service_interface.dart';

class OrderService implements OrderServiceInterface {
  final OrderRepositoryInterface orderRepositoryInterface;
  OrderService({required this.orderRepositoryInterface});

  @override
  Future<CategorizedOrderModel?> getCategorizedOrders() async {
    return await orderRepositoryInterface.getCategorizedOrders();
  }

  Future<OrderDetailsModel?> getOrderDetails({required String orderId}) async {
    return await orderRepositoryInterface.getOrderDetails(orderId: orderId);
  }
}