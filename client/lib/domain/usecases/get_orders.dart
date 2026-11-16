import '../entities/order.dart';
import '../repositories/order_repository.dart';

class GetOrders {
  final OrderRepository orderRepository;

  GetOrders(this.orderRepository);

  Future<List<Order>> call() async {
    try {
      final orders = await orderRepository.getOrders();
      return orders;
    } catch (e) {
      // Log the error for debugging purposes
      print('Error fetching orders: $e');
      // Re-throw the exception to be handled by the presentation layer
      throw Exception('Failed to fetch orders: $e');
    }
  }
}