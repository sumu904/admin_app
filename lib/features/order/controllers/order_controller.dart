import 'package:admin_app/features/order/domain/models/categorized_order_model.dart';
import 'package:admin_app/features/order/domain/services/order_service_interface.dart';
import 'package:get/get.dart';

class OrderController extends GetxController implements GetxService {
  final OrderServiceInterface orderServiceInterface;

  OrderController({required this.orderServiceInterface});

  String? _errorMessage;

  CategorizedOrderModel? _categorizedOrders;
  CategorizedOrderModel? get categorizedOrders => _categorizedOrders;

  String? get errorMessage => _errorMessage;

  Future<void> getCategorizedOrders() async {
    CategorizedOrderModel? categorizedOrders =
        await orderServiceInterface.getCategorizedOrders();
    if (categorizedOrders != null) {
      _categorizedOrders = categorizedOrders;
    } else {
      _errorMessage = "Failed to fetch orders. Please try again later.";
    }
    update(); // Notify listeners to update the UI
  }
}
