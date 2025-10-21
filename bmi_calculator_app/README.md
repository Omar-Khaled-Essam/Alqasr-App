# BMI Calculator Flutter App

A comprehensive Body Mass Index (BMI) Calculator app built with Flutter that helps users calculate their BMI and assess their health status.

## 🚀 Features

### Core Requirements ✅

1. **Gender Selection**
   - Visual dropdown-style selection between Male and Female
   - Interactive buttons with icons and color coding
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
     - 🔴 Severe Thinness (BMI < 16)
     - 🟠 Moderate Thinness (BMI 16-17)
     - 🟡 Mild Thinness (BMI 17-18.5)
     - 🟢 Normal (BMI 18.5-25)
     - 🔵 Overweight (BMI 25-30)
     - 🟡 Obese Class I (BMI 30-35)
     - 🟠 Obese Class II (BMI 35-40)
     - 🔴 Obese Class III (BMI ≥ 40)

5. **Dynamic Content**
   - Gender-specific avatar display
   - Color-coded health status indicators
   - Detailed health descriptions and recommendations

6. **Reset Functionality**
   - Complete reset of all input fields
   - Clear result display
   - Reset to default gender selection

### UI/UX Features 🎨

- **Modern Design**: Clean, intuitive interface with Material Design 3
- **Responsive Layout**: Works on different screen sizes
- **Visual Feedback**: Color-coded results and status indicators
- **Card-based Layout**: Organized sections for better readability
- **Gradient Backgrounds**: Attractive visual elements
- **Smooth Animations**: Enhanced user experience

### Technical Features 🔧

- **Input Validation**: Comprehensive validation for height and weight
- **Error Handling**: User-friendly error messages with SnackBar
- **State Management**: Efficient state management using setState
- **Type Safety**: Strongly typed models and enums
- **Clean Architecture**: Well-organized code structure

## 📁 Project Structure

```
bmi_calculator_app/
├── lib/
│   ├── main.dart                           # App entry point
│   ├── models/
│   │   └── bmi_model.dart                  # BMI calculation logic and health status
│   └── screens/
│       └── bmi_calculator_screen.dart      # Main BMI calculator UI
├── assets/
│   └── images/                             # Image assets (if needed)
├── pubspec.yaml                            # Dependencies and project config
├── analysis_options.yaml                   # Linting rules
└── README.md                               # This file
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.9.2 or higher)
- Dart SDK
- Android Studio / VS Code with Flutter extensions

### Installation

1. **Clone or navigate to the project directory:**
   ```bash
   cd bmi_calculator_app
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the app:**
   ```bash
   flutter run
   ```

### For Web
```bash
flutter run -d chrome
```

### For Android
```bash
flutter run -d android
```

### For iOS
```bash
flutter run -d ios
```

## 📱 Usage

1. **Select Gender**: Choose between Male or Female using the visual selection buttons
2. **Enter Details**: Input your height in centimeters and weight in kilograms
3. **Calculate**: Click the "Calculate BMI" button to get your BMI result
4. **View Results**: See your BMI value, health status, and personalized recommendations
5. **Reset**: Use the "Reset" button to clear all fields and start over

## ✅ Input Validation

- Height must be between 50-300 cm
- Weight must be between 10-500 kg
- Only numeric values are accepted
- Empty fields are not allowed
- User-friendly error messages for invalid inputs

## 🎨 Health Status Colors

- 🔴 **Red**: Severe conditions (Severe Thinness, Obese Class III)
- 🟠 **Orange**: Moderate conditions (Moderate Thinness, Obese Class II)
- 🟡 **Amber**: Mild conditions (Mild Thinness, Obese Class I)
- 🟢 **Green**: Normal weight
- 🔵 **Blue**: Overweight

## 🎯 Learning Objectives Achieved

✅ **User Input Handling**: Accepts and validates height and weight inputs  
✅ **UI/UX Design**: Intuitive, user-friendly interface with dynamic content  
✅ **BMI Calculation Logic**: Implements accurate BMI formula and health categorization  
✅ **State Management**: Uses Flutter's setState for efficient state management  
✅ **Reset Functionality**: Complete reset capability for all fields  

## 🛠️ Dependencies

- **Flutter SDK**: Core Flutter framework
- **Material Design**: UI components and theming
- **No external dependencies**: Pure Flutter implementation

## 📊 BMI Categories

| BMI Range | Category | Health Risk |
|-----------|----------|-------------|
| < 16 | Severe Thinness | High |
| 16-17 | Moderate Thinness | Moderate |
| 17-18.5 | Mild Thinness | Low |
| 18.5-25 | Normal | Minimal |
| 25-30 | Overweight | Low |
| 30-35 | Obese Class I | Moderate |
| 35-40 | Obese Class II | High |
| ≥ 40 | Obese Class III | Very High |

## 🔧 Customization

The app is designed to be easily customizable:

- **Colors**: Modify the color scheme in the BMI model and UI components
- **BMI Ranges**: Adjust health status thresholds in `bmi_model.dart`
- **UI Layout**: Customize the card layouts and spacing in `bmi_calculator_screen.dart`
- **Validation Rules**: Modify input validation rules as needed

## 📝 Notes

- This app is for educational purposes
- BMI is a general indicator and should not replace professional medical advice
- Always consult healthcare professionals for health-related decisions

## 🤝 Contributing

Feel free to contribute to this project by:
- Reporting bugs
- Suggesting new features
- Improving the UI/UX
- Adding more health insights

## 📄 License

This project is open source and available under the MIT License.

---

**Happy Calculating! 🧮💪**