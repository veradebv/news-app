class MenuItem {
  final String title;
  final int? total;
  final String image;

  MenuItem({required this.total, required this.title, required this.image});

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      total: json['total'],
      title: json['title'],
      image: json['image'],
    );
  }
}
