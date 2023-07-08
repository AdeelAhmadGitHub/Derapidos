class BurgerList {
  String imageName;
  String text;
  String text1;
  BurgerList(
      {required this.imageName, required this.text, required this.text1});
}

List<BurgerList> burgerListModel = [
  BurgerList(
      imageName: "assets/images/Chef_Burger.png",
      text:
          "Bread, grilled meat, lettuce,\nSandwich feature two savery\n flame-grilled beef patties",
      text1: "\$16.19"),
  BurgerList(
      imageName: "assets/images/Chef’s Burger1.png",
      text:
          "Bread, grilled meat, lettuce,\nSandwich feature two savery\n flame-grilled beef patties",
      text1: "\$16.19"),
  BurgerList(
      imageName: "assets/images/Chef’s Burger2.png",
      text:
          "Bread, grilled meat, lettuce,\nSandwich feature two savery\n flame-grilled beef patties",
      text1: "\$16.19"),
];
