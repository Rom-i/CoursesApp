import 'package:courses_app/features/videoooo/data/model/videoo_model.dart';

enum ContentStatus { initial, loading, error, success }

class ContentState {
  final String error;
  final List<VideoModel> content;
  final ContentStatus status;
  ContentState({
    this.status = ContentStatus.initial,
    this.error = '',
    this.content = const [],
  });
  ContentState copyWith({
    ContentStatus? status,
    String? error,
    List<VideoModel>? content,
  }) {
    return ContentState(
      status: status ?? this.status,
      error: error ?? this.error,
      content: content ?? this.content,
    );
  }
}