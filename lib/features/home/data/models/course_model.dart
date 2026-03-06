class CourseModel {
  final String id;
  final String title;
  final String desc;
  final String image;
  final int price;

  CourseModel({
    required this.id,
    required this.title,
    required this.desc,
    required this.image,
    required this.price,
  });

  factory CourseModel.fromJson(Map<String, dynamic> map) {
    return CourseModel(
      id: map['id'],
      title: map['title'],
      desc: map['desc'] ,
      image: map['image'] ,
      price: map['price'],
    );
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'title': title,
  //     'descr': desc,
  //     'image': image,
  //     'price': price,
  //   };
  // }

}