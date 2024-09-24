import 'package:admin_app/features/order/domain/models/categorized_order_model.dart';
import 'package:admin_app/features/order/domain/models/order_details.dart';
import 'package:admin_app/features/order/domain/repositories/order_repository.dart';
import 'package:admin_app/features/order/domain/services/order_service_interface.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  final OrderServiceInterface orderServiceInterface;
  final OrderRepository orderRepository;

  OrderController({required this.orderServiceInterface,required this.orderRepository});

  // Reactive state variables
  var categorizedOrders = Rxn<CategorizedOrderModel>();  // Nullable reactive type
  var errorMessage = ''.obs;  // Observable string

  // Fetch categorized orders from the API
  Future<void> getCategorizedOrders() async {
    try {
      final orders = await orderServiceInterface.getCategorizedOrders();
      if (orders != null) {
        categorizedOrders.value = orders;  // Updates the Rx variable
        errorMessage.value = '';  // Reset error message on success
      } else {
        errorMessage.value = "Failed to fetch orders. Please try again later.";
      }
    } catch (e) {
      errorMessage.value = "Error occurred: $e";  // Handle any exceptions
    }
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  OrderDetailsModel? _orderDetailsModel;
  OrderDetailsModel? get orderDetailsModel => _orderDetailsModel;

  Future<void> getOrderDetails({required String orderId}) async {
    try {
      _isLoading = true;
      _orderDetailsModel =null;
      update();
      final orderDetails = await orderServiceInterface.getOrderDetails(orderId: orderId);
      if (orderDetails != null) {
        _orderDetailsModel = orderDetails;
        errorMessage.value = '';
      } else {
        errorMessage.value = "Failed to fetch order details. Please try again later.";
      }
    } catch (e) {
      errorMessage.value = "Error occurred: $e";  // Handle any exceptions
    }
    _isLoading = false;
    update();
  }

}
