class User {
  final String uid; // Identifiant unique de l'utilisateur
  final String name; // Nom de l'utilisateur
  final String email; // Email de l'utilisateur
  final String accountType; // Type de compte (e.g., "client", "admin")
  double balance; // Solde du compte
  final String phoneNumber; // Numéro de téléphone de l'utilisateur
  final String address; // Adresse de l'utilisateur

  User({
    required this.uid,
    required this.name,
    required this.email,
    required this.accountType,
    required this.balance,
    required this.phoneNumber,
    required this.address,
  });

  // Méthode pour convertir l'objet User en un Map pour Firestore
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'accountType': accountType,
      'balance': balance,
      'phoneNumber': phoneNumber,
      'address': address,
    };
  }

  // Méthode pour créer un objet User à partir d'un Map de Firestore
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      accountType: map['accountType'] ?? 'client',
      balance: map['balance']?.toDouble() ?? 0.0,
      phoneNumber: map['phoneNumber'] ?? '',
      address: map['address'] ?? '',
    );
  }
}
