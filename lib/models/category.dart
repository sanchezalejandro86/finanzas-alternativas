import "dart:convert";

class Category{
  Category();

  int id;
  String name;

  static final columns = ["id", "name"];

  Map toMap(){
    Map map = {
      "name": name
    };

    if(id != null){
      map["id"] = id;
    }

    return map;
  }

  static fromMap(Map map){
    Category category = Category();
    category.id = map["id"];
    category.name = map["name"];

    return category;
  }
}