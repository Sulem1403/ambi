class unbordingcontent {
  String image;
  String title;
  String subtitle;
  String discription;
  unbordingcontent(
      {required this.image,
      required this.title,
      required this.subtitle,
      required this.discription});
}

List<unbordingcontent> contents = [
  unbordingcontent(
      image: "images/as.jpeg",
      subtitle: " 24x7",
      title: "Available",
      discription:
          "Rajaas ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"),
  unbordingcontent(
      image: "images/aid2.jpg",
      subtitle: " Treatments",
      title: "First Aid",
      discription:
          "Sed ut perspiciat eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"),
  unbordingcontent(
      image: "images/as.jpeg",
      title: "Book Ambulance",
      subtitle: " Near You",
      discription:
          "Sed ut perspiciat eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"),
];
