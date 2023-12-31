import 'package:flutter/material.dart';
import 'package:news_app/providers/ColorProvider.dart';
import 'package:provider/provider.dart';

import 'Category.dart';
import 'CategoryWidget.dart';

typedef OnCategoryClick = void Function(Category category);

class CategoriesFragment extends StatelessWidget {
  OnCategoryClick onCategoryClick;
  CategoriesFragment(this.onCategoryClick,{super.key});
  List<Category> categories = Category.getAllCategories();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ColorProvider>(context);

    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('''Pick your category \nof interest''',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold
          ),),
          const SizedBox(height: 12,),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 24 ,
                  crossAxisSpacing: 20
                ),
                itemBuilder: (context, index) => InkWell(
                    onTap: (){
                      onCategoryClick(categories[index]);
                      provider.changeThemeColor(categories[index].color);
                    },
                    child: CategoryItem(categories[index],index)),
            itemCount: categories.length,),
          )
        ],
      ),
    );
  }
}
