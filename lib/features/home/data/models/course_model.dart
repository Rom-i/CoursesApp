class CourseModel {
  final String id;
  final String title;
  final String desc;
  final String image;
  final double price;
  final String? category;

  CourseModel({
    required this.id,
    required this.title,
    required this.desc,
    required this.image,
    required this.price, this.category,
  });

  factory CourseModel.fromJson(Map<String, dynamic> data) {
    return CourseModel(
      id: data['id'] as String,
      title: data['title'] as String,
      desc: data['desc'] as String,
      image: data['image'] as String,
      price: (data['price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'descr': desc,
      'image': image,
      'price': price,
    };
  }

}