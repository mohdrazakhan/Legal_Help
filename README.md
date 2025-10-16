<div align="center">

# ⚖️ Legal Help

### Your Digital Legal Companion - IPC Sections at Your Fingertips

[![Flutter](https://img.shields.io/badge/Flutter-3.9.2-02569B?logo=flutter)](https://flutter.dev)
[![Python](https://img.shields.io/badge/Python-3.x-3776AB?logo=python)](https://python.org)
[![Flask](https://img.shields.io/badge/Flask-REST_API-000000?logo=flask)](https://flask.palletsprojects.com)
[![SQLite](https://img.shields.io/badge/SQLite-Database-003B57?logo=sqlite)](https://www.sqlite.org)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

[Features](#-features) • [Tech Stack](#-tech-stack) • [Getting Started](#-getting-started) • [API Documentation](#-api-documentation) • [Screenshots](#-screenshots) • [Contributing](#-contributing)

</div>

---

## 📖 Overview

**Legal Help** is a comprehensive mobile and web application that provides instant access to Indian Penal Code (IPC) sections. Built with Flutter for cross-platform compatibility and powered by a Flask REST API, this app makes legal information accessible to everyone - from law students and professionals to everyday citizens seeking legal knowledge.

### 🎯 Why Legal Help?

- **Instant Access**: Browse all IPC sections in one place
- **Cross-Platform**: Works seamlessly on iOS, Android, Web, Windows, macOS, and Linux
- **Offline-Ready**: SQLite database ensures data is always available
- **User-Friendly**: Clean, intuitive interface for easy navigation
- **Comprehensive**: Complete IPC section database with titles and descriptions

---

## ✨ Features

### Current Features

- 📱 **Cross-Platform Mobile App** - Native performance on iOS and Android
- 🌐 **Web Support** - Access from any modern web browser
- 💻 **Desktop Applications** - Available for Windows, macOS, and Linux
- 🔍 **Browse All IPC Sections** - Complete list of Indian Penal Code sections
- 📄 **Detailed Section Information** - View titles and full descriptions
- 🚀 **Fast & Responsive** - Optimized for quick loading and smooth scrolling
- 🎨 **Modern UI** - Clean, Material Design interface

### Coming Soon

- 🔎 Advanced search and filtering
- 🔖 Bookmark favorite sections
- 📚 Case law references
- 🌙 Dark mode support
- 📤 Share sections with others
- 🔔 Legal updates notifications

---

## 🛠️ Tech Stack

### Frontend
- **Framework**: [Flutter](https://flutter.dev) 3.9.2
- **Language**: Dart ^3.9.2
- **HTTP Client**: http ^1.5.0
- **State Management**: StatefulWidget with FutureBuilder
- **UI**: Material Design

### Backend
- **Framework**: [Flask](https://flask.palletsprojects.com) (Python)
- **Database**: SQLite 3
- **API**: RESTful architecture
- **CORS**: Enabled for cross-origin requests

### Development Tools
- **Version Control**: Git
- **IDE**: VS Code / Android Studio / Xcode
- **Package Manager**: pub (Flutter), pip (Python)

---

## 🚀 Getting Started

### Prerequisites

Before you begin, ensure you have the following installed:

- **Flutter SDK** (3.9.2 or higher) - [Install Flutter](https://flutter.dev/docs/get-started/install)
- **Python** (3.7 or higher) - [Install Python](https://www.python.org/downloads/)
- **Git** - [Install Git](https://git-scm.com/downloads)
- **Android Studio** (for Android development)
- **Xcode** (for iOS development, macOS only)

### Installation

#### 1️⃣ Clone the Repository

```bash
git clone https://github.com/mohdrazakhan/Legal_Help.git
cd Legal_Help_Project
```

#### 2️⃣ Backend Setup

```bash
# Navigate to backend directory
cd backend

# Install Python dependencies
pip install flask flask-cors

# Verify database exists
python check_db.py

# Start the Flask server
python app.py
```

The API server will start at `http://localhost:5000`

#### 3️⃣ Frontend Setup

```bash
# Navigate to Flutter app directory
cd legal_help_app

# Install Flutter dependencies
flutter pub get

# Verify Flutter installation
flutter doctor
```

#### 4️⃣ Configure API Endpoint

Update the API URL in `legal_help_app/lib/main.dart` based on your platform:

```dart
// For iOS Simulator or Web
const url = 'http://localhost:5000/ipc/all';

// For Android Emulator
const url = 'http://10.0.2.2:5000/ipc/all';

// For Physical Devices (replace with your computer's IP)
const url = 'http://YOUR_IP_ADDRESS:5000/ipc/all';
```

#### 5️⃣ Run the Application

```bash
# Run on Chrome (Web)
flutter run -d chrome

# Run on Android
flutter run -d android

# Run on iOS
flutter run -d ios

# Run on macOS
flutter run -d macos

# List all available devices
flutter devices
```

---

## 📡 API Documentation

### Base URL
```
http://localhost:5000
```

### Endpoints

#### Get All IPC Sections
```http
GET /ipc/all
```

**Response:**
```json
[
  {
    "Section": "1",
    "section_title": "Title of law",
    "section_desc": "This Act shall be called the Indian Penal Code..."
  },
  ...
]
```

#### Get Specific IPC Section
```http
GET /ipc/<section_no>
```

**Parameters:**
- `section_no` (string) - The IPC section number (e.g., "302", "420")

**Response:**
```json
{
  "Section": "302",
  "section_title": "Punishment for murder",
  "section_desc": "Whoever commits murder shall be punished with..."
}
```

**Error Response (404):**
```json
{
  "error": "Section not found"
}
```

### Rate Limiting
Currently no rate limiting is implemented. This will be added in future versions.

---

## 📁 Project Structure

```
Legal_Help_Project/
├── 📄 README.md                 # Project documentation
├── 🐍 backend/                  # Flask backend
│   ├── app.py                  # Main Flask application
│   ├── check_db.py             # Database verification script
│   ├── indialaw.db             # SQLite database
│   └── instance/               # Instance-specific files
│       └── indialaw.db
├── 📱 legal_help_app/           # Flutter application
│   ├── pubspec.yaml            # Flutter dependencies
│   ├── lib/
│   │   └── main.dart           # Main application entry
│   ├── android/                # Android-specific files
│   ├── ios/                    # iOS-specific files
│   ├── web/                    # Web-specific files
│   ├── windows/                # Windows-specific files
│   ├── macos/                  # macOS-specific files
│   └── linux/                  # Linux-specific files
└── 🧪 test/                     # Test files
    └── widget_test.dart
```

---

## 🎨 Screenshots

> 📸 Screenshots coming soon! The app features:
> - Clean home screen with IPC sections list
> - Detailed view of each section
> - Material Design UI with smooth animations
> - Responsive layout for all screen sizes

---

## 🧪 Testing

### Run Flutter Tests
```bash
cd legal_help_app
flutter test
```

### Run Backend Tests
```bash
cd backend
python -m pytest  # Coming soon
```

---

## 🔧 Configuration

### Flutter Configuration

Edit `legal_help_app/pubspec.yaml` to modify:
- App version
- Dependencies
- Assets
- Fonts

### Backend Configuration

Edit `backend/app.py` to modify:
- Port number (default: 5000)
- Database path
- CORS settings
- Debug mode

---

## 🐛 Troubleshooting

### Common Issues

**Issue: Cannot connect to backend**
```bash
# Solution: Check if backend is running
cd backend
python app.py
```

**Issue: Database not found**
```bash
# Solution: Verify database location
cd backend
python check_db.py
```

**Issue: Flutter dependencies not resolving**
```bash
# Solution: Clean and reinstall
flutter clean
flutter pub get
```

**Issue: Android emulator can't reach localhost**
```dart
// Solution: Use 10.0.2.2 instead of localhost
const url = 'http://10.0.2.2:5000/ipc/all';
```

---

## 🤝 Contributing

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

### How to Contribute

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Development Guidelines

- Follow the existing code style
- Write meaningful commit messages
- Add tests for new features
- Update documentation as needed
- Ensure all tests pass before submitting PR

---

## 📝 Roadmap

- [x] Basic IPC section listing
- [x] Individual section details API
- [x] Cross-platform Flutter app
- [ ] Search functionality
- [ ] Bookmark feature
- [ ] Dark mode
- [ ] Offline mode improvements
- [ ] Case law integration
- [ ] Multi-language support
- [ ] User authentication
- [ ] Admin panel for database management

---

## 📄 License

This project is licensed under the **MIT License** - free to use, modify, and distribute.

```
MIT License

Copyright (c) 2025 Mohd Raza Khan

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

**This project is open source and free to use anywhere!** 🎉

---

## 👨‍💻 Author

**Mohd Raza Khan**
- Portfolio: [mohdrazakhan.me](https://mohdrazakhan.me)
- GitHub: [@mohdrazakhan](https://github.com/mohdrazakhan)
- Repository: [Legal_Help](https://github.com/mohdrazakhan/Legal_Help)

---

## 🙏 Acknowledgments

- **[CivicTech India - Indian Law Penal Code JSON](https://github.com/civictech-India/Indian-Law-Penal-Code-Json)** - For providing the comprehensive IPC database that powers this application
- Flutter community for the amazing cross-platform framework
- Flask framework for the lightweight backend
- Material Design guidelines for UI/UX inspiration
- All contributors and supporters of this project

---

## 📞 Support

If you encounter any issues or have questions:

1. Check the [Troubleshooting](#-troubleshooting) section
2. Search existing [GitHub Issues](https://github.com/mohdrazakhan/Legal_Help/issues)
3. Create a new issue with detailed information
4. Contact the repository owner

---

## 🔒 Disclaimer

This application provides information about Indian Penal Code sections for educational purposes only. It should not be considered as legal advice. Always consult with a qualified legal professional for legal matters.

---

<div align="center">

### ⭐ Star this repository if you find it helpful!

Made with ❤️ and ☕ by [Mohd Raza Khan](https://github.com/mohdrazakhan)


**Legal Help** - *Making legal knowledge accessible to everyone*

</div>
