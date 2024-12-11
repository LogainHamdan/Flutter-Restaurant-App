import 'package:flutter/material.dart';

// Notification Model
class NotificationItem {
  final String title;
  final IconData icon;
  final Color iconColor;

  NotificationItem({
    required this.title,
    required this.icon,
    required this.iconColor,
  });
}

// Notification Provider
class NotificationProvider with ChangeNotifier {
  List<NotificationItem> _notifications = [
    NotificationItem(
      title: "Your Order has been delivered successfully",
      icon: Icons.check,
      iconColor: Colors.green,
    ),
    NotificationItem(
      title: "Error processing your order",
      icon: Icons.clear,
      iconColor: Colors.red,
    ),
    NotificationItem(
      title: "Your order has been processed and will be delivered shortly",
      icon: Icons.directions_bike,
      iconColor: Colors.orange,
    ),
    NotificationItem(
      title: "Please Verify your email address",
      icon: Icons.email,
      iconColor: Colors.blue,
    ),
  ];

  List<NotificationItem> get notifications => _notifications;
}
