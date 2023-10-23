import 'package:flutter/material.dart';
import 'package:news_app/providers/ColorProvider.dart';
import 'package:provider/provider.dart';

typedef OnMenuItemClick = void Function(MenuItem clickedItemPos);

class HomeDrawer extends StatelessWidget {

  OnMenuItemClick onMenuItemClick;
  HomeDrawer(this.onMenuItemClick,{super.key});

  @override
  Widget build(BuildContext context) {
    var colorProvider = Provider.of<ColorProvider>(context);
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                vertical:48 ,
              ),

              alignment: Alignment.center,
              color: Theme.of(context).primaryColor,
              child: const Text('News App',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                ),),
            ),
            InkWell(
              onTap: (){
                onMenuItemClick(MenuItem.categories);
                colorProvider.changeThemeColor(Color(0xFF39A552));

              },
              child: const Row(
                children: [
                  Icon(Icons.list,size: 32,),
                  Text('Categories',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                    ),)
                ],
              ),
            ),
            const SizedBox(height: 12,),
            InkWell(
              onTap: (){
                onMenuItemClick(MenuItem.settings);
              },
              child: const Row(
                children: [
                  Icon(Icons.settings,size: 32,),
                  Text('Settings',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                    ),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

enum MenuItem{
  categories,
  settings
}