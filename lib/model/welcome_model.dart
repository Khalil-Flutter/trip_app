class WelcomeModel {
  final String title;
  final String subTitle;
  final String description;
  final String imageUrl;

  WelcomeModel({
    required this.title,
    required this.subTitle,
    required this.description,
    required this.imageUrl,
  });
}

List<WelcomeModel> welcomeComponents = [
  WelcomeModel(
    title: "Travel",
    subTitle: "Roads",
    description:
        "A long, narrow stretch with a smoothed or paved surface, made for traveling by motor vehicle, carriage, etc., between two or more points; street or highway. A way or course: The road to peace.",
    imageUrl: "assets/images/1.jpg",
  ),
  WelcomeModel(
    title: "Enjoy",
    subTitle: "Seas",
    description:
        "Seas are smaller than oceans and are usually located where the land and ocean meet. Typically, seas are partially enclosed by land. Seas are found on the margins of the ocean and are partially enclosed by land.",
    imageUrl: "assets/images/2.jpg",
  ),
  WelcomeModel(
    title: "Discover",
    subTitle: "Mountains",
    description:
        "They usually have steep, sloping sides and sharp or rounded ridges, and a high point, called a peak or summit. Most geologists classify a mountain as a landform that rises at least 1,000 feet (300 meters) or more above its surrounding area.",
    imageUrl: "assets/images/3.jpg",
  ),
];
