import 'package:flutter/material.dart';
import '../models/movie_model.dart';
import 'movie_detail_page.dart';

class MovieListPage extends StatefulWidget {
  final String username;

  const MovieListPage({super.key, required this.username});

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  List<bool> savedMovies = List.generate(movieList.length, (index) => false);
  final List<MovieModel> movies = movieList;

  @override
  Widget build(BuildContext context) {
    /*
      implementasikan widget untuk menampilkan list movie yang sudah diambil dari dummy data
        - gunakan ListView.builder untuk menampilkan list movie
        - setiap item movie ditampilkan menggunakan Card widget yang berisi judul movie dan poster movie
        - ketika item movie ditekan, navigasikan ke halaman MovieDetailPage dengan membawa data movie yang dipilih   
    */


    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Movie List",
          style: TextStyle(              
            fontWeight: FontWeight.bold
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome, ${widget.username}!",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),
        
            Expanded(
              child: ListView.builder(
                itemCount: movies.length,
            
                itemBuilder: (context, index) {
            
                  final movie = movies[index];
            
                  return Card(
                    margin: const EdgeInsets.all(10),
            
                    child: ListTile(
            
                      leading: Image.network(
                        movie.imgUrl,
                        width: 50,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
            
                      title: Text(
                        "${movie.title} (${movie.year})",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
            
                      subtitle: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                      
                            Text(movie.genre),
                      
                            Row(
                              children: [
                                const Icon(Icons.star, color: Colors.orange, size: 16),
                                const SizedBox(width: 5),
                                Text("${movie.rating}/10")
                              ],
                            ),
                          ],
                        ),
                      ),
            
                      trailing: IconButton(
                        icon: Icon(
                          savedMovies[index] ? Icons.bookmark : Icons.bookmark_border
                        ),
                      
                        onPressed: () {
                          setState(() {
                          savedMovies[index] = !savedMovies[index];
                          });
                        },
                      ),
            
                      onTap: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => MovieDetailPage(movie:movie)
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}