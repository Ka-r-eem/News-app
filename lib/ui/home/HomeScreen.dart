import 'package:flutter/material.dart';
import 'package:news_app/providers/SearchProvider.dart';
import 'package:news_app/ui/home/settings/SettingsFragment.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'HomeDrawer.dart';
import 'categories/CategoriesFragment.dart';
import 'categories/Category.dart';
import 'categoryDetails/CategoryDetails.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static bool search = false;
  static TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedWidget = CategoriesFragment(onCategoryItemClick);
  }

  @override
  Widget build(BuildContext context) {
    var searchProvider = Provider.of<SearchProvider>(context);
    return Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/background_pattern.png',
                ),
                fit: BoxFit.cover)),
        child: Scaffold(
            drawer: HomeDrawer(onMenuItemClick),
            appBar: AppBar(
              title: search == true
                  ? showSearchBar(searchController)
                  : const Text("News App"),
              centerTitle: true,
              actions: [
                IconButton(
                    onPressed: () {
                      search = true;
                      setState(() {
                        searchProvider.filterNews(searchController.text);
                      });
                    },
                    icon: const Icon(
                      Icons.search_sharp,
                      size: 34,
                    ))
              ],
            ),
            body: selectedWidget
    ));
  }

  late Widget selectedWidget;

  void onMenuItemClick(MenuItem item) {
    Navigator.pop(context);
    switch (item) {
      case MenuItem.categories:
        {
          selectedWidget = CategoriesFragment(onCategoryItemClick);
        }
      case MenuItem.settings:
        {
          selectedWidget = const SettingsFragment();
        }
    }
    setState(() {});
  }

  void onCategoryItemClick(Category category) {
    selectedWidget = CategoryDetails(category);
    setState(() {});
  }

  Widget showSearchBar(TextEditingController searchController) {
    var searchProvider = Provider.of<SearchProvider>(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        controller: searchController,
        style: const TextStyle(color: Colors.black87, fontSize: 20),
        decoration: InputDecoration(
          hintText: "Search...",
          fillColor: Colors.transparent,
          prefixIcon: IconButton(
              onPressed: () {
                setState(() {
                  search = false;
                  searchProvider.search = '';
                  searchController.text = '';
                });
              },
              icon: Icon(Icons.clear),
              color: Theme.of(context).primaryColor),
          // suffixIcon: IconButton(onPressed: onPressed, icon: icon) ,
          hintStyle:
              TextStyle(color: Theme.of(context).primaryColor, fontSize: 16),
        ),
      ),
    );
  }
}
