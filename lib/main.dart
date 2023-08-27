import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Story Telling App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ready for some stories!!!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StoryLibraryPage()),
                );
              },
              child: Text('Open Story Library'),
            ),
          ],
        ),
      ),
    );
  }
}

class StoryLibraryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Story Library'),
      ),
      body: Center(
        child: ListView(
          children: [
            StoryCard(
              title: 'Adventure in the Jungle',
              imageAsset: 'assets/jungle.jpg',
              content: '''
Once upon a time, in a lush green jungle, lived a brave explorer named Alex. 
Alex had always dreamt of discovering hidden treasures and rare creatures.
One day, while deep in the jungle, Alex stumbled upon an ancient map...
''',
            ),
            StoryCard(
              title: 'The Magical Castle',
              imageAsset: 'assets/castle.jpg',
              content: '''
In a land far away, there stood a magnificent castle surrounded by enchanting gardens.
The castle was rumored to hold magical secrets, guarded by mystical creatures.
One day, a curious young prince set out to unlock the castle's mysteries...
''',
            ),
            StoryCard(
              title: 'Under Water Exploration',
              imageAsset: 'assets/underwater.jpg',
              content: '''
In a land far away, there stood a magnificent castle surrounded by enchanting gardens.
The castle was rumored to hold magical secrets, guarded by mystical creatures.
One day, a curious young prince set out to unlock the castle's mysteries...
''',
            )
            // Add more stories here...
          ],
        ),
      ),
    );
  }
}

class StoryCard extends StatelessWidget {
  final String title;
  final String imageAsset;
  final String content;

  StoryCard({required this.title, required this.imageAsset, required this.content});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StoryContentPage(title: title, content: content),
          ),
        );
      },
      child: Card(
        child: Column(
          children: [
            Image.asset(
              imageAsset,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StoryContentPage extends StatelessWidget {
  final String title;
  final String content;

  StoryContentPage({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          content,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
