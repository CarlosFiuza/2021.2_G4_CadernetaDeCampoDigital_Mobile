// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:caderneta_campo_digital/main.dart';

void main() {
  testWidgets(
    'Testando campos inválidos no Login',
    (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      await tester.tap(find.widgetWithText(MaterialButton, "Entrar"));
      await tester.pump(Duration(milliseconds: 500));

      expect(find.text("Insira o seu CPF"), findsOneWidget);
      expect(find.text("Insira a sua senha"), findsOneWidget);
    },
  );

  testWidgets(
    'Renderiza página',
    (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      expect(find.text('LOGIN'), findsOneWidget);
    },
  );

  testWidgets(
    'Testando CPF inválido no Login',
    (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      await tester.enterText(find.byKey(Key("cpfField")), "067056");
      await tester.enterText(find.byKey(Key("passwordField")), "Teste123");
      await tester.pump(Duration(milliseconds: 500));
      await tester.tap(find.widgetWithText(MaterialButton, "Entrar"));
      await tester.pump(Duration(milliseconds: 500));

      expect(find.text("CPF inválido"), findsOneWidget);
    },
  );
}
