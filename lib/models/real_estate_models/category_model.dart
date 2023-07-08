class CategoryModel {
  String image;
  String text;
  CategoryModel({required this.text, required this.image});
}

List<CategoryModel> categoryList = [
  CategoryModel(text: "Burger", image: "assets/images/bb.png"),
  CategoryModel(text: "Pizza", image: "assets/images/pp.png"),
  CategoryModel(text: "Drinks", image: "assets/images/dd.png"),
];
