import 'package:flutter/material.dart';

enum Gender { male, female }

enum HealthStatus {
  severeThinness,
  moderateThinness,
  mildThinness,
  normal,
  overweight,
  obeseClassI,
  obeseClassII,
  obeseClassIII,
}

class BMIModel {
  final double height; // in cm
  final double weight; // in kg
  final Gender gender;

  BMIModel({
    required this.height,
    required this.weight,
    required this.gender,
  });

  double get bmi {
    if (height <= 0) return 0;
    double heightInMeters = height / 100;
    return weight / (heightInMeters * heightInMeters);
  }

  HealthStatus get healthStatus {
    double bmiValue = bmi;
    if (bmiValue < 16) return HealthStatus.severeThinness;
    if (bmiValue < 17) return HealthStatus.moderateThinness;
    if (bmiValue < 18.5) return HealthStatus.mildThinness;
    if (bmiValue < 25) return HealthStatus.normal;
    if (bmiValue < 30) return HealthStatus.overweight;
    if (bmiValue < 35) return HealthStatus.obeseClassI;
    if (bmiValue < 40) return HealthStatus.obeseClassII;
    return HealthStatus.obeseClassIII;
  }

  String get healthStatusText {
    switch (healthStatus) {
      case HealthStatus.severeThinness:
        return 'Severe Thinness';
      case HealthStatus.moderateThinness:
        return 'Moderate Thinness';
      case HealthStatus.mildThinness:
        return 'Mild Thinness';
      case HealthStatus.normal:
        return 'Normal';
      case HealthStatus.overweight:
        return 'Overweight';
      case HealthStatus.obeseClassI:
        return 'Obese Class I';
      case HealthStatus.obeseClassII:
        return 'Obese Class II';
      case HealthStatus.obeseClassIII:
        return 'Obese Class III';
    }
  }

  String get healthStatusDescription {
    switch (healthStatus) {
      case HealthStatus.severeThinness:
        return 'You are severely underweight. Please consult a healthcare professional.';
      case HealthStatus.moderateThinness:
        return 'You are moderately underweight. Consider consulting a healthcare professional.';
      case HealthStatus.mildThinness:
        return 'You are mildly underweight. Consider gaining some weight through healthy means.';
      case HealthStatus.normal:
        return 'Congratulations! You have a healthy weight. Keep up the good work!';
      case HealthStatus.overweight:
        return 'You are overweight. Consider a balanced diet and regular exercise.';
      case HealthStatus.obeseClassI:
        return 'You are in Obese Class I. It\'s recommended to consult a healthcare professional.';
      case HealthStatus.obeseClassII:
        return 'You are in Obese Class II. Please consult a healthcare professional.';
      case HealthStatus.obeseClassIII:
        return 'You are in Obese Class III. Please consult a healthcare professional immediately.';
    }
  }

  Color get healthStatusColor {
    switch (healthStatus) {
      case HealthStatus.severeThinness:
      case HealthStatus.obeseClassIII:
        return Colors.red;
      case HealthStatus.moderateThinness:
      case HealthStatus.obeseClassII:
        return Colors.orange;
      case HealthStatus.mildThinness:
      case HealthStatus.obeseClassI:
        return Colors.amber;
      case HealthStatus.normal:
        return Colors.green;
      case HealthStatus.overweight:
        return Colors.blue;
    }
  }
}