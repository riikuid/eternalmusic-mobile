import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:musicplayer_app/controllers/song_controller.dart';
import 'package:musicplayer_app/widgets/playlist_card.dart';
import 'package:musicplayer_app/widgets/section_header.dart';
import 'package:musicplayer_app/widgets/song_card.dart';
import '../models/playlist_model.dart';
import 'package:musicplayer_app/models/song_models.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SongController songController = Get.put(SongController());
    // List<Song> songs = Song.songs;
    // List<Playlist> playlists = Playlist.playlists;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0x49243E).withOpacity(0.9),
            Color(0xBB8493).withOpacity(0.9),
          ],
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: const _CustomAppBar(),
          bottomNavigationBar: const _CustomNavBar(),
          body: Obx(() => songController.isLoading.isTrue
              ? Center(child: CircularProgressIndicator())
              : GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1,
                  ),
                  itemCount: songController.songs.length,
                  itemBuilder: (context, index) {
                    var song = songController.songs[index];
                    return SongCard(
                      song: song,
                    );
                  },
                ))),
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       const _DiscoverMusic(),
      //       GetBuilder<SongController>(
      //         init: SongController(),
      //         builder: (controller) {
      //           if (controller.isLoading.value) {
      //             return Center(child: CircularProgressIndicator());
      //           }
      //           return GridView.builder(
      //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //               crossAxisCount: 2, // Mengatur jumlah kolom dalam grid
      //               mainAxisSpacing: 8.0, // Spasi vertikal antara item
      //               crossAxisSpacing: 8.0, // Spasi horizontal antara item
      //               childAspectRatio: 0.7, // Rasio lebar-tinggi setiap item
      //             ),
      //             itemCount: controller.songs.length,
      //             itemBuilder: (context, index) {
      //               var song = controller.songs[index];
      //               return SongCard(
      //                 song: song,
      //               );
      //             },
      //           );
      //         },
      //       ),
      //       // _TrendingMusic(songs: songs),
      //       // _PlaylistMusic(playlists: playlists),
      //     ],
      //   ),
      // ),
    );
  }
}

class _PlaylistMusic extends StatelessWidget {
  const _PlaylistMusic({
    Key? key,
    required this.playlists,
  }) : super(key: key);

  final List<Playlist> playlists;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SectionHeader(title: 'Playlists'),
          ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 20),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: playlists.length,
            itemBuilder: ((context, index) {
              return PlaylistCard(playlist: playlists[index]);
            }),
          ),
        ],
      ),
    );
  }
}

class _TrendingMusic extends StatelessWidget {
  const _TrendingMusic({
    Key? key,
    required this.songs,
  }) : super(key: key);

  final List<Song> songs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        top: 20.0,
        bottom: 20.0,
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: SectionHeader(title: 'Trending Music'),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.27,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return SongCard(song: songs[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _DiscoverMusic extends StatelessWidget {
  const _DiscoverMusic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome MooEters',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 5),
          Text(
            'Elevate Your Experience: Tune In, Tune Up',
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              isDense: true,
              filled: true,
              fillColor: Colors.white,
              hintText: 'Search',
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.grey.shade400),
              prefixIcon: Icon(Icons.search, color: Colors.grey.shade400),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomNavBar extends StatelessWidget {
  const _CustomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xFF49243E),
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.white,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.play_circle_outline),
          label: 'Play',
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.people_outline),
        //   label: 'Profile',
        // ),
      ],
    );
  }
}

class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        'EternalMusic',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20, // Ukuran teks
          fontFamily: 'Jacquard 24', // Ganti dengan font dari Google Fonts
          fontWeight: FontWeight.bold, // Atur ketebalan teks
        ),
      ),
      centerTitle: true, // Untuk meletakkan judul di tengah
      // leading: const Icon(Icons.grid_view_rounded, color: Colors.white),
      // actions: [
      //   Container(
      //     margin: const EdgeInsets.only(right: 20),
      //     child: const CircleAvatar(
      //       backgroundImage: NetworkImage(
      //         'https://images.unsplash.com/photo-1659025435463-a039676b45a0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80',
      //       ),
      //     ),
      //   ),
      // ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
