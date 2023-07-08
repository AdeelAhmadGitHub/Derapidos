class ServicesList {
  String imageName;
  String text;

  ServicesList({required this.imageName, required this.text});
}

List<ServicesList> servicesListModel = [
  ServicesList(imageName: "assets/images/Burger.png", text: "Burger"),
  ServicesList(imageName: "assets/images/Pizza.png", text: "Pizza"),
  ServicesList(imageName: "assets/images/Drinks.png", text: "Drinks"),
];
