# ✅ Tasky - Todo App   ( 53 work hour )

![Flutter](https://img.shields.io/badge/Made%20with-Flutter-blue.svg)
![Platform](https://img.shields.io/badge/Platform-Mobile-lightgrey)
![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)

A powerful and responsive **Flutter** todo app that supports secure **authentication**, smart **QR code** interaction, image attachments, and real-time task access. Built for productivity on any device.

---

## 🚀 Features

- 🔐 **Login** with phone number & password  
- 🌍 Country-based **phone number validation**  
- 🪪 JWT-based **Authorization** with token refresh  
  - `401`: Access expired – refresh token  
  - `403`: Refresh failed – log out  
  - `200`: Token refreshed – retry request  
- 📝 Todo List:
  - Infinite scrolling  
  - Pull-to-refresh  
  - Loading / Empty / Error states  
- 📸 **Add images** to todos via camera or gallery  
- 📎 **QR Code** generated from todo ID (on detail screen)  
- 📷 **QR Scanner** fetches todo by scanning and hitting `/todos/:id`  
- 📱 **Fully responsive design** for all screens  

---

## 📸 Screenshots

<div align="center">

<img src="assets/images/tasky_splash.jpg" width="45%" alt="Home Screen"/>
<img src="assets/images/tasky_login.jpg" width="45%" alt="Todo Detail"/>

<br><br>

<img src="assets/images/tasky_countries.jpg" width="45%" alt="QR Scanner"/>
<img src="assets/images/tasky_register.jpg" width="45%" alt="Add Image"/>

<br><br>

<img src="assets/images/tasky_home.jpg" width="45%" alt="QR Scanner"/>
<img src="assets/images/tasky_add.jpg" width="45%" alt="Add Image"/>

<br><br>

<img src="assets/images/tasky_details.jpg" width="45%" alt="QR Scanner"/>
<img src="assets/images/tasky_profile.jpg" width="45%" alt="Add Image"/>

</div>

---

## 🛠️ Tech Stack

- **Framework**: [Flutter](https://flutter.dev/)
- **Language**: Dart  
- **State Management**: (e.g., Provider, Bloc – specify if used)  
- **Authentication**: JWT with refresh token logic  
- **Camera & Media**: `camera`, `image_picker`  
- **QR Code**: `pretty_qr_code`  
- **API**: REST endpoints with secure token handling  
- **Platform**: Android / iOS  

---

## 📦 Installation

To run this app locally:

```bash
# Clone the repository
git clone https://github.com/AhmedNasser24/tasky_app.git

# Navigate into the project directory
cd tasky_app

# Get dependencies
flutter pub get

# Run the app on a device or emulator
flutter run
