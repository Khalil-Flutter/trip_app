class PeopleAlsoLikeModel {
  final String title;
  final String location;
  final int day;
  final String image;
  final int price;

  PeopleAlsoLikeModel({
    required this.title,
    required this.location,
    required this.day,
    required this.image,
    required this.price,
  });
}

List<PeopleAlsoLikeModel> peopleAlsoLikeModel = [
  PeopleAlsoLikeModel(
    title: "Eiffel Tower",
    location: "Paris",
    image: "assets/images/paris.jpg",
    day: 5,
    price: 430,
  ),
  PeopleAlsoLikeModel(
    title: "Baja Peninsula",
    location: "Mexico",
    image: "assets/images/images.jpeg",
    day: 7,
    price: 233,
  ),
  PeopleAlsoLikeModel(
    title: "Sossusvlei",
    location: "Salt pan in Namibia",
    image: "assets/images/Sossusvlei.jpg",
    day: 9,
    price: 550,
  ),
  PeopleAlsoLikeModel(
    title: "Cancún",
    location: "Mexico",
    image: "assets/images/4.jpg",
    day: 3,
    price: 546,
  ),
];
