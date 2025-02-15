<div align="center">
  <img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=600&size=28&duration=3000&pause=1000&color=9B8ADB&center=true&vCenter=true&width=435&lines=✨+Flutter+Todo+App+✨;🎯+Task+Management+Made+Beautiful;🚀+Built+with+Flutter+%2B+GetX" alt="Typing SVG" />
</div>

<div align="center">
  
  ![Flutter Version](https://img.shields.io/badge/Flutter-3.0+-02569B?logo=flutter)
  ![Dart Version](https://img.shields.io/badge/Dart-3.0+-0175C2?logo=dart)
  ![GetX Version](https://img.shields.io/badge/GetX-Latest-8B0000?logo=getx)
  ![License](https://img.shields.io/badge/License-MIT-purple.svg)
  
</div>

<p align="center">
  <img src="assets/Samples/TODO_API.gif" alt="App Demo" width="300"/>
</p>

<h2 align="center">🌟 A Modern Todo App with Beautiful UI...🌟</h2>

<p align="center">
  <b>Built with Flutter and GetX, featuring a stunning UI, smooth animations, and powerful task management capabilities.</b>
</p>

---

## ✨ Key Features

<div align="center">
  <table>
    <tr>
      <td align="center">
        <img src="https://img.icons8.com/color/48/000000/checked-2.png"/><br/>
        <b>Task Management</b>
      </td>
      <td align="center">
        <img src="https://img.icons8.com/color/48/000000/calendar.png"/><br/>
        <b>Calendar Integration</b>
      </td>
      <td align="center">
        <img src="https://img.icons8.com/color/48/000000/animation.png"/><br/>
        <b>Beautiful Animations</b>
      </td>
    </tr>
  </table>
</div>

<details>
<summary>🎯 Detailed Features</summary>

### Core Functionality
- ✅ Create, Read, Update, Delete tasks
- 📅 Calendar-based task organization
- 🔄 Real-time updates with GetX
- 💫 Smooth loading animations
- ✨ Beautiful UI components
- 📱 Responsive design
- 🌙 Task completion tracking

### Technical Features
- 🔐 State management with GetX
- 📡 RESTful API integration
- 🎨 Custom UI components
- 🔄 Loading state management
</details>

## 📱 App Showcase

<div align="center">
  <table>
    <tr>
      <td align="center">
        <img src="assets/Samples/image-1.png" width="200" alt="Task List"/><br/>
        <b>Task Management</b>
      </td>
      <td align="center">
        <img src="assets/Samples/image.png" width="200" alt="Add Task"/><br/>
        <b>Add New Tasks</b>
      </td>
      <td align="center">
        <img src="assets/Samples/image5.png" width="200" alt="Calendar View"/><br/>
        <b>File Structure..</b>
      </td>
    </tr>
  </table>
</div>

## 🏗️ Project Architecture

<details>
<summary>📂 Project Structure</summary>

```
lib/
├── 📱 api_examples/        # API integration layer
├── 🎨 components/         # Reusable UI components
│   ├── dialogs/         # Custom dialogs
│   ├── loading/        # Loading animations
│   └── widgets/       # Shared widgets
├── 🎮 controllers/     # GetX controllers
├── 📦 models/         # Data models
├── 🖼️ screens/       # App screens
└── 📍 main.dart     # Entry point
```
</details>

## 🚀 Quick Start

<details>
<summary>📥 Installation Steps</summary>

1. **Clone the repository**
```bash
git clone https://github.com/yourusername/flutter-todo-app.git
```

2. **Navigate to project directory**
```bash
cd flutter-todo-app
```

3. **Install dependencies**
```bash
flutter pub get
```

4. **Run the app**
```bash
flutter run
```
</details>

## 💻 Technical Implementation

<details>
<summary>📡 API Integration</summary>

```dart
// API Configuration
final String baseUrl = 'https://679c68d087618946e65216b3.mockapi.io/api/todolist';

// Available Endpoints
✓ GET    /todos     # Fetch all todos
✓ POST   /todos     # Create new todo
✓ PUT    /todos/:id # Update todo
✓ DELETE /todos/:id # Remove todo
```
</details>

<details>
<summary>📦 State Management</summary>

### GetX Implementation
```dart
class TodoController extends GetxController {
  // Reactive State
  final todos = <TodoModel>[].obs;
  final isLoading = false.obs;

  // State Management
  void updateTodos() => todos.refresh();
  
  // Loading State
  void toggleLoading() => isLoading.toggle();
}
```
</details>

## 🤝 Contributing

We welcome contributions! Feel free to:

- 🐛 Report bugs
- 💡 Suggest features
- 🔧 Submit PRs

<div align="center">
  <img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=600&size=24&duration=3000&pause=1000&color=9B8ADB&center=true&vCenter=true&width=435&lines=Thank+you+for+visiting!;Don't+forget+to+⭐+the+repo!" alt="Typing SVG" />
</div>
