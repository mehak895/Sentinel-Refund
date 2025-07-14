import 'package:flutter/material.dart';
import 'flagged_requests_screen.dart';

class RefundRequestsScreen extends StatefulWidget {
  const RefundRequestsScreen({super.key});

  @override
  State<RefundRequestsScreen> createState() => _RefundRequestsScreenState();
}

class _RefundRequestsScreenState extends State<RefundRequestsScreen> {
  List<Map<String, dynamic>> refundRequests = [
    {
      'product': 'Parle-G',
      'time': DateTime.now().subtract(const Duration(minutes: 10)),
    },
    {
      'product': 'Maggi',
      'time': DateTime.now().subtract(const Duration(hours: 1)),
    },
  ];

  List<Map<String, dynamic>> flaggedRequests = [];

  void _flagRequest(int index) {
    final request = refundRequests[index];
    final now = DateTime.now();
    final difference = now.difference(request['time']);

    String reason = 'Suspicious refund activity';
    if (request['product'] == 'Parle-G' && difference.inMinutes <= 30) {
      reason = 'Customer requested refund within half hour, which is against policy.';
    } else {
      reason = 'Too many refunds or timing issue';
    }

    setState(() {
      refundRequests.removeAt(index);
      flaggedRequests.add({
        ...request,
        'flagReason': reason,
      });
    });
  }

  void _passRequest(int index) {
    setState(() {
      refundRequests.removeAt(index);
    });
  }

  void _goToFlaggedPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => FlaggedRequestsScreen(
          flaggedRequests: flaggedRequests,
          onReject: (request) {
            setState(() {
              flaggedRequests.remove(request);
            });
          },
          onPassBack: (request) {
            setState(() {
              flaggedRequests.remove(request);
              refundRequests.add(request);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Refund Requests'),
        actions: [
          IconButton(
            icon: const Icon(Icons.flag),
            onPressed: _goToFlaggedPage,
            tooltip: 'View Flagged Requests',
          ),
        ],
      ),
      body: refundRequests.isEmpty
          ? const Center(child: Text('No refund requests'))
          : ListView.builder(
        itemCount: refundRequests.length,
        itemBuilder: (context, index) {
          final request = refundRequests[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: ListTile(
              title: Text(request['product']),
              subtitle: Text('Requested at: ${request['time'].toLocal()}'.split('.')[0]),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.flag, color: Colors.red),
                    onPressed: () => _flagRequest(index),
                  ),
                  IconButton(
                    icon: const Icon(Icons.check_circle, color: Colors.green),
                    onPressed: () => _passRequest(index),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}