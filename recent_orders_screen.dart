import 'package:flutter/material.dart';
import 'package:sentinelrefund/request_refund_screen.dart'; // ✅ Update this path as needed

class RecentOrdersScreen extends StatelessWidget {
  const RecentOrdersScreen({super.key});

  final List<Map<String, String>> orders = const [
    {
      'item': 'Aashirvaad Atta 20kg',
      'date': '12 July 2025',
      'status': 'Delivered',
    },
    {
      'item': 'Tata Salt 1kg x10',
      'date': '10 July 2025',
      'status': 'Refund Requested',
    },
    {
      'item': 'Parle-G 5 Rs x50',
      'date': '08 July 2025',
      'status': 'Delivered',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recent Orders'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: orders.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final order = orders[index];
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 2,
            child: ListTile(
              onTap: () {
                if (order['item'] == 'Parle-G 5 Rs x50') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RequestRefundScreen()),
                  );
                }
              },
              title: Text(order['item']!, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Date: ${order['date']!}'),
              trailing: Text(
                order['status']!,
                style: TextStyle(
                  color: order['status'] == 'Refund Requested' ? Colors.red : Colors.green,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}