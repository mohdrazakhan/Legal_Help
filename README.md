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

**Legal Help** is a comprehensive mobile and web application that provides instant access to multiple Indian legal acts including IPC, CrPC, CPC, IEA, HMA, IDA, MVA, and NIA. Built with Flutter for cross-platform compatibility and powered by a Flask REST API with CORS support, this app makes legal information accessible to everyone - from law students and professionals to everyday citizens seeking legal knowledge.

### 🎯 Why Legal Help?

- **Multiple Legal Acts**: Access 8+ major Indian legal acts in one place
- **Cross-Platform**: Works seamlessly on iOS, Android, Web, Windows, macOS, and Linux
- **Enhanced API**: RESTful API with text sanitization for clean, readable content
- **User-Friendly**: Clean, intuitive interface for easy navigation
- **Comprehensive**: Complete database with sections, titles, and descriptions
- **Virtual Environment**: Isolated Python dependencies for easy setup

---

## ✨ Features

### Current Features

- 📱 **Cross-Platform Mobile App** - Native performance on iOS and Android
- 🌐 **Web Support** - Access from any modern web browser
- 💻 **Desktop Applications** - Available for Windows, macOS, and Linux
- � **Multiple Legal Acts** - Access IPC, CrPC, CPC, IEA, HMA, IDA, MVA, and NIA
- �🔍 **Browse All Sections** - Complete list of sections for each legal act
- 📄 **Detailed Section Information** - View titles and full descriptions
- 🧹 **Text Sanitization** - Clean, formatted text without extra whitespace
- 🚀 **Fast & Responsive** - Optimized for quick loading and smooth scrolling
- 🎨 **Modern UI** - Clean, Material Design interface
- 🔌 **CORS Enabled** - Ready for web-based frontend integration

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
- **CORS**: Flask-CORS for cross-origin requests
- **Text Processing**: Regex-based text sanitization
- **Virtual Environment**: venv for dependency isolation
- **Supported Acts**: IPC, CrPC, CPC, IEA, HMA, IDA, MVA, NIA

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

# Create and activate virtual environment (recommended)
python3 -m venv venv
source venv/bin/activate  # On macOS/Linux
# OR
venv\Scripts\activate  # On Windows

# Install Python dependencies
pip install flask flask-cors

# Start the Flask server
python app.py
```

The API server will start at `http://localhost:5000`

**Note**: The database (`IndiaLaw.db`) is already included in the backend directory.

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
const url = 'http://localhost:5000/api/act/IPC';

// For Android Emulator
const url = 'http://10.0.2.2:5000/api/act/IPC';

// For Physical Devices (replace with your computer's IP)
const url = 'http://YOUR_IP_ADDRESS:5000/api/act/IPC';
```

**Available Acts**: IPC, CRPC, CPC, IEA, HMA, IDA, MVA, NIA

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
http://localhost:5000/api
```

### Endpoints

#### Get All Sections from a Legal Act
```http
GET /api/act/<act_name>
```

**Parameters:**
- `act_name` (string) - The legal act name (IPC, CRPC, CPC, IEA, HMA, IDA, MVA, NIA)

**Example Request:**
```
GET /api/act/IPC
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

#### Get Specific Section from a Legal Act
```http
GET /api/act/<act_name>/<section_no>
```

**Parameters:**
- `act_name` (string) - The legal act name (IPC, CRPC, CPC, IEA, HMA, IDA, MVA, NIA)
- `section_no` (string) - The section number (e.g., "302", "420")

**Example Request:**
```
GET /api/act/IPC/302
```

**Response:**
```json
{
  "Section": "302",
  "section_title": "Punishment for murder",
  "section_desc": "Whoever commits murder shall be punished with..."
}
```

**Error Response (404 - Act not found):**
```json
{
  "error": "Act \"INVALID\" not found"
}
```

**Error Response (404 - Section not found):**
```json
{
  "error": "Section not found"
}
```

### Supported Legal Acts

| Code | Full Name |
|------|-----------|
| IPC | Indian Penal Code |
| CRPC | Code of Criminal Procedure |
| CPC | Code of Civil Procedure |
| IEA | Indian Evidence Act |
| HMA | Hindu Marriage Act |
| IDA | Indian Divorce Act |
| MVA | Motor Vehicles Act |
| NIA | Negotiable Instruments Act |

### Features
- **CORS Enabled**: Cross-origin requests supported
- **Text Sanitization**: Automatic removal of extra whitespace and formatting cleanup
- **Case Insensitive**: Act names are case-insensitive (ipc, IPC, Ipc all work)

---

## 📁 Project Structure

```
Legal_Help_Project/
├── 📄 README.md                 # Project documentation
├── � LICENSE                   # MIT License
├── �🐍 backend/                  # Flask backend
│   ├── app.py                  # Main Flask application with CORS
│   ├── IndiaLaw.db             # SQLite database (8+ legal acts)
│   └── instance/               # Instance-specific files
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
├── 🔧 venv/                     # Python virtual environment
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
# Solution: Activate virtual environment and start server
cd backend
source venv/bin/activate  # macOS/Linux
python app.py
```

**Issue: Database not found**
```bash
# Solution: Verify database location (should be IndiaLaw.db in backend/)
cd backend
ls -la IndiaLaw.db
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
const url = 'http://10.0.2.2:5000/api/act/IPC';
```

**Issue: Module not found (Python)**
```bash
# Solution: Ensure virtual environment is activated
source venv/bin/activate
pip install flask flask-cors
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
- [x] Multiple legal acts support (8+ acts)
- [x] CORS enabled API
- [x] Text sanitization
- [x] Virtual environment setup
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
