import 'package:dio/dio.dart';
import '../../../domain/entities/order.dart';
import '../../../core/constants/api_constants.dart';

class OrderApiClient {
  final Dio dio;

  OrderApiClient(this.dio);

  Future<List<Order>> getOrders() async {
    try {
      final response = await dio.get(ApiConstants.ordersEndpoint);
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => Order.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load orders: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Dio error fetching orders: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error fetching orders: $e');
    }
  }

  Future<Order> createOrder(Order order) async {
    try {
      final response = await dio.post(
        ApiConstants.ordersEndpoint,
        data: order.toJson(),
      );
      if (response.statusCode == 201) {
        return Order.fromJson(response.data);
      } else {
        throw Exception('Failed to create order: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Dio error creating order: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error creating order: $e');
    }
  }
}