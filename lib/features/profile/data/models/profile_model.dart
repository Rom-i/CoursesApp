class ProfileModel {
  final String id;
  final String email;
  final String name;

  ProfileModel({required this.id, required this.email, required this.name});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      name: json['name'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {'id': id, 'email': email, 'name': name};
  }
}