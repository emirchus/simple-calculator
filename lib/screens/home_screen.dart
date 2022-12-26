import 'package:flutter/material.dart';
import 'package:simple_calculator/notifiers/home_notifier.dart';
import 'package:simple_calculator/theme/colors.dart';
import 'package:simple_calculator/widgets/action_button.dart';
import 'package:simple_calculator/widgets/theme_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final homeProvider = HomeProvider.of(context).notifier!;

    print(homeProvider.current);

    return Scaffold(
        appBar: const ThemeAppbar(),
        body: Flex(
          direction: Axis.vertical,
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: SizedBox(
                width: width,
                height: width * 0.8,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: SingleChildScrollView(
                    reverse: true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: homeProvider.current.map((e) {
                              final color = e.isOperator ? kRedColor : null;

                              return TextSpan(
                                text: e.isOperator ? " ${e.value} " : e.value,
                                style: textTheme.headline1!.copyWith(
                                  color: color,
                                  fontSize: e.isOperator ? 44 : 54,
                                ),
                              );
                            }).toList(),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: Container(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                ),
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                child: Center(
                  child: GridView.builder(
                    padding: const EdgeInsets.only(
                      top: 20,
                      bottom: 20,
                    ),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (context, index) => ActionButton(
                      index: index,
                    ),
                    itemCount: 20,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
