import 'package:flutter/foundation.dart';

@immutable
class Order {
  final String id;
  final String userId;
  final List<OrderItem> items;
  final double total;
  final String status;
  final String createdAt;

  const Order({
    required this.id,
    required this.userId,
    required this.items,
    required this.total,
    required this.status,
    required this.createdAt,
  });

  Order copyWith({
    String? id,
    String? userId,
    List<OrderItem>? items,
    double? total,
    String? status,
    String? createdAt,
  }) {
    return Order(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      items: items ?? this.items,
      total: total ?? this.total,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'items': items.map((item) => item.toJson()).toList(),
      'total': total,
      'status': status,
      'createdAt': createdAt,
    };
  }

  factory Order.fromJson(Map<String, dynamic> json) {
    final order = Order(
      id: json['id'] as String,
      userId: json['userId'] as String,
      items: (json['items'] as List)
          .map((itemJson) => OrderItem.fromJson(itemJson as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toDouble(),
      status: json['status'] as String,
      createdAt: json['createdAt'] as String,
    );
    order._validate();
    return order;
  }

  void _validate() {
    assert(id.isNotEmpty, 'Order ID cannot be empty');
    assert(userId.isNotEmpty, 'User ID cannot be empty');
    assert(items.isNotEmpty, 'Order must have at least one item');
    assert(total > 0, 'Total must be greater than zero');
    assert(status.isNotEmpty, 'Status cannot be empty');
    assert(createdAt.isNotEmpty, 'CreatedAt cannot be empty');
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Order &&
        other.id == id &&
        other.userId == userId &&
        other.total == total &&
        other.status == status &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return Object.hash(id, userId, total, status, createdAt);
  }

  @override
  String toString() {
    return 'Order(id: $id, userId: $userId, items: ${items.length}, total: $total, status: $status, createdAt: $createdAt)';
  }
}

@immutable
class OrderItem {
  final String productId;
  final int quantity;
  final double price;

  const OrderItem({
    required this.productId,
    required this.quantity,
    required this.price,
  });

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'quantity': quantity,
      'price': price,
    };
  }

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    final item = OrderItem(
      productId: json['productId'] as String,
      quantity: json['quantity'] as int,
      price: (json['price'] as num).toDouble(),
    );
    item._validate();
    return item;
  }

  void _validate() {
    assert(productId.isNotEmpty, 'Product ID cannot be empty');
    assert(quantity > 0, 'Quantity must be greater than zero');
    assert(price > 0, 'Price must be greater than zero');
  }

  double get subtotal => quantity * price;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrderItem &&
        other.productId == productId &&
        other.quantity == quantity &&
        other.price == price;
  }

  @override
  int get hashCode {
    return Object.hash(productId, quantity, price);
  }

  @override
  String toString() {
    return 'OrderItem(productId: $productId, quantity: $quantity, price: $price)';
  }
}