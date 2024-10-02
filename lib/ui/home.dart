// screens/home_screen.dart
import 'package:flutter/material.dart';
import '../services/news_service.dart';
import '../models/news_article.dart';
import 'news_detail.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<NewsArticle>> _newsArticles;

  @override
  void initState() {
    super.initState();
    _newsArticles = NewsService().fetchNewsArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('El Beber'),
        backgroundColor: const Color(0xFF4673B8),
      ),
      body: FutureBuilder<List<NewsArticle>>(
        future: _newsArticles,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No news available'));
          }

          final newsArticles = snapshot.data!;
          return ListView.builder(
            itemCount: newsArticles.length,
            itemBuilder: (context, index) {
              final article = newsArticles[index];
              return Card(
                margin: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Image.network(
                      article.imageUrl,
                      fit: BoxFit.cover,
                      height: 200,
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.broken_image),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            article.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewsDetailScreen(article: article),
                          ),
                        );
                      },
                      child: const Text('Leer más'),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
