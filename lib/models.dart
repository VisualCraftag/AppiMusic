class Song {
  final int id;
  final String name;
  final String artist;
  final String genre;
  final List<String> tags;

  Song({
    required this.id,
    required this.name,
    required this.artist,
    required this.genre,
    required this.tags,
  });

  factory Song.fromMap(Map<String, dynamic> map) {
    return Song(
      id: map['id'],
      name: map['name'],
      artist: map['artist'],
      genre: map['genre'],
      tags: (map['tags'] as String).split(','),
    );
  }
}

class FeedbackModel {
  final int id;
  final int songId;
  final int difficulty;
  final int enjoyment;

  FeedbackModel({
    required this.id,
    required this.songId,
    required this.difficulty,
    required this.enjoyment,
  });

  factory FeedbackModel.fromMap(Map<String, dynamic> map) {
    return FeedbackModel(
      id: map['id'],
      songId: map['song_id'],
      difficulty: map['difficulty'],
      enjoyment: map['enjoyment'],
    );
  }
}
