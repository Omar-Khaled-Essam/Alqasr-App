# AlQasr Hotels - Flutter App

A modern hotel booking application built with Flutter, featuring a beautiful Arabic RTL interface and comprehensive booking flow.

## 🏨 Features

### Core Functionality
- **Splash Screen** - Animated welcome screen with app branding
- **Home Screen** - Browse hotels, brands, and latest news
- **Hotel Booking Flow** - Complete booking process with date selection, user info, and payment
- **User Authentication** - Login, registration, and profile management
- **Reservations Management** - View and manage hotel reservations
- **Profile Management** - User profile, settings, and preferences

### UI/UX Features
- **Arabic RTL Support** - Full right-to-left layout support
- **Modern Design** - Clean, professional interface with golden accent colors
- **Responsive Layout** - Optimized for various screen sizes
- **Custom Widgets** - Reusable, well-organized widget components
- **Smooth Animations** - Engaging user experience with smooth transitions

### Technical Features
- **Modular Architecture** - Well-organized code structure
- **State Management** - Efficient state handling
- **Data Models** - Comprehensive data models for hotels, reservations, and users
- **Services Layer** - Mock services for hotels and authentication
- **Theme System** - Consistent design system with customizable themes

## 🏗️ Project Structure

```
lib/
├── main.dart                 # App entry point
├── models/                   # Data models
│   ├── hotel.dart           # Hotel and room models
│   ├── reservation.dart     # Reservation models
│   └── user.dart           # User and preferences models
├── screens/                 # App screens
│   ├── splash_screen.dart  # Welcome screen
│   ├── home_screen.dart    # Main dashboard
│   ├── login_screen.dart   # User login
│   ├── register_screen.dart # User registration
│   ├── reservations_screen.dart # Reservation management
│   ├── profile_screen.dart # User profile
│   └── booking_flow_screen.dart # Complete booking flow
├── services/               # Business logic services
│   ├── auth_service.dart   # Authentication service
│   └── hotel_service.dart  # Hotel data service
├── utils/                  # Utilities and constants
│   ├── constants.dart      # App constants and strings
│   └── theme.dart         # App theme configuration
└── widgets/               # Reusable UI components
    ├── custom_app_bar.dart # Custom app bar
    ├── custom_button.dart  # Custom button components
    ├── custom_card.dart    # Card components
    ├── hotel_widgets.dart  # Hotel-specific widgets
    ├── section_header.dart # Section headers
    ├── bottom_navigation.dart # Bottom navigation
    └── index.dart         # Widget exports
```

## 🎨 Design System

### Color Palette
- **Primary Gold**: `#D4AF37` - Main brand color
- **Primary Gold Dark**: `#B8941F` - Darker shade for accents
- **Background**: `#FFFFFF` - Clean white background
- **Text Primary**: `#000000` - Main text color
- **Text Secondary**: `#666666` - Secondary text color

### Typography
- **Font Family**: Cairo (Google Fonts) - Optimized for Arabic text
- **Font Sizes**: Consistent sizing system from 10px to 32px
- **Font Weights**: Multiple weights for hierarchy

### Components
- **Cards**: Rounded corners with subtle shadows
- **Buttons**: Primary, secondary, and text button variants
- **Input Fields**: Consistent styling with focus states
- **Navigation**: Bottom navigation with clear icons

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.9.2 or higher)
- Dart SDK
- Android Studio / VS Code
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/alqasr-hotels.git
   cd alqasr-hotels
   ```

2. **Switch to dev branch**
   ```bash
   git checkout dev
   ```

3. **Install dependencies**
   ```bash
   flutter pub get
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

### Dependencies

The app uses the following key dependencies:

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  google_fonts: ^6.2.1
  cached_network_image: ^3.3.1
  intl: ^0.19.0
  shared_preferences: ^2.2.2
```

## 📱 App Flow

### 1. Splash Screen
- Animated logo and app name
- Automatic navigation to home screen

### 2. Home Screen
- Hero section with featured content
- Brand exploration section
- Popular hotels showcase
- Promotional banners
- Latest news and articles
- Bottom navigation for easy access

### 3. Booking Flow
- **Step 1**: Date and guest selection
- **Step 2**: User information collection
- **Step 3**: Payment information
- **Step 4**: Booking confirmation

### 4. User Management
- Login/Registration screens
- Profile management
- Reservation history
- Settings and preferences

## 🛠️ Development

### Code Organization
- **Models**: Define data structures and business logic
- **Services**: Handle API calls and business logic
- **Screens**: UI screens with state management
- **Widgets**: Reusable UI components
- **Utils**: Constants, themes, and helper functions

### Widget Organization
Widgets are organized into logical groups:
- **HotelWidgets**: Hotel-specific components (search cards, room selection, booking summary)
- **Custom Components**: Generic reusable components (buttons, cards, app bars)
- **Navigation**: Bottom navigation and app bars

### State Management
Currently using StatefulWidget for local state management. Can be easily extended with:
- Provider
- Bloc
- Riverpod
- GetX

## 🎯 Future Enhancements

### Planned Features
- [ ] Real API integration
- [ ] Push notifications
- [ ] Offline support
- [ ] Advanced search and filters
- [ ] Hotel reviews and ratings
- [ ] Loyalty program
- [ ] Multi-language support
- [ ] Dark mode
- [ ] Advanced payment methods
- [ ] Hotel comparison
- [ ] Wishlist functionality

### Technical Improvements
- [ ] Unit and widget tests
- [ ] Integration tests
- [ ] CI/CD pipeline
- [ ] Performance optimization
- [ ] Code coverage
- [ ] Documentation
- [ ] Error handling
- [ ] Logging system

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Development Guidelines
- Follow Flutter/Dart style guidelines
- Write meaningful commit messages
- Add comments for complex logic
- Test your changes thoroughly
- Update documentation as needed

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📞 Support

For support, email support@alqasr.com or create an issue in this repository.

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Google Fonts for the Cairo font family
- The open-source community for various packages used

---

**AlQasr Hotels** - Your gateway to luxury hospitality in Saudi Arabia 🇸🇦