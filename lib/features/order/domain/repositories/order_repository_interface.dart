import 'package:admin_app/interface/repository_interface.dart';

abstract class OrderRepositoryInterface implements RepositoryInterface {
  Future<dynamic> getCategorizedOrders();
  Future<dynamic> getOrderDetails({required String orderId});
}