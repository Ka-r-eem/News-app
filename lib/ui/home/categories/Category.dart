import 'dart:ui';

class Category{
  String id;
  String title;
  Color color;
  String imageName;
  Category(this.id,this.title,this.imageName, this.color);

  static List<Category> getAllCategories(){
    return[
      Category('sports', 'SPORTS', 'sports.png', Color(0xFFC91C22)),
      Category('general', 'GENERAL', 'general.png', Color(0xFF003E90)),
      Category('health', 'HEALTH', 'health.png', Color(0xFFED1E79)),
      Category('business', 'BUSINESS', 'business.png', Color(0xFFCF7E48)),
      Category('technology', 'TECHNOLOGY', 'technology.png', Color(0xFF4882CF)),
      Category('science', 'SCIENCE', 'science.png', Color(0xFFF2D352)),

    ];
  }
}