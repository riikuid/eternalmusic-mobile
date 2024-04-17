import 'package:get/get.dart';
import 'package:musicplayer_app/models/song_models.dart';
import 'package:musicplayer_app/services/song_service.dart';

class SongController extends GetxController {
  var songs = <Song>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchSongs();
    super.onInit();
  }

  void fetchSongs() async {
    try {
      isLoading(true);
      var fetchedSongs = await SongService().fetchSongs();
      if (fetchedSongs.isNotEmpty) {
        songs.assignAll(fetchedSongs);
      }
    } finally {
      isLoading(false);
    }
  }
}
// import 'package:get/get.dart';

// class SongController extends GetxController {
//   var songs = <Song>[].obs;
//   var isLoading = true.obs;

//   @override
//   void onInit() {
//     fetchSongs();
//     super.onInit();
//   }

//   void fetchSongs() async {
//     try {
//       var fetchedSongs = await SongService().fetchSongs();
//       if (fetchedSongs.isNotEmpty) {
//         songs.assignAll(fetchedSongs);
//       }
//     } finally {
//       isLoading(false);
//     }
//   }
// }

