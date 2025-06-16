class MenuItem {
  final String title;
  final String image;

  MenuItem({required this.title, required this.image});

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      title: json['title'],
      image: json['image'],
    );
  }
}