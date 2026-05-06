import 'package:flutter/material.dart';
import 'package:my_vault/common/constants.dart';

class SendMoneyScreen extends StatefulWidget {
  static const route = '/send-money';

  @override
  State<SendMoneyScreen> createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  bool _sent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text('Send Money'),
      ),
      body: Card(
        margin: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(29),
            topRight: Radius.circular(29),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: _sent
              ? const Center(
                  child: Text(
                    'Transfer successful',
                    key: Key('success.title'),
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                )
              : Column(
                  children: [
                    const TextField(
                      key: Key('send.recipient'),
                      decoration: InputDecoration(labelText: 'Recipient'),
                    ),
                    const SizedBox(height: 12),
                    const TextField(
                      key: Key('send.amount'),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Amount'),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      key: const Key('confirm.send'),
                      onPressed: () => setState(() => _sent = true),
                      child: const Text('Send'),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
