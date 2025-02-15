import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mizara/features/auth/presentation/pages/signup_page.dart';

void main() {
  testWidgets('should validate email correctly', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: SignupPage(),
          ),
        ),
      ),
    );

    final emailField = find.byType(TextFormField).at(3);
    await tester.enterText(emailField, 'invalid-email');
    await tester.pump();

    final errorFinder = find.text('Veuillez entrer un email valide');
    expect(errorFinder, findsOneWidget);
  });

  testWidgets('should show required fields error messages', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: SignupPage(),
          ),
        ),
      ),
    );

    await tester.tap(find.text('S\'inscrire'));
    await tester.pump();

    expect(find.text('Veuillez entrer votre nom complet'), findsOneWidget);
    expect(find.text('Veuillez entrer votre prénom'), findsOneWidget);
    expect(
        find.text('Veuillez entrer votre numéro de téléphone'), findsOneWidget);
    expect(find.text('Veuillez entrer votre email'), findsOneWidget);
    expect(
        find.text('Veuillez entrer votre lieu d\'habitation'), findsOneWidget);
    expect(
        find.text('Veuillez entrer votre nom d\'utilisateur'), findsOneWidget);
    expect(find.text('Veuillez entrer votre mot de passe'), findsOneWidget);
  });

  testWidgets('should accept valid form data', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: SignupPage(),
          ),
        ),
      ),
    );

    await tester.enterText(find.byType(TextFormField).at(0), 'John Doe');
    await tester.enterText(find.byType(TextFormField).at(1), 'John');
    await tester.enterText(find.byType(TextFormField).at(2), '0341234567');
    await tester.enterText(
        find.byType(TextFormField).at(3), 'test@example.com');
    await tester.enterText(find.byType(TextFormField).at(4), 'Antananarivo');
    await tester.enterText(find.byType(TextFormField).at(5), 'johndoe');
    await tester.enterText(find.byType(TextFormField).at(6), 'password123');
    await tester.enterText(find.byType(TextFormField).at(7), 'password123');
    await tester.tap(find.byType(Checkbox));
    await tester.pump();
    await tester.tap(find.text('S\'inscrire'));
    await tester.pump();

    expect(find.text('Veuillez entrer votre nom complet'), findsNothing);
    expect(find.text('Veuillez entrer un email valide'), findsNothing);
  });
}
