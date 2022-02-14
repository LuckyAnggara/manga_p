import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../models/detail_model.dart';

class ChapterList extends StatelessWidget {
  ChapterList({
    Key? key,
    required this.size,
    required this.data,
  }) : super(key: key);

  final Size size;
  final DetailModel data;
  final appData = GetStorage();

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = appData.read('darkMode');

    return Container(
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      height: size.height * 0.50,
      child: SimpleBuilder(
        builder: (_) {
          bool isAscending = appData.read('isAscending');

          List chapterList = isAscending ? data.listChapter!.reversed.toList() : data.listChapter!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 10, right: 18, left: 18),
                child: Row(
                  children: [
                    Icon(
                      Icons.menu_book,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'List Chapter Manga',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        isAscending
                            ? appData.write('isAscending', false)
                            : appData.write('isAscending', true);
                      },
                      child: Icon(
                        isAscending
                            ? FontAwesomeIcons.sortNumericDown
                            : FontAwesomeIcons.sortNumericUpAlt,
                      ),
                    )
                  ],
                ),
              ),
              Divider(),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: chapterList.length,
                  itemBuilder: (context, i) {
                    int dd = isAscending ? chapterList.length - 1 : 0;
                    return Container(
                      decoration: i == dd
                          ? BoxDecoration(
                              color: Colors.teal.withOpacity(0.1),
                            )
                          : null,
                      height: 70,
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 18,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            splashColor: Colors.white.withOpacity(1),
                            onTap: () {
                              Get.toNamed(
                                '/read/${chapterList[i].linkId}',
                              );
                            },
                            child: SizedBox(
                              width: 200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Chapter ${chapterList[i].ch!}',
                                        style: TextStyle(
                                          color: Theme.of(context).textTheme.bodyText1?.color,
                                          fontSize: 14,
                                          fontWeight: i == dd ? FontWeight.bold : FontWeight.normal,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      i == dd
                                          ? const Text(
                                              'New',
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          : const SizedBox(),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Text('Release : ${chapterList[i].timeRelease!}'),
                                ],
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.more_vert,
                            size: 24,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
