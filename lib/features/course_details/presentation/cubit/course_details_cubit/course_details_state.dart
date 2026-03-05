abstract class CourseDetailsState {}

class EnrollIntialState extends CourseDetailsState{}
class EnrollLoadingState extends CourseDetailsState{}
class EnrollSuccessState extends CourseDetailsState{}
class EnrollErrorState extends CourseDetailsState{
  final String errmsg;
  EnrollErrorState(this.errmsg);
}
class AlreadyEnrollState extends CourseDetailsState{}
class NotEnrolledState extends CourseDetailsState{}

