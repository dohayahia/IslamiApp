import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart' hide Radio;
import '../Models/radio_response_model.dart';
class RadioItem extends StatelessWidget {
  final Radio radio;
  static final player = AudioPlayer();
  const RadioItem({super.key, required this.radio});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Text(
          radio.name?? "",
        // 3shan lw haga fadya myarg3sh nullable
        //  ("اذاعة القرأن الكريم"),
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () async {
                  await player.play(UrlSource(radio.url!));
                },
                icon: Icon(Icons.play_arrow_rounded,
                  color: Theme
                      .of(context)
                      .colorScheme
                      .primary,
                  size: 56,
                )),
            IconButton(
                onPressed: ()  async  {
                  await player.stop();
                },
                icon: Icon(Icons.stop_rounded,
                  color: Theme
                      .of(context)
                      .colorScheme
                      .primary,
                  size: 56,
                ))
          ],
        )
      ],
    );
  }
}
