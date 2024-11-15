import 'dart:io';

import 'package:http/http.dart' as http;

Future<void> downloadFile(String url, String filename) async {
  try {
    // Create export directory if it doesn't exist
    final directory = Directory('export');
    if (!await directory.exists()) {
      await directory.create();
    }

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // Save file in the export directory
      final file = File('export/$filename');
      await file.writeAsBytes(response.bodyBytes);
      print('Téléchargement réussi : export/$filename');
    } else {
      print('Erreur lors du téléchargement de $filename : Code ${response.statusCode}');
    }
  } catch (e) {
    print('Erreur : $e');
  }
}

Future<void> downloadAllFiles() async {
  // Liste des URLs et des noms de fichiers associés
  final files = {
    'https://www.myinstants.com/media/sounds/ryuko-i-got-this_udCWCLO.mp3': 'ryuko-i-got-this.mp3',
    'https://www.myinstants.com/media/sounds/yeet-sound-effect.mp3': 'yeet-sound-effect.mp3',
    'https://www.myinstants.com/media/sounds/fart_2.mp3': 'fart.mp3',
    'https://www.myinstants.com/media/sounds/roblox-eating-sound-effect-nom-nom-nom.mp3': 'roblox-eating.mp3',
    'https://www.myinstants.com/media/sounds/roblox-explosion-sound.mp3': 'roblox-explosion.mp3',
    'https://www.myinstants.com/media/sounds/james_brown_-_i_got_you_i_feel_good-1-i-got-you-i-feel-goodtrack-1.mp3':
        'james-brown-i-got-you.mp3',
    'https://www.myinstants.com/media/sounds/ding-sound-effect_1_CVUaI0C.mp3': 'ding-sound-effect.mp3',
    'https://www.myinstants.com/media/sounds/discord_leave_sound_effect_download.mp3': 'discord-leave.mp3',
    'https://www.myinstants.com/media/sounds/bedtime.mp3': 'bedtime.mp3',
    'https://www.myinstants.com/media/sounds/collen-eyes-efect.mp3': 'collen-eyes-effect.mp3',
    'https://www.myinstants.com/media/sounds/bvcbvcb.mp3': 'bvcbvcb.mp3',
    'https://www.myinstants.com/media/sounds/gta-v-notification.mp3': 'gta-v-notification.mp3',
  };

  // Téléchargement de chaque fichier
  for (final entry in files.entries) {
    await downloadFile(entry.key, entry.value);
  }
}

void main() {
  downloadAllFiles();
}
