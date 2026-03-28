# 🌦️ SkyCast - Premium Weather Experience

SkyCast is a high-fidelity weather application designed to showcase **Senior-level engineering patterns** and **visual excellence**. Beyond being a weather tool, it is a demonstration of modern software architecture, focusing on scalability, robustness, and performance.

---

## 🚀 Technical Excellence

SkyCast is built with a commitment to industry-standard engineering practices:

### 🏛️ Advanced Architecture (SOLID & Clean)
The project strictly adheres to **Clean Architecture**, with absolute decoupling between layers:
- **Domain (Inner Layer)**: Pure Dart Entities and UseCases. Zero dependencies on external frameworks.
- **Data (Infrastructure)**: Implementation of repositories, JSON models, and data sources.
- **Presentation (UI Layer)**: Controlled by the **BLoC pattern**, ensuring a reactive and predictable user experience.

### 🧩 SOLID Principles in Action
- **Dependency Inversion**: All external dependencies (Networking, Data Sources) are injected via a singleton **`ServiceLocator`** (using `GetIt`).
- **Single Responsibility**: Implemented **`.toEntity()` Mappers** in models to ensure that JSON/API logic never leaks into the business logic.
- **Interface Segregation**: Clean repository contracts that define only what the domain needs.

### 🛡️ Robust Functional Error Handling
Instead of error-prone `null` returns or unhandled exceptions, SkyCast implements a custom **`Result<T, Failure>`** pattern:
- **Crash-Resistance**: All API failures, network timeouts, and parsing errors are caught at the Data layer and propagated as structured `Failure` objects.
- **Type-Safe Outcomes**: The UI explicitly handles `Success` and `Failure` states, ensuring a 100% crash-free experience for the user.

---

## ⚡ Performance & Scalability

### 🎨 Rendering Optimizations
- **RepaintBoundary**: Strategic use of paint isolation boundaries around heavy components (Shimmer loaders, animated weather cards) to ensure smooth **60FPS** performance and reduce GPU overhead.
- **Lazy Loading**: Efficient handling of hourly and daily forecast data to minimize memory footprint.

### 📡 Professional Networking
- **Dio Singleton**: A centralized, pre-configured `Dio` instance handles all requests, featuring:
  - Global timeouts and retry logic.
  - **LogInterceptors** for professional debugging of network traffic.
  - Layer-level isolation between the client and the data sources.

---

## 🔐 Security & Best Practices

- **Secure Configuration**: Critical API keys are managed via **Environment Variables** (`.env`).
- **Git Protection**: Use of `.gitignore` and `.env.example` templates to ensure sensitive data is never committed to version control.
- **Modern Theming**: Centralized **`ThemeData`** engine using **Google Fonts (Inter)** for a cohesive, premium visual identity.

---

## 🛠️ Technology Stack
- **Framework**: [Flutter](https://flutter.dev/)
- **State Management**: [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- **DI / Service Locator**: [Get It](https://pub.dev/packages/get_it)
- **Networking**: [Dio](https://pub.dev/packages/dio) & [CachedNetworkImage](https://pub.dev/packages/cached_network_image)
- **Config**: [flutter_dotenv](https://pub.dev/packages/flutter_dotenv)
- **Visuals**: [Shimmer](https://pub.dev/packages/shimmer) & [Animate Do](https://pub.dev/packages/animate_do)

---

## 📦 How to Run

1.  **Clone the Repository**:
    ```bash
    git clone https://github.com/Ahmed2120/SkyCast.git
    ```
2.  **Environment Setup**:
    - Create a `.env` file in the root directory.
    - Add your **Visual Crossing API Key**: `API_KEY=YOUR_KEY_HERE`.
3.  **Install Dependencies**:
    ```bash
    flutter pub get
    ```
4.  **Run the App**:
    ```bash
    flutter run
    ```
