<<<<<<< HEAD
// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_gestion_bancaire/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
=======
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_gestion_bancaire/main.dart';
import 'package:flutter_application_gestion_bancaire/screens/login_screen.dart';
import 'package:flutter_application_gestion_bancaire/screens/dashboard_screen.dart';

void main() {
  group('Tests de l\'application de gestion bancaire', () {
    
    // Test de l'écran de connexion
    testWidgets('Test du widget de connexion', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: LoginScreen()));

      // Rechercher le champ de texte pour l'email
      Finder emailField = find.byKey(Key('emailField'));
      await tester.enterText(emailField, 'test@banque.com');

      // Rechercher le champ de texte pour le mot de passe
      Finder passwordField = find.byKey(Key('passwordField'));
      await tester.enterText(passwordField, 'password123');

      // Rechercher le bouton de connexion
      Finder loginButton = find.byKey(Key('loginButton'));
      await tester.tap(loginButton);

      // Re-bâtir l'interface utilisateur après l'interaction
      await tester.pumpAndSettle();

      // Vérifier qu'après une connexion réussie, le tableau de bord est affiché
      expect(find.byType(DashboardScreen), findsOneWidget);
    });

    // Test du tableau de bord pour vérifier les informations du compte
    testWidgets('Test de l\'affichage des informations du compte', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: DashboardScreen()));

      // Vérifier si le solde est affiché correctement
      expect(find.text('Solde: 1000 EUR'), findsOneWidget);
      
      // Vérifier que le bouton de transfert est présent
      expect(find.byKey(Key('transferButton')), findsOneWidget);
    });

    // Test de la fonctionnalité de transfert d'argent
    testWidgets('Test du widget de transfert d\'argent', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: DashboardScreen()));

      // Rechercher et appuyer sur le bouton de transfert
      Finder transferButton = find.byKey(Key('transferButton'));
      await tester.tap(transferButton);

      // Re-bâtir l'interface utilisateur après l'interaction
      await tester.pumpAndSettle();

      // Remplir le formulaire de transfert
      Finder amountField = find.byKey(Key('amountField'));
      await tester.enterText(amountField, '100');

      Finder recipientField = find.byKey(Key('recipientField'));
      await tester.enterText(recipientField, '123456789');

      // Rechercher et appuyer sur le bouton de confirmation de transfert
      Finder confirmButton = find.byKey(Key('confirmTransferButton'));
      await tester.tap(confirmButton);

      // Re-bâtir l'interface utilisateur après l'interaction
      await tester.pumpAndSettle();

      // Vérifier que le message de confirmation s'affiche
      expect(find.text('Transfert effectué avec succès!'), findsOneWidget);
    });

    // Test de la réception des notifications en temps réel
    testWidgets('Test de la réception des notifications', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: DashboardScreen()));

      // Vérifier que la notification est affichée dans le tableau de bord
      expect(find.text('Vous avez reçu un virement de 200 EUR.'), findsOneWidget);
    });
>>>>>>> c73ab1f (commit)
  });
}
