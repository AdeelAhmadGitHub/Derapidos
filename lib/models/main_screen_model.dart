class MainScreenModel {
  String text = '';
  String image = '';

  MainScreenModel({required this.text, required this.image});
}

List<MainScreenModel> mainScreenList = [
  MainScreenModel(text: "Restaurant Delivery", image: "assets/images/Group 7155.png"),
  MainScreenModel(text: "Grocery", image: "assets/images/Group 7153.png"),
  MainScreenModel(text: "Supermarkets", image: "assets/images/Group 7154.png"),
  MainScreenModel(text: "Real Estate", image: "assets/images/20.png"),
];
