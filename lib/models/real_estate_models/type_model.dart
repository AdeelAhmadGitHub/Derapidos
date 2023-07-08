class TypeModel {
  String image;
  String text;

  TypeModel({required this.text, required this.image});
}

List<TypeModel> types = [
  TypeModel(text: "House/Villa", image: "assets/images/house.png"),
  TypeModel(text: "Apartment & Flats", image: "assets/images/apartments.png"),
  TypeModel(text: "Land & Plots", image: "assets/images/land.png"),
  TypeModel(text: "Commercial", image: "assets/images/office.png"),
  TypeModel(text: "Portion & Floor", image: "assets/images/tile.png"),
];
