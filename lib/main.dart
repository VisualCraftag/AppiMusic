import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de Canciones',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SongListScreen(),
    );
  }
}

class SongListScreen extends StatelessWidget {
  const SongListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Lista de canciones reales con sus artistas
    final List<Map<String, String>> songs = [
      {'song': 'Imagine', 'artist': 'John Lennon'},
      {'song': 'Bohemian Rhapsody', 'artist': 'Queen'},
      {'song': 'Billie Jean', 'artist': 'Michael Jackson'},
      {'song': 'Hey Jude', 'artist': 'The Beatles'},
      {'song': 'Hotel California', 'artist': 'Eagles'},
      {'song': 'Stairway to Heaven', 'artist': 'Led Zeppelin'},
      {'song': 'Shape of You', 'artist': 'Ed Sheeran'},
      {'song': 'Someone Like You', 'artist': 'Adele'},
      {'song': 'Smells Like Teen Spirit', 'artist': 'Nirvana'},
      {'song': 'Rolling in the Deep', 'artist': 'Adele'},
      {'song': 'Hallelujah', 'artist': 'Leonard Cohen'},
      {'song': 'Sweet Child O’ Mine', 'artist': 'Guns N’ Roses'},
      {'song': 'Perfect', 'artist': 'Ed Sheeran'},
      {'song': 'Let It Be', 'artist': 'The Beatles'},
      {'song': 'Wonderwall', 'artist': 'Oasis'},
      {'song': 'Lose Yourself', 'artist': 'Eminem'},
      {'song': 'Thunderstruck', 'artist': 'AC/DC'},
      {'song': 'Shake It Off', 'artist': 'Taylor Swift'},
      {'song': 'Livin’ on a Prayer', 'artist': 'Bon Jovi'},
      {'song': 'Purple Rain', 'artist': 'Prince'},
      {'song': 'My Heart Will Go On', 'artist': 'Celine Dion'},
      {'song': 'Uptown Funk', 'artist': 'Bruno Mars'},
      {'song': 'Despacito', 'artist': 'Luis Fonsi'},
      {'song': 'Blinding Lights', 'artist': 'The Weeknd'},
      {'song': 'Rolling Stones', 'artist': 'Paint It Black'},
      // Añade más canciones hasta tener 100...
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Canciones'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          final song = songs[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blueAccent,
                child: Text(
                  (index + 1).toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              title: Text(
                song['song']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(song['artist']!),
              trailing: const Icon(Icons.music_note, color: Colors.blueAccent),
              onTap: () {
                // Navegar a la pantalla de opciones
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SongOptionsScreen(song: song),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class SongOptionsScreen extends StatelessWidget {
  final Map<String, String> song;

  const SongOptionsScreen({Key? key, required this.song}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(song['song']!),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              song['song']!,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Interpretada por ${song['artist']}',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Acción para aprender la canción
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('¡Canción Aprendida!'),
                    content: Text('Has aprendido "${song['song']}" de ${song['artist']}.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context); // Volver a la pantalla principal
                        },
                        child: const Text('Volver'),
                      ),
                    ],
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
              child: const Text('Aprender'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Volver a la lista de canciones
              },
              child: const Text(
                'Volver',
                style: TextStyle(color: Colors.blueAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
