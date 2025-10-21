import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bmi_calculator_app/main.dart';

void main() {
  testWidgets('BMI Calculator app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const BMICalculatorApp());

    // Verify that the app title is displayed
    expect(find.text('BMI Calculator'), findsOneWidget);
    
    // Verify that the main heading is displayed
    expect(find.text('Body Mass Index Calculator'), findsOneWidget);
    
    // Verify that gender selection buttons are present
    expect(find.text('Male'), findsOneWidget);
    expect(find.text('Female'), findsOneWidget);
    
    // Verify that input fields are present
    expect(find.text('Height (cm)'), findsOneWidget);
    expect(find.text('Weight (kg)'), findsOneWidget);
    
    // Verify that action buttons are present
    expect(find.text('Calculate BMI'), findsOneWidget);
    expect(find.text('Reset'), findsOneWidget);
  });
}