# 🌦️ SkyCast - Premium Weather Experience

SkyCast is a modern Flutter weather application designed with a focus on **visual excellence** and **software engineering best practices**. It replaces generic weather UIs with a high-fidelity experience featuring glassmorphism, fluid animations, and deep weather insights.

## ✨ Features
- **Clean Architecture**: Strictly organized into Data, Domain, and Presentation layers for maximum scalability and testability.
- **Premium UI/UX**: High-end glassmorphic design inspired by top Figma community concepts.
- **Real-Time Weather Intelligence**: Full integration with the Visual Crossing API, providing detailed metrics like UV Index (with risk levels), Visibility, and Feels Like temperatures.
- **Fluent Animations**: Powered by `animate_do` for smooth transitions and a responsive feel.
- **Hourly & Daily Forecasts**: Dynamic weather data with high-fidelity network icons.
- **Modern Interactions**:
  - **Pull-to-Refresh**: Modern, colorful refresh indicator for instant updates.
  - **Shimmer Skeleton Loading**: Premium Shimmer loading experience instead of generic progress bars.
  - **Search Intelligence**: Robust city search with state-aware UI updates.

## 🛠️ Technology Stack
- **Framework**: [Flutter](https://flutter.dev/)
- **State Management**: [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- **API**: [Visual Crossing Timeline API](https://www.visualcrossing.com/weather-api)
- **Networking**: [Dio](https://pub.dev/packages/dio) & [CachedNetworkImage](https://pub.dev/packages/cached_network_image)
- **Visuals**: [Shimmer](https://pub.dev/packages/shimmer) & [Animate Do](https://pub.dev/packages/animate_do)
- **DI**: [Get It](https://pub.dev/packages/get_it)

## 🏗️ Architecture
The project follows **Clean Architecture** patterns:
- **Domain**: Entities and UseCases (Pure Dart logic).
- **Data**: Models (JSON mapping) and Repositories (API Implementation).
- **Presentation**: BLoC pattern for state management and modular Widgets.
