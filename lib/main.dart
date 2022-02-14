import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quizapp/models/favorite_manga_model.dart';
import 'package:quizapp/views/detail_page.dart';
import 'package:quizapp/views/home_page.dart';
import 'package:quizapp/views/read_page.dart';
import 'package:quizapp/views/search_page.dart';

void main() async {
  await GetStorage.init();
  Hive.registerAdapter(FavoriteMangaModelAdapter());
  // LicenseRegistry.addLicense(() async* {
  //   final license = await rootBundle.loadString('google_fonts/LICENSE.txt');
  //   yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  // });
  await Hive.initFlutter();
  await Hive.openBox('myBox');
  runApp(Home());
}

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light().copyWith(secondary: Colors.black),
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: Colors.black),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    colorScheme: const ColorScheme.dark().copyWith(secondary: Colors.white),
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: Colors.white),
    ),
  );
}

class Home extends StatelessWidget {
  final appData = GetStorage();

  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    appData.writeIfNull('darkMode', true);
    appData.writeIfNull('gridView', true);
    appData.writeIfNull('isAscending', true);

    return SimpleBuilder(
      builder: (_) {
        bool isDarkMode = appData.read('darkMode');
        return GetMaterialApp(
          theme: isDarkMode ? ThemeClass.darkTheme : ThemeClass.lightTheme,
          getPages: [
            GetPage(name: '/home', page: () => HomePage()),
            GetPage(name: '/detail/:linkId', page: () => DetailPage()),
            GetPage(name: '/read/:linkId', page: () => ReadPage()), // Dynamic route
            GetPage(name: '/search', page: () => SearchPage()), // Dynamic route
          ],
          // home: HomePage(),
          initialRoute: '/home',
        );
      },
    );
  }
}
