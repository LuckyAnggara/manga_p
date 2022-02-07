import 'package:flutter/material.dart';
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
        color: isDarkMode
            ? Colors.white.withOpacity(0.1)
            : Colors.black.withOpacity(0.1),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      height: size.height * 0.50,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: data.listChapter!.length,
        itemBuilder: (context, i) {
          return Container(
            decoration: i == 0
                ? BoxDecoration(color: Colors.teal.withOpacity(0.1))
                : null,
            height: 70,
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 18,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Get.toNamed(
                    '/read/${data.listChapter![i].linkId}',
                  ),
                  child: SizedBox(
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Chapter ${data.listChapter![i].ch!}',
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.color,
                                fontSize: 14,
                                fontWeight: i == 0
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            i == 0
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
                        Text('Release : ${data.listChapter![i].timeRelease!}'),
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
    );
  }
}
