import 'package:flutter/material.dart';
import 'refund_rejection_reason_screen.dart';

class FlaggedRequestsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> flaggedRequests;
  final void Function(Map<String, dynamic>)? onReject;
  final void Function(Map<String, dynamic>)? onPassBack;

  const FlaggedRequestsScreen({
    super.key,
    required this.flaggedRequests,
    this.onReject,
    this.onPassBack,
  });

  bool canReject(Map<String, dynamic> request) {
    final product = request['product'] as String;
    final time = request['time'] as DateTime;
    final now = DateTime.now();
    final difference = now.difference(time);
    return product == 'Parle-G' && difference.inMinutes <= 30;
  }

  void _goToRejectionReason(BuildContext context, Map<String, dynamic> request) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => RefundRejectionReasonScreen(
          request: request,
          onReject: () {
            if (onReject != null) onReject!(request);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flagged Refund Requests')),
      body: flaggedRequests.isEmpty
          ? const Center(child: Text('No flagged requests.'))
          : ListView.builder(
        itemCount: flaggedRequests.length,
        itemBuilder: (context, index) {
          final request = flaggedRequests[index];
          final flagReason = request['flagReason'] ?? 'Not specified';
          final rejectable = canReject(request);

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            elevation: 3,
            child: ListTile(
              title: Text(request['product'], style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Time: ${request['time'].toLocal()}'.split('.')[0]),
                  Text('Flagged Reason: $flagReason', style: const TextStyle(color: Colors.redAccent)),
                ],
              ),
              trailing: rejectable
                  ? ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                onPressed: () => _goToRejectionReason(context, request),
                child: const Text('Reject'),
              )
                  : const Text('Cannot reject', style: TextStyle(color: Colors.grey)),
            ),
          );
        },
      ),
    );
  }
}
