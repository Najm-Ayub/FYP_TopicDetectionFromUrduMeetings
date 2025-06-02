# TopicDetectionWeb

A Flutter-based web application for Topic Detection from Urdu Meetings using the **TextTiling** algorithm.

This project serves as the front-end interface that connects to a Flask-based REST API backend to analyze and segment Urdu text input.

---

## Getting Started

### Prerequisites

- Flutter SDK (latest stable)
- Chrome browser
- Backend Flask API running (refer to `model/` folder)

---

### Run the App

To run the app with CORS disabled (required for local development with the Flask API):

```bash
flutter run -d chrome --web-browser-flag "--disable-web-security"
