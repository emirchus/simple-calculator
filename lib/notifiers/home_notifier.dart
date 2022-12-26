import 'package:flutter/material.dart';

class OperationValue {
  final int index;
  final String value;
  final bool isOperator;
  bool isPositive;

  OperationValue({
    required this.index,
    required this.value,
    required this.isOperator,
    this.isPositive = true,
  });
}

typedef OperationList = List<OperationValue>;

class HomeNotifier extends ChangeNotifier {
  final List<OperationList> _history = [];
  List<OperationValue> _current = [];

  List<OperationList> get history => _history;
  List<OperationValue> get current => _current;

  void addOperation(OperationValue operation) {
    _current.add(operation);
    notifyListeners();
  }

  void removeOperation() {
    _current.removeLast();
    notifyListeners();
  }

  void clearOperations() {
    _current.clear();
    notifyListeners();
  }
}

class HomeProvider extends InheritedNotifier<HomeNotifier> {
  const HomeProvider({super.key, required super.child, required super.notifier});

  static HomeProvider of(BuildContext context) => context.findAncestorWidgetOfExactType<HomeProvider>()!;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
