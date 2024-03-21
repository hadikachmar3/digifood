# Digifood Flutter Frontend Application


[![Youtube](https://img.shields.io/static/v1?label=Coding%20with%20Hadi&message=Subscribe&logo=YouTube&color=FF0000&style=for-the-badge)][youtube] 
[![Udemy](https://img.shields.io/badge/Udemy-A435F0?style=for-the-badge&logo=Udemy&logoColor=white)][udemy]
[![Linkedin: HadiKachmar](https://img.shields.io/badge/-CONNECT-blue?style=for-the-badge&logo=Linkedin&link=https://www.linkedin.com/in/hadi-kachmar-27a56a177/)][linkedin]
[![Facebook: HadiKachmar](https://img.shields.io/badge/Facebook-1877F2?style=for-the-badge&logo=facebook&logoColor=white)][facebook]
[![Discord](https://img.shields.io/badge/Discord-blue?style=for-the-badge)][discord]
[![GitHub followers](https://img.shields.io/github/followers/hadikachmar3?logo=GitHub&style=for-the-badge)][github]

## Overview
This project is a small Android Flutter app. It includes a list of categorized products with their names, prices, and descriptions. It also features a cart system where products can be added and removed, with a displayed total.

## Features
- Categorized product listing
- Product details including name, price, and description
- Cart system for managing selected products
- Dynamic total calculation for items in the cart
- Utilizes a [remote API](https://fakeapi.platzi.com) source for product and category data

## Installation

1. Clone the repository:
\```bash
git clone `https://github.com/hadikachmar3/digifood`
\```

2. Navigate to the project directory:
\```bash
cd digifood
\```

3. Install the dependencies:
\```bash
flutter pub get
\```

4. Run the application on your device or emulator:
\```bash
flutter run
\```

5. To install the app on an Android device, use the provided [APKs](https://github.com/hadikachmar3/digifood/tree/master/APK) suitable for the device's architecture:
- `APK/app-arm64-v8a-release.apk` for 64-bit ARM devices. 
- `APK/app-armeabi-v7a-release.apk` for 32-bit ARM devices.

## Project Structure

- `lib/constants/`: Constants used across the application.
- `lib/controller/`: Business logic and controllers.
- `lib/models/`: Data models for the application entities.
- `lib/screens/`: Screen widgets for various views.
- `lib/services/`: Services for API network communication.
- `lib/state/`: State management providers and notifiers.
- `lib/utils/`: Utility functions and helpers.
- `lib/widgets/`: Custom reusable widgets.

![Project Structure](https://github.com/hadikachmar3/digifood/assets/38382273/ea053d1a-8610-4cfb-9e19-05db2e059684)

## State Management

This project uses [flutter_riverpod](https://pub.dev/packages/flutter_riverpod) for state management, allowing for a clean separation of app state from the UI and business logic.

## API and Network Services

The `ApiService` class in `lib/services/` handles all HTTP requests, including fetching products and categories from a remote API. It uses the `http` package for network communication and has error handling for different HTTP statuses and network errors.

## Testing

To run the tests, use the following command:
\```bash
flutter test
\```

## Documentation

Code is well-documented with comments explaining the purpose and usage of classes, methods, and blocks of logic where necessary.

## Additional Notes

- The app has been tested and runs on Android version 6 and above.
- Extra care has been taken to ensure performance optimization with the best practices in coding and state management.
- APKs for both arm64-v8a and armeabi-v7a Android architectures are available in the APK folder for easy installation on different types of devices.

## License

This project is licensed under the MIT License - see the `LICENSE.md` file for details.

[udemy]: https://www.udemy.com/user/hadi-kachmar-2/
[youtube]: https://www.youtube.com/channel/UCTGDYkqUtgCelc6G09LUm6w
[linkedin]: https://www.linkedin.com/in/hadi-kachmar-27a56a177/
[github]: https://github.com/hadikachmar3
[email]: mailto:flutterer.dev@gmail.com
[facebook]: https://www.facebook.com/Coding-with-Hadi-113431577650864/
[discord]: https://discord.gg/MhnKaY5qdK
