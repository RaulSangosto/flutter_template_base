# Flutter MVVM Clean Code Template

This is a MVVM Clean Code Flutter template with [mason](https://github.com/felangel/mason). You can start a project using this template.

It is created as a fork of https://github.com/jhj0517/flutter_template_base using it as a base.

This template includes:

- Dependency Injection with GetIt
- Room like SQLite Database abstraction with Floor
- Shared preferences configured
- Theme styles with Google Fonts configured
- Font Awesome icons
- Dark/Light Theme mode
- Basic UI components
- Clean code architecture with examples configured
- MVVM with Home Screen as a example
- Easy routes configured with Go_Router
- Easy translations configured with Easy_localization

# Project Structure

The project is divided in 3 folders

```
lib
│
└───app
│
└───core
│   └───common
│   └───data / repository
│   └───database
│   │   │   dao/ entities / mappers
│   │   │   ...
│   └───domain
│   │   │   usacases.dart
│   │   │   ...
│   └───models
│   └───ui
│   │   └───components
│   │   └───theme
└───feature
│   +───home
│   │   │   screen / viewmodel / components / state / events
│   │   │   ...
```

1. app
   - This folder contains The MaterialApp of the aplication, the router and the dependency injector configuration
2. core
   - Contains the core components of the app. It is divided in to folders for each layer:
     - common: Contains the code that needs to be accesible from all layer of the app
     - data: Contains the repositories of each feature
     - database: Contains the Floor database
     - domain: Contains the usecases
     - model: Contains the models of all features
     - ui: Contains the common UI Widgets to be shared by features
3. feature
   - This folder contains the UI of each feature/screen of the app

# How to Make & Use Template

1. Install Mason CLI ( If it's not installed )
   ```
   dart pub global activate mason_cli
   ```
2. Git clone the repository
   ```
   git clone https://github.com/RaulSangosto/flutter_template_mvvm_clean.git
   ```
3. Implement your own template in the `__brick__/{{project_name.snakeCase()}}/lib`.
4. Add the template as the global brick. (you can change the brick name in [`brick.yaml`](https://github.com/RaulSangosto/flutter_template_mvvm_clean/blob/master/brick.yaml) as you want. )
   ```
   mason add -g flutter_template_mvvm_clean --path ./
   ```
5. Check that the brick is added correctly.
   ```
   mason ls -g
   ├── flutter_template_mvvm_clean 0.7.0  // it prints something like this
   ```
6. You can now start a new project with your own template
   ```
   mason make flutter_template_mvvm_clean
   ```

# Platforms

The mustache syntax `{{application_id}}` is implemented across 6 platforms. Only Android has been tested. If any errors occur or if it works fine on other platforms, please raise an issue and let me know.

1. Android ✅ - 24.04.26
2. IOS ❓ - Not tested yet
3. Web ❓ - Not tested yet
4. Linux ❓ - Not tested yet
5. MacOS ❓ - Not tested yet
6. Windows ❓ - Not tested yet

# Prompts

There're 4 prompts for the brick.

1. `project_name` : Project name.
2. `org_name` : Organization name like `com.example`.
3. `application_id` : App id after the organization name. Used on multiple platforms with `org_name`.
4. `description` : Project description.

# Run the project

To run the project you need to execute the following commands in the root of the project

```
flutter pub get
dart run build_runner build
```
