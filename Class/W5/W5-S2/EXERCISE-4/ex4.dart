import 'package:flutter/material.dart';

Color appColor = Colors.green[300] as Color;

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: appColor,
          title: const Text("Favorite Jokes"),
        ),
        body: const FavoriteJokesList(),
      ),
    ));

class FavoriteJokesList extends StatefulWidget {
  const FavoriteJokesList({super.key});

  @override
  State<FavoriteJokesList> createState() => _FavoriteJokesListState();
}

class _FavoriteJokesListState extends State<FavoriteJokesList> {
  // Track the index of the best joke
  int _bestJokeIndex = -1;

  void _setBestJoke(int index) {
    setState(() {
      // Set the best joke to the clicked index
      _bestJokeIndex = _bestJokeIndex == index ? -1 : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(20, (index) {
          return FavoriteCard(
            isBestJoke: _bestJokeIndex == index,
            onFavoriteClick: () => _setBestJoke(index),
          );
        }),
      ),
    );
  }
}

class FavoriteCard extends StatelessWidget {
  final bool isBestJoke;
  final VoidCallback onFavoriteClick;

  const FavoriteCard({
    super.key,
    required this.isBestJoke,
    required this.onFavoriteClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .5, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Title',
                  style: TextStyle(
                      color: appColor, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10.0),
                const Text('Description')
              ],
            ),
          ),
          IconButton(
            onPressed: onFavoriteClick,
            icon: Icon(
              isBestJoke ? Icons.favorite : Icons.favorite_border,
              color: isBestJoke ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
