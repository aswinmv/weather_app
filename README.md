Weather app made with Flutter, using the OpenWeatherMap API for data and the Provider package for state management.


# Flutter Weather App


<p style="color: #3498db; font-size: 1.2em; font-weight: bold;">
  🌈 A sophisticated Flutter weather application that seamlessly retrieves real-time weather 
  data from the OpenWeatherMap API, enhanced with a robust state management system courtesy of the Provider package.
</p>


Feel free to adjust the color, font size, and other styles to match your preferences.

<p align="center">
  <img src="https://openweathermap.org/themes/openweathermap/assets/img/logo_white_cropped.png" alt="OpenWeatherMap Logo" width="200">
</p>



## Features

- Display current weather conditions
- 5-day weather forecast
- User-friendly interface
- State management with Provider
- Sleek minimal UI

## Screenshots

Include screenshots or GIFs of your app in action.

## Getting Started

### Prerequisites

Before running the app, make sure you have Flutter installed on your machine. If not,
follow the [official Flutter installation guide](https://flutter.dev/docs/get-started/install).

### Installation

1. Clone the repository:

```bash
git clone https://github.com/aswinmv/weather_app
.git
```

2. Change into the project directory:

```bash
cd weather_app
```

3. Get dependencies:

```bash
flutter pub get http
flutter pub get provider
```

4. Run the app:

```bash
flutter run
```

## Configuration

To use this app, you need to obtain an API key from OpenWeatherMap. Once you have the key, 
update the `lib/utils/api_key.dart` file with your API key:

```dart
// lib/utils/api_key.dart

class ApiKey {
  static const String openWeatherMap = 'YOUR_API_KEY';
}
```

## Dependencies

- [flutter](https://flutter.dev/)
- [provider](https://pub.dev/packages/provider)
- [http](https://pub.dev/packages/http) (for making API requests)
- [here](https://openweathermap.org/api) (openweathermap api)

## API

This app uses the OpenWeatherMap API for weather data. You can sign up for a free API key [here](https://openweathermap.org/api).

## Contributing

If you find any issues or have suggestions for improvements, feel free to open an issue or create a pull request.

