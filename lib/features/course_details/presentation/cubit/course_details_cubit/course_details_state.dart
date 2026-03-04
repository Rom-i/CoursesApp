abstract class CourseDetailsState {}

class CourseDetailsInitial extends CourseDetailsState{}
class CourseDetailsLoading extends CourseDetailsState{}
class CourseDetailsSuccess extends CourseDetailsState{}
class CourseDetailsError extends CourseDetailsState{
  final String errmsg;
  CourseDetailsError(this.errmsg);
}