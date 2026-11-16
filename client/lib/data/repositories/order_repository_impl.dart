import 'package:dio/dio.dart';
import '../../domain/entities/order.dart';
import '../../domain/repositories/order_repository.dart';
import '../datasources/remote/order_api_client.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderApiClient _apiClient;

  OrderRepositoryImpl({
    required OrderApiClient apiClient,
  }) : _apiClient = apiClient;

  @override
  Future<List<Order>> getOrders() async {
    try {
      final orders = await _apiClient.getOrders();
      return orders;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Unexpected error while fetching orders: $e');
    }
  }

  @override
  Future<Order> createOrder(Order order) async {
    try {
      validateOrder(order);
      final createdOrder = await _apiClient.createOrder(order);
      return createdOrder;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      if (e is ArgumentError) {
        rethrow;
      }
      throw Exception('Unexpected error while creating order: $e');
    }
  }

  @override
  void validateOrder(Order order) {
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

  Exception _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return Exception('Connection timeout. Please check your internet connection.');
      case DioExceptionType.connectionError:
        return Exception('No internet connection. Please check your network settings.');
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final message = error.response?.data?['message'] ?? 'Unknown error';
        if (statusCode == 400) {
          return Exception('Bad request: $message');
        } else if (statusCode == 401) {
          return Exception('Unauthorized. Please log in again.');
        } else if (statusCode == 403) {
          return Exception('Forbidden. You do not have permission.');
        } else if (statusCode == 404) {
          return Exception('Resource not found.');
        } else if (statusCode == 500) {
          return Exception('Server error. Please try again later.');
        }
        return Exception('Server error: $statusCode - $message');
      case DioExceptionType.cancel:
        return Exception('Request was cancelled.');
      default:
        return Exception('Network error occurred. Please try again.');
    }
  }
}