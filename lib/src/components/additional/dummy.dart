import 'dart:math';

abstract final class DummyText {
  const DummyText._();

  static final int _random = Random.secure().nextInt(_questions.length);

  static final String generateQuestion = _questions[_random];

  static final String generateAnswer = _answers[_random];

  static const List<String> _questions = [
    "What are some common design patterns used in software development?",
    "How does asynchronous programming work in Dart?",
    "What are the advantages of using Dart for web development?",
    "What are some best practices for error handling in Dart?",
    "How do you work with collections like lists and maps in Dart?",
    "What are mixins in Dart, and how are they used?",
    "What is the difference between abstract classes and interfaces in Dart?",
    "How can you work with JSON data in Dart?",
    "What are some techniques for optimizing Dart code for performance?",
    "What are the key features of Dart's sound null safety?",
    "How do you handle routing and navigation in a Flutter app?",
    "What are some commonly used design patterns in Flutter?",
    "How do you perform network requests in Flutter applications?",
    "What is the BLoC pattern and how is it used for state management in Flutter?",
    "What are some strategies for handling user authentication in Flutter apps?",
    "How do you implement custom animations in Flutter?",
    "What are some best practices for testing Flutter applications?",
    "How can you handle user input validation in a Flutter form?",
    "What are some tips for improving the user experience in a Flutter app?",
    "How can you integrate Firebase services into a Flutter app?"
  ];

  static const List<String> _answers = [
    "Common design patterns include Singleton, Factory, Observer, and Strategy.",
    "Asynchronous programming in Dart utilizes Future and Stream objects.",
    "Dart offers features like strong typing, fast performance, and easy-to-understand syntax for web development.",
    "Best practices for error handling include using try-catch blocks and handling specific exceptions.",
    "Dart provides List and Map classes with various methods for manipulation and iteration.",
    "Mixins are a way of reusing code in multiple class hierarchies without multiple inheritance.",
    "Abstract classes can have method implementations while interfaces cannot.",
    "Dart provides libraries like dart:convert for encoding and decoding JSON data.",
    "Optimization techniques include avoiding unnecessary object allocations and using efficient data structures.",
    "Sound null safety ensures that variables are non-null by default, reducing null-related errors.",
    "Routing and navigation can be handled using the Navigator class and named routes in Flutter.",
    "Common design patterns in Flutter include BLoC, Provider, and MVC.",
    "Network requests in Flutter can be made using the http package or Dio library.",
    "BLoC (Business Logic Component) pattern separates business logic from UI, providing a clean architecture for state management.",
    "User authentication can be implemented using Firebase Authentication or third-party packages like OAuth.",
    "Custom animations can be created using Flutter's animation controllers and custom painter classes.",
    "Best practices for testing include writing unit tests using the test package and widget tests using Flutter's testing framework.",
    "User input validation can be handled using the Form widget and validators in Flutter.",
    "Improving user experience involves considerations like performance optimization, intuitive UI design, and responsive layout.",
    "Firebase services like Firestore and Firebase Cloud Messaging can be integrated into Flutter apps for backend functionality."
  ];
}
