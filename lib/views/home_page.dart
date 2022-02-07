import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quizapp/widget/homepage/tab_body.dart';
import 'package:quizapp/widget/homepage/tab_home.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final appData = GetStorage();

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = appData.read('darkMode');

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          isDarkMode
              ? appData.write('darkMode', false)
              : appData.write('darkMode', true);
        },
        child: Icon(
          isDarkMode ? FontAwesomeIcons.moon : FontAwesomeIcons.sun,
          color: isDarkMode ? Colors.black : Colors.white,
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Icon(
                            Icons.view_headline,
                            size: 30,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Text(
                            'MANGAP',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).textTheme.bodyText1?.color,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () => Get.toNamed(
                            '/search',
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Icon(
                              Icons.search,
                              size: 30,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Icon(
                            Icons.sort,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TabHome(),
              TabBody(),
            ],
          ),
        ),
      ),
    );
  }
}
