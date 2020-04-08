# ToDo - Sample ToDo App

Simple ToDo app for creating tasks in one click! Create your daily tasks easily!

You can create tasks with or without timer. Use '12:00 (Hour:Minutes) do something' format to specify time for your task to be finished.


## Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites
This application is developed with [Flutter](https://flutter.dev). 
A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view [online documentation](https://flutter.dev/docs), which offers tutorials, samples, guidance on mobile development, and a full API reference.

Install Flutter on your local machine. View [install instructions](https://flutter.dev/docs/get-started/install)

### Installing
Copy [project files](https://github.com/inulugbek/numbers) and install app dependencies by executing the following command in the project folder.
```
flutter packages get
```

### Running
Run the app on emulator or physical device by executing the following command.
```
flutter run
```
*Run the app in release mode for the best performance
```
flutter run --release
```

## The important bits
### Architecture
While developing the project Clean Architecture principles were taken into consideration. 
The code base is divided into 3 layers: Data, Domain and Presentation/UI. 

#### Data Layer
Data layer of the application consists of Models and Data Sources. 

`/src/data/ToDoDataSource.dart` - data sources
`/src/data/ToDoModel.dart` - model

#### Domain Layer
Domain layer is the layer that contains domain business logic and presenter - state management. 
For this particular app Streams with the help of Provider package were mainly used to manage the state of the app.

`/src/domain/ToDoBloc.dart` - presentation logic made using Bloc Design pattern with StreamController
`/src/domain/ToDoRepository.dart` - domain business logic

#### Presentaion/UI Layer
Presentation layer consists of page/screen of the app and common encapsulated widgets that were used in design of the app.
The main concern was to seperate as much logic from the UI as possible.

`/src/ui/pages/*` - screens/pages
`/src/ui/widgets/*` - widgets

### Dependencies
This is the list of third-party libraries used in development.
* [provider](https://pub.dev/packages/provider)
* [built_value](https://pub.dev/packages/built_value)
* [rxdart](https://pub.dev/packages/rxdart)
* [intl](https://pub.dev/packages/intl)

## Authors
* **Ulugbek Isroilov** - *Author* - [Email](mailto:inulugbek@gmail.com)