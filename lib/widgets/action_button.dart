import 'package:flutter/material.dart';
import 'package:simple_calculator/notifiers/home_notifier.dart';
import 'package:simple_calculator/theme/colors.dart';

const List<String> formatsByIndex = [
  "AC",
  "±",
  "%",
  "÷",
  "7",
  "8",
  "9",
  "×",
  "4",
  "5",
  "6",
  "-",
  "1",
  "2",
  "3",
  "+",
  "↺",
  "0",
  ".",
  "=",
];

class ActionButton extends StatelessWidget {
  final int index;

  const ActionButton({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final isOperator = index == 3 || index == 7 || index == 11 || index == 15 || index == 19;
    final isAction = index == 0 || index == 1 || index == 2;

    final homeProvider = HomeProvider.of(context).notifier!;

    return GestureDetector(
      onTap: () {
        if (isAction) {}

        if (isOperator && index == 19) {
          //TODO: Add the operation to the history and append the result
          return;
        }

        homeProvider.addOperation(OperationValue(index: index, value: formatsByIndex[index], isOperator: isOperator));
      },
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.background,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            formatsByIndex[index],
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: isOperator ? 34 : 24,
              color: isOperator
                  ? kRedColor
                  : isAction
                      ? kBlueColor
                      : null,
            ),
          ),
        ),
      ),
    );
  }
}
