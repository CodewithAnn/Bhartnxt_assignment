# articles_app_assignmment_bharat_nxt
A Flutter app that fetches and displays a list of articles from a public
API. 
## Demo

https://github.com/user-attachments/assets/b938ab67-1435-4018-b08b-7db90b798ad2

## Features
- List of articles
- Search functionality
- Detail view
- Pull to refresh
- Favorite Tab and Favorite button
## Tech Stack
- Flutter 3.29.3
- State Management: Cubit (flutter_bloc)
- HTTP: Dio
- Persistence: SharedPreferences



## Setup Instructions
1. Clone the repo:
```bash
git clone https://github.com/CodewithAnn/Bhartnxt_assignment.git
```
```bash
cd Bharatnxt_assignment 
```
2. Install dependencies:
```dart
flutter pub get
```
3. Run the app:
```dart
flutter run
```
## State Management Explanation
I chose Cubit for this app because it offers a simple yet scalable state management solution. `ArticleCubit` fetches and filters articles. `FavoriteCubit` manages persistent favorite IDs using shared_preferences.

