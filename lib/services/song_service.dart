import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:musicplayer_app/models/song_models.dart';

class SongService {
  Future<List<Song>> fetchSongs() async {
    final response =
        await http.get(Uri.parse('https://api.deezer.com/playlist/908622995'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List songsJson = data['tracks']['data'];
      List<Song> songs = [];
      for (var item in songsJson) {
        songs.add(Song.fromJson(item));
      }
      print(songsJson);
      return songs;
    } else {
      throw Exception('Failed to load songs');
    }
  }
}
