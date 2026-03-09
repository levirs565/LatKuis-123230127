import 'package:flutter/material.dart';
import 'package:latihan_kuis_a/models/movie_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/favorite_movie.dart';

class MovieDetailPage extends StatefulWidget {
  final MovieModel movie;

  static createRoute(MovieModel movie) =>
      MaterialPageRoute(builder: (context) => MovieDetailPage(movie: movie));

  const MovieDetailPage({super.key, required this.movie});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  Widget _mediumChip(BuildContext context, Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(16.0),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final movie = widget.movie;
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.network(movie.imgUrl, height: 320.0, fit: BoxFit.cover),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                movie.title,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                            ListenableBuilder(
                              listenable: favoriteList,
                              builder: (context, child) {
                                final favorite = isFavorite(movie);
                                return IconButton(
                                  onPressed: () => toggleFavorite(movie),
                                  icon: Icon(
                                    favorite ? Icons.favorite : Icons
                                        .favorite_outline,
                                    color: favorite ? Theme
                                        .of(context)
                                        .colorScheme
                                        .primary : null,
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                        Text(
                          movie.genre,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            spacing: 8.0,
                            children: [
                              _mediumChip(
                                context,
                                Row(
                                  spacing: 4.0,
                                  children: [
                                    Text(
                                      movie.rating.toString(),
                                      style: Theme.of(
                                        context,
                                      ).textTheme.labelLarge,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                      size: 16.0,
                                    ),
                                  ],
                                ),
                              ),
                              _mediumChip(
                                context,
                                Text(
                                  movie.year.toString(),
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Table(
                          columnWidths: {
                            0: IntrinsicColumnWidth(),
                            1: FlexColumnWidth(),
                          },
                          border: TableBorder(
                            horizontalInside: BorderSide(
                              color: Theme.of(context).dividerColor,
                              width: 0.125,
                            )
                          ),
                          children: [
                            TableRow(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Text("Director"),
                                ),
                                Text(movie.director),
                              ],
                            ),
                            TableRow(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Text("Stars"),
                                ),
                                Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: 8,
                                  runSpacing: 4,
                                  children: movie.casts.indexed
                                      .expand(
                                        (cast) => [
                                          Text(cast.$2),
                                          if (cast.$1 != movie.casts.length - 1)
                                            Container(
                                              width: 6,
                                              height: 6,
                                              decoration: BoxDecoration(
                                                color: Theme.of(
                                                  context,
                                                ).colorScheme.primary,
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                        ],
                                      )
                                      .toList(),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 8.0,),
                        Text(
                          "Synopsis",
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          movie.synopsis,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Material(
            elevation: 32.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FilledButton(
                onPressed: () {
                  launchUrl(Uri.parse(movie.movieUrl));
                },
                child: Text("Visit Wikipedia"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
