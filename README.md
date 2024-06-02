# Yum-Find 🍽️

Welcome to **Yum-Find**! Yum-Find is your ultimate recipe app that helps you discover, save, and share recipes from around the world. Whether you are looking for a quick weeknight dinner or planning a festive feast, Yum-Find has got you covered!

## Table of Contents 📜
- [Demo 🎥](#demo)
- [Features ✨](#features)
- [Technologies Used 💻](#TechnologiesUsed)
- [Installation ⚙️](#installation)
- [Usage 📖](#usage)
- [Technologies Used 🛠️](#technologies-used)
- [Contributing 🤝](#contributing)
- [License 📄](#license)
- [Contact 📧](#contact)

## Demo 🎥

Check out a live demo of Yum-Find [here](https://your-demo-link.com).

![Yum-Find Screenshot](https://your-image-link.com/screenshot.png)

## Features ✨
- 🔍 **Recipe Search:** Quickly find recipes using keywords. 
- ⚡️ **Quick Search:** Access popular and trending recipes instantly.
- 📑 **Detailed Views:** Explore detailed recipe instructions and ingredients.
- ❤️ **Favorites:** Save your favorite recipes for easy access.
- 🛒 **Shopping List:** Manage shopping lists by adding missing ingredients.
- 📋 **Detailed Instructions**: Step-by-step cooking instructions with images and videos.
- 🍎 **Nutritional Information**: Get nutritional breakdowns for each recipe.
- 📱 **Responsive Design:** Seamlessly adapts to different screen sizes for a consistent user experience.

## Technologies Used 💻
- 📦 **Hive:** Lightweight and fast NoSQL database for storing recipe and shopping list data.
- 🎛️ **Cubit:** State management library for managing application state and logic.
- 🍲 **Edamam API:** Used for fetching recipe data and nutritional information.
- 📱 **Responsive Design:** Utilized Flutter's layout widgets usind ScreenUtils.

## Installation ⚙️
To get a local copy up and running, follow these steps.
### Prerequisites 📋
Ensure you have the following installed:
- [Flutter](https://flutter.dev/docs/get-started/install)
- [Dart](https://dart.dev/get-dart)
  
### Clone the Repository 🌀

1. Clone the repository:
 
   ```bash
   git clone https://github.com/Mariam-Elkhelawy/Yum-Find.git
2. Navigate to the project directory:
 
   ```bash
   cd Yum-Find
3. Install dependencies:
 
   ```bash
   flutter pub get

4. Define API Keys in Constants File : </br> Navigate to the utils folder located within the core folder and add your Api key :

   ```bash
   static const String apiKey = 'your_api_key_here';
   
5. Run the app:  

   ```bash
   flutter run

