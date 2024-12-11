import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/notification_provider.dart';

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_backspace,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          "Notifications",
        ),
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: Consumer<NotificationProvider>(
          builder: (context, provider, child) {
            return ListView.builder(
              itemCount: provider.notifications.length,
              itemBuilder: (context, index) {
                final notification = provider.notifications[index];
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: notification.iconColor,
                        child: Icon(
                          notification.icon,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(notification.title),
                      onTap: () {
                        // Handle click if needed
                      },
                    ),
                    Divider(),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
