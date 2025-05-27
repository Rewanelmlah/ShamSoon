# 📱 ShamSoon Mobile Application

ShamSoon's mobile app complements the backend system by offering a user-friendly interface that empowers users to monitor, manage, and optimize solar panel performance. Built with **Flutter**, the app leverages AI predictions, real-time data, and community features to maximize solar energy efficiency across Egypt.


## 🧠 Architecture

The app is structured using the **MVVM (Model-View-ViewModel)** architecture, which promotes:

- A clean separation of concerns
- Better maintainability
- Enhanced testability
- Easier scalability

## 🌐 Network Communication

We use the **Dio** package for managing API requests. Dio provides:

- Interceptors for authorization tokens
- Global configuration
- FormData support
- Request cancellation
- Robust error handling

## 🔥 Firebase Integration

We use **Firebase Cloud Messaging (FCM)** for real-time push notifications, such as:

- Maintenance reminders
- System alerts
- General updates

## 🔌 Backend Integration

The app communicates with a Laravel-based backend to support key features like:

- **Authentication**: Secure login and registration
- **Notifications**: Real-time alerts via FCM
- **Community Module**: User engagement and discussions
- **Settings**: Personalized configurations
- **Solar Panel Data**: Live performance metrics from backend APIs

## 🧠 AI Model Integration

The mobile app integrates an AI model to classify solar panel conditions:

- ✅ **Clean** – Panel is functioning optimally
- 🌫 **Dusty** – Likely reduced performance
- ⚠️ **Damaged** – May need repair or replacement
- 🐦 **Bird Droppings** – Needs cleaning

> The system is designed to support additional classes as the AI model evolves.

## 🧪 API Testing

We used **Postman** to test and validate all backend and AI model APIs. This ensured:

- Proper endpoint structure
- Correct request/response formats
- Smoother app integration

## 🛡 Server Error Handling

Robust error-handling mechanisms include:

- Friendly user error messages
- Handling HTTP codes like 400, 401, 500, etc.
- Retry strategies for recoverable errors
- Internal error logging for future improvements

## 📆 Scheduled Maintenance Notifications

The app automatically notifies users about:

- Recommended cleanups
- AI-detected maintenance needs
- Periodic system check-ups

This helps reduce downtime and ensures system reliability.


## 🛠 Installation & Running

```bash
# 1. Clone the repository
git clone https://github.com/Rewanelmlah/ShamSoon.git
cd ShamSoon/mobile

# 2. Install Flutter packages
flutter pub get

# 3. Add Firebase config files
# - google-services.json for Android
# - GoogleService-Info.plist for iOS

# 4. Run the app
flutter run
