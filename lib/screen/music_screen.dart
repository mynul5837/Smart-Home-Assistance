import 'package:flutter/material.dart';
import 'package:smart_home_flutter_ui/constants/app_colors.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  final List<Map<String, dynamic>> musicTracks = [
    {
      'title': 'Peaceful Morning',
      'artist': 'Nature Sounds',
      'duration': '3:45',
      'isPlaying': false,
    },
    {
      'title': 'Relaxing Jazz',
      'artist': 'Smooth Quartet',
      'duration': '4:20',
      'isPlaying': false,
    },
    {
      'title': 'Deep Focus',
      'artist': 'Ambient Waves',
      'duration': '5:15',
      'isPlaying': false,
    },
    {
      'title': 'Evening Chill',
      'artist': 'Lofi Beats',
      'duration': '3:30',
      'isPlaying': false,
    },
  ];

  int currentTrackIndex = 0;
  double currentVolume = 0.5;
  bool isPlaying = false;
  Duration position = Duration.zero;
  Duration duration = const Duration(minutes: 3, seconds: 45);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.bgColor,
        elevation: 0,
        title: const Text(
          'Music Player',
          style: TextStyle(color: AppColor.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColor.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // Now Playing Section
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: AppColor.fg1Color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    Icons.music_note,
                    size: 80,
                    color: AppColor.fg1Color,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  musicTracks[currentTrackIndex]['title'],
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  musicTracks[currentTrackIndex]['artist'],
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColor.grey,
                  ),
                ),
                const SizedBox(height: 20),
                // Progress Bar
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: AppColor.fg1Color,
                    inactiveTrackColor: AppColor.fg1Color.withOpacity(0.2),
                    thumbColor: AppColor.fg1Color,
                    trackHeight: 4,
                  ),
                  child: Slider(
                    value: position.inSeconds.toDouble(),
                    max: duration.inSeconds.toDouble(),
                    onChanged: (value) {
                      setState(() {
                        position = Duration(seconds: value.toInt());
                      });
                    },
                  ),
                ),
                // Time indicators
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${position.inMinutes}:${(position.inSeconds % 60).toString().padLeft(2, '0')}',
                        style: TextStyle(color: AppColor.grey),
                      ),
                      Text(
                        '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}',
                        style: TextStyle(color: AppColor.grey),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Control Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.skip_previous, size: 35),
                      onPressed: () {
                        setState(() {
                          if (currentTrackIndex > 0) currentTrackIndex--;
                        });
                      },
                    ),
                    const SizedBox(width: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColor.fg1Color,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(
                          isPlaying ? Icons.pause : Icons.play_arrow,
                          size: 35,
                          color: AppColor.white,
                        ),
                        onPressed: () {
                          setState(() {
                            isPlaying = !isPlaying;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      icon: const Icon(Icons.skip_next, size: 35),
                      onPressed: () {
                        setState(() {
                          if (currentTrackIndex < musicTracks.length - 1) {
                            currentTrackIndex++;
                          }
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Volume Control
                Row(
                  children: [
                    const Icon(Icons.volume_down),
                    Expanded(
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: AppColor.fg1Color,
                          inactiveTrackColor: AppColor.fg1Color.withOpacity(0.2),
                          thumbColor: AppColor.fg1Color,
                          trackHeight: 4,
                        ),
                        child: Slider(
                          value: currentVolume,
                          onChanged: (value) {
                            setState(() {
                              currentVolume = value;
                            });
                          },
                        ),
                      ),
                    ),
                    const Icon(Icons.volume_up),
                  ],
                ),
              ],
            ),
          ),
          // Playlist Section
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: musicTracks.length,
              itemBuilder: (context, index) {
                final track = musicTracks[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: currentTrackIndex == index
                        ? AppColor.fg1Color.withOpacity(0.1)
                        : AppColor.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColor.fg1Color.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.music_note,
                        color: AppColor.fg1Color,
                      ),
                    ),
                    title: Text(
                      track['title'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(track['artist']),
                    trailing: Text(track['duration']),
                    onTap: () {
                      setState(() {
                        currentTrackIndex = index;
                        isPlaying = true;
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}