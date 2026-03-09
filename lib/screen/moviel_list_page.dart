import 'package:flutter/material.dart';
import 'package:latihan_kuis_a/models/movie_model.dart';
import 'package:latihan_kuis_a/screen/movie_detail_page.dart';

class MovieListPage extends StatelessWidget {
  MovieListPage({super.key});

  static createRoute() =>
      MaterialPageRoute(builder: (context) => MovieListPage());

  @override
  Widget build(BuildContext context) {
    /*
      implementasikan widget untuk menampilkan list movie yang sudah diambil dari dummy data
        - gunakan ListView.builder untuk menampilkan list movie
        - setiap item movie ditampilkan menggunakan Card widget yang berisi judul movie dan poster movie
        - ketika item movie ditekan, navigasikan ke halaman MovieDetailPage dengan membawa data movie yang dipilih
        
    
     */
    return Scaffold(
      appBar: AppBar(title: Text("Film")),
      body: ListView.builder(
        itemCount: movieList.length,
        itemBuilder: (context, index) => _listItem(context, movieList[index]),
      ),
    );
  }

  Widget _smallChip(BuildContext context, Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: child,
    );
  }

  Widget _listItem(BuildContext context, MovieModel movie) {
    return Card.outlined(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () => Navigator.of(context).push(MovieDetailPage.createRoute(movie)),
        child: Row(
          spacing: 8.0,
          children: [
            Image.network(
              movie.imgUrl,
              width: 128.0,
              height: 72.0,
              fit: BoxFit.cover,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movie.title, style: Theme.of(context).textTheme.bodyLarge),
                Text(
                  movie.genre,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Row(
                  spacing: 8.0,
                  children: [
                    _smallChip(
                      context,
                      Row(
                        spacing: 2.0,
                        children: [
                          Text(
                            movie.rating.toString(),
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          Icon(
                            Icons.star,
                            size: 12.0,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ],
                      ),
                    ),
                    _smallChip(
                      context,
                      Text(
                        movie.year.toString(),
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
