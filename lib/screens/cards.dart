import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: Center(
        child: MoviesCards()
      ),
    );
  }
}

class MoviesCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        List<String> imagePaths = [
          "assets/images/movies/avatar.png",
          "assets/images/movies/infinitywar.png",
          "assets/images/movies/thenun.png",
          "assets/images/movies/thefirstavenger.png",
          "assets/images/movies/super30.png",
          "assets/images/movies/openheimer.png",
          "assets/images/movies/barbie.png",
          "assets/images/movies/interstellar.png",
          "assets/images/movies/theoutpost.png",
          "assets/images/movies/blackadam.png",
        ];
        String imagePath = index < imagePaths.length ? imagePaths[index] : "";

        return MovieCard(imagePath: imagePath);
      },
    );
  }
}


class MovieCard extends StatelessWidget {
  final String imagePath;

  MovieCard({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
