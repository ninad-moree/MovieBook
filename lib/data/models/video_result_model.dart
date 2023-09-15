import 'video_model.dart';

class VideoResultModel {
  int id;
  List<VideoModel> videos;

  VideoResultModel({required this.id, required this.videos});

  factory VideoResultModel.fromJson(Map<String, dynamic> json) {
    List<VideoModel> videos = [];

    if (json['videos'] != null) {
      videos = (json['videos'] as List<dynamic>)
          .map((videoJson) =>
              VideoModel.fromJson(videoJson as Map<String, dynamic>))
          .toList();
    }

    return VideoResultModel(
      id: json['id'],
      videos: videos,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['results'] = videos.map((v) => (v).toJson()).toList();
    return data;
  }
}
