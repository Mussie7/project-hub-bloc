# Project Hub

Project Hub is a mobile application designed to display projects of a company that are open for work. Users can view, apply for projects, and manage their profiles. Admins can create and manage projects.

## Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
- [Installation](#installation)
- [Usage](#usage)
- [Folder Structure](#folder-structure)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Features

- User Onboarding
- User Authentication (Login/Signup)
- Profile Management
- View and Apply for Projects
- Admin Project Management (Create, Edit, Delete Projects)

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) (version 2.0 or higher)
- [Dart](https://dart.dev/get-dart)
- [Android Studio](https://developer.android.com/studio) or [VS Code](https://code.visualstudio.com/)

### Installation

1. **Clone the repository**:
```bash
git clone https://github.com/your-username/project_hub.git
cd project_hub
```
2. **Install dependencies**:

```bash
flutter pub get
```
3. **Run the app**:
```bash
flutter run
```

## Usage
### Running the App
To run the app on an emulator or a physical device:

```bash
flutter run
```

### Building the App
To build the app for release:

```bash
flutter build apk
```
## Folder Structure
The following is a brief overview of the project folder structure:

```css
lib/
├── application/
│   ├── blocs/
│   ├── usecases/
├── domain/
│   ├── entities/
│   ├── repositories/
│   ├── value_objects/
├── infrastructure/
│   ├── data_sources/
│   ├── repositories/
│   ├── api/
├── presentation/
│   ├── pages/
│   ├── widgets/
│   └── routes/
├── main.dart
```
`application`: Contains the business logic layer including blocs and use cases.
`domain`: Contains the domain layer including entities, repositories, and value objects.
`infrastructure`: Contains the infrastructure layer including data sources, repository implementations, and API clients.
`presentation`: Contains the presentation layer including pages, widgets, and routes.
`main.dart`: Entry point of the application.

### Contact
Fethiya Safi - Bunny99-coder
Mussie Asamere - Mussie7
Rediet Hailu - RedietHailu23

https://github.com/Mussie7/project-hub-bloc