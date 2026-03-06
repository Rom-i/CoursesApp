class CoursesVideosModel{
  final String id;
  final String title;
  final String videoUrl;
  final String desc;
  

  CoursesVideosModel({
    required this.id,
    required this.title,
    required this.videoUrl,
    required this.desc,
  });

  factory CoursesVideosModel.fromSupabase(Map<String, dynamic> map) {
    return CoursesVideosModel(
      id: map['id'].toString(),
      title: map['title'] ,
      videoUrl: map['video_url'],
      desc: map['desc'],
    );
  }
}