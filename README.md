# Hangman Flutter Game 🎮

<div style="position: relative; width: 800px; height: 500px; background-color: #CEDAB9;">
  <!-- GIF on top of the background color -->
  <img src="https://github.com/user-attachments/assets/22f243cd-6db9-45ea-9fa7-9aa8f62ba9b0" alt="Intro GIF" style="position: absolute; top: 0; left: 0; width: 50%; height: auto; " />
</div>












A simple and fun Hangman game built with [Flutter](https://flutter.dev/) to challenge your vocabulary skills! Guess the word before the hangman is fully drawn. With various categories and customization options, this game is perfect for all ages.

## 🌟 Features
- **Start a game instantly** with the default category.
- **Choose from pre-made categories** or create your own category (add/edit/delete words).
- **Dynamic gameplay** with 6 chances to guess the word before losing.
- **Restart the game anytime** with a new word from the same category.
- **Game Over page** displays the correct word and options to try again or go back to the home page.
- **Win Dialog** when you successfully guess the word.
- Interactive and visually appealing **hangman figure** updates with every wrong guess.

## 🎨 Color Palette

| Name                   | Hex Code     | Preview                  |
|------------------------|--------------|--------------------------|
| Tea Green              | `#CEDAB9`    | ![Tea Green](https://via.placeholder.com/100x100/CEDAB9?text=+) |
| Cambridge Blue         | `#7F9F92`    | ![Cambridge Blue](https://via.placeholder.com/100x100/7F9F92?text=+) |
| Cambridge Blue 2       | `#A2C1A3`    | ![Cambridge Blue 2](https://via.placeholder.com/100x100/A2C1A3?text=+) |
| Wheat                  | `#F3DEAF`    | ![Wheat](https://via.placeholder.com/100x100/F3DEAF?text=+) |
| Buff                   | `#EBC389`    | ![Buff](https://via.placeholder.com/100x100/EBC389?text=+) |
| Primary Color Dark     | `#556869`    | ![Primary Color Dark](https://via.placeholder.com/100x100/556869?text=+) |
| Primary Color          | `#81A59A`    | ![Primary Color](https://via.placeholder.com/100x100/81A59A?text=+) |
| Secondary Color        | `#ECC3B0`    | ![Secondary Color](https://via.placeholder.com/100x100/ECC3B0?text=+) |
| Secondary Color Dark   | `#CFBFB9`    | ![Secondary Color Dark](https://via.placeholder.com/100x100/CFBFB9?text=+) |

## 📂 Project Structure
- **Models**:
  - `Category`: Represents a word category with its list of words.
  - `Game`: Tracks the current game state, guessed letters, and remaining chances.
- **Widgets**:
  - `FigureImage`: Displays the hangman figure dynamically.
  - `Letter`: Represents individual letter tiles.
- **Pages**:
  - `HomeScreen`: Entry point of the app.
  - `CategorySelectionPage`: Manage and choose categories.
  - `GamePage`: Core gameplay logic and UI.
  - `GameOverPage`: Displays results after a win or loss.

## 🚀 Getting Started

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/doctorcode9/hangman_flutter.git
   cd hangman_flutter
   flutter pub get
   flutter run
🤓 Good People <a href="https://github.com/doctorcode9"><img align="left" src="https://avatars.githubusercontent.com/u/73842931?s=100" height="75"></a>

<br> <br> 🎥 Preview

<!-- Add your screen recording here -->


https://github.com/user-attachments/assets/05f07f2b-314f-4655-a0b0-c00d0527ae53




Enjoy the game and challenge your friends! 🕹️





