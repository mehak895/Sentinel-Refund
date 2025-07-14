
import 'package:flutter/material.dart';

class RefundRejectionReasonScreen extends StatelessWidget {
  final Map<String, dynamic> request;
  final VoidCallback? onReject;

  const RefundRejectionReasonScreen({
    super.key,
    required this.request,
    this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    final String rejectionReason = request['flagReason'] ?? 'Suspicious activity';

    return Scaffold(
      appBar: AppBar(title: const Text('Reject Refund')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Product: ${request['product']}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Text('Reason for rejection:', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(
              rejectionReason,
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                    onPressed: () {
                      if (onReject != null) {
                        onReject!();
                      }
                      Navigator.popUntil(context, (route) => route.isFirst);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Refund rejected successfully')),
                      );
                    },
                    child: const Text('Confirm Reject'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
