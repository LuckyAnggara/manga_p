import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/controller/search_controller.dart';

import '../widget/searchpage/manga_card_search.dart';
import '../widget/searchpage/search_bar.dart';
import 'home_page.dart';

class SearchPage extends StatelessWidget {
  final TextEditingController searchTextController = TextEditingController();
  final SearchController searchController = Get.put(SearchController());

  void search(String keyWord) {
    searchController.isLoading.value = true;
    searchController.searchManga(keyWord);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - 180) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.off(() => HomePage());
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 30,
                      ),
                    ),
                    SearchBar(
                      controller: searchTextController,
                      onPress: () {
                        search(searchTextController.text);
                      },
                      onSubmit: (_) {
                        search(searchTextController.text);
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  child: Obx(() {
                    if (searchController.notSearch.value) {
                      return GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: (itemWidth / itemHeight),
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                          crossAxisCount: 2,
                        ),
                        physics: BouncingScrollPhysics(),
                        itemCount: searchController.mangaList.length,
                        itemBuilder: (context, x) {
                          return MangaCardSearch(
                              context: context, data: searchController.mangaList[x]);
                        },
                      );
                    } else {
                      if (searchController.isLoading.value) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return const Center(
                          child: Text('Type manga you want to read ...'),
                        );
                      }
                    }
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
