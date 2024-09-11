// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import '../services/account_service.dart';

class HomeScreen extends StatelessWidget {
  final AccountService _accountService = AccountService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Handle logout
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: _accountService.getAccountDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            var account = snapshot.data;
            return Column(
              children: [
                Text('Account Balance: \$${account.balance}'),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to transfer screen
                  },
                  child: Text('Transfer Money'),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
