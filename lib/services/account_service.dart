// lib/services/account_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class AccountService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>?> getAccountDetails() async {
    try {
      var docSnapshot = await _firestore.collection('accounts').doc('user_id').get();
      return docSnapshot.data();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> transferMoney(String fromAccountId, String toAccountId, double amount) async {
    // Implement transfer logic here, including checking balance and updating accounts
  }
}
