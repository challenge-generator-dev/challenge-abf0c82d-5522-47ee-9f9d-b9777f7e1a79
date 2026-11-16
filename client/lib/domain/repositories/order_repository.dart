import '../entities/order.dart';

abstract class OrderRepository {
  Future<List<Order>> getOrders();
  Future<Order> createOrder(Order order);

  /// Validates the order data before sending it to the API.
  /// Throws [ArgumentError] if the order is invalid.
  void validateOrder(Order order) {
    if (order.id.isEmpty) {
      throw ArgumentError('Order ID cannot be empty');
    }
    if (order.userId.isEmpty) {
      throw ArgumentError('User ID cannot be empty');
    }
    if (order.items.isEmpty) {
      throw ArgumentError('Order must have at least one item');
    }
    if (order.total <= 0) {
      throw ArgumentError('Total must be greater than zero');
    }
    if (order.status.isEmpty) {
      throw ArgumentError('Status cannot be empty');
    }
    if (order.createdAt.isEmpty) {
      throw ArgumentError('CreatedAt cannot be empty');
    }
    for (final item in order.items) {
      if (item.productId.isEmpty) {
        throw ArgumentError('Product ID cannot be empty');
      }
      if (item.quantity <= 0) {
        throw ArgumentError('Quantity must be greater than zero');
      }
      if (item.price <= 0) {
        throw ArgumentError('Price must be greater than zero');
      }
    }
  }
}