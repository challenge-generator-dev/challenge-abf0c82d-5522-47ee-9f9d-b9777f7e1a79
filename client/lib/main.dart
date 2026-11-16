import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'data/datasources/remote/order_api_client.dart';
import 'data/repositories/order_repository_impl.dart';
import 'domain/usecases/get_orders.dart';
import 'presentation/screens/orders_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ));
    
    final orderApiClient = OrderApiClient(dio);
    final orderRepository = OrderRepositoryImpl(
      apiClient: orderApiClient,
    );
    final getOrders = GetOrders(orderRepository);

    return MaterialApp(
      title: 'Order Management',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: OrdersScreen(getOrders: getOrders),
    );
  }
}