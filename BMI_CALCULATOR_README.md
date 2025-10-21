# BMI Calculator Flutter App

A comprehensive Body Mass Index (BMI) Calculator app built with Flutter that helps users calculate their BMI and assess their health status.

## Features

### ✅ Core Requirements Implemented

1. **Gender Selection**
   - Dropdown-style selection between Male and Female
   - Visual indicators with icons and colors
   - Dynamic avatar display based on selection

2. **Input Fields**
   - Height input field (in centimeters)
   - Weight input field (in kilograms)
   - Input validation with proper error handling
   - Numeric keyboard for better user experience

3. **BMI Calculation**
   - Accurate BMI calculation using the standard formula: BMI = weight(kg) / height(m)²
   - Real-time calculation when user clicks "Calculate BMI"

4. **Health Status Assessment**
   - Comprehensive health status categories:
     - Severe Thinness (BMI < 16)
     - Moderate Thinness (BMI 16-17)
     - Mild Thinness (BMI 17-18.5)
     - Normal (BMI 18.5-25)
     - Overweight (BMI 25-30)
     - Obese Class I (BMI 30-35)
     - Obese Class II (BMI 35-40)
     - Obese Class III (BMI ≥ 40)

5. **Dynamic Content**
   - Gender-specific avatar display
   - Color-coded health status indicators
   - Detailed health descriptions and recommendations

6. **Reset Functionality**
   - Complete reset of all input fields
   - Clear result display
   - Reset to default gender selection

### 🎨 UI/UX Features

- **Modern Design**: Clean, intuitive interface with Material Design 3
- **Responsive Layout**: Works on different screen sizes
- **Visual Feedback**: Color-coded results and status indicators
- **Card-based Layout**: Organized sections for better readability
- **Gradient Backgrounds**: Attractive visual elements
- **Smooth Animations**: Enhanced user experience

### 🔧 Technical Features

- **Input Validation**: Comprehensive validation for height and weight
- **Error Handling**: User-friendly error messages
- **State Management**: Efficient state management using setState
- **Type Safety**: Strongly typed models and enums
- **Clean Architecture**: Well-organized code structure

## File Structure

```
lib/
├── main.dart                           # App entry point
├── models/
│   └── bmi_model.dart                  # BMI calculation logic and health status
└── screens/
    └── bmi_calculator_screen.dart      # Main BMI calculator UI
```

## Usage

1. **Select Gender**: Choose between Male or Female using the visual selection buttons
2. **Enter Details**: Input your height in centimeters and weight in kilograms
3. **Calculate**: Click the "Calculate BMI" button to get your BMI result
4. **View Results**: See your BMI value, health status, and personalized recommendations
5. **Reset**: Use the "Reset" button to clear all fields and start over

## Input Validation

- Height must be between 50-300 cm
- Weight must be between 10-500 kg
- Only numeric values are accepted
- Empty fields are not allowed

## Health Status Colors

- 🔴 Red: Severe conditions (Severe Thinness, Obese Class III)
- 🟠 Orange: Moderate conditions (Moderate Thinness, Obese Class II)
- 🟡 Amber: Mild conditions (Mild Thinness, Obese Class I)
- 🟢 Green: Normal weight
- 🔵 Blue: Overweight

## Getting Started

1. Ensure Flutter is installed on your system
2. Navigate to the project directory
3. Run `flutter pub get` to install dependencies
4. Run `flutter run` to start the app

## Dependencies

- Flutter SDK
- Material Design components
- No additional external dependencies required

## Learning Objectives Achieved

✅ **User Input Handling**: Accepts and validates height and weight inputs
✅ **UI/UX Design**: Intuitive, user-friendly interface with dynamic content
✅ **BMI Calculation Logic**: Implements accurate BMI formula and health categorization
✅ **State Management**: Uses Flutter's setState for efficient state management
✅ **Reset Functionality**: Complete reset capability for all fields

This BMI Calculator app provides a complete solution for calculating BMI with a modern, user-friendly interface and comprehensive health status assessment.