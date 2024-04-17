class Song {
  final String title;
  final String description;
  final String url;
  final String coverUrl;

  Song({
    required this.title,
    required this.description,
    required this.url,
    required this.coverUrl,
  });

  factory Song.fromJson(Map<String, dynamic> json) => Song(
        title: json["title"],
        description: json["artist"]['name'],
        url: json["preview"],
        coverUrl: json["album"]["cover_big"] ??
            "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png",
      );

  static List<Song> songs = [
    Song(
      title: 'Glass',
      description: 'Glass',
      url: 'assets/music/glass.mp3',
      coverUrl: 'assets/images/glass.jpg',
    ),
    Song(
      title: 'Illusions',
      description: 'Illusions',
      url: 'assets/music/illusions.mp3',
      coverUrl: 'assets/images/illusions.jpg',
    ),
    Song(
      title: 'Pray',
      description: 'Pray',
      url: 'assets/music/pray.mp3',
      coverUrl: 'assets/images/pray.jpg',
    )
  ];
}
