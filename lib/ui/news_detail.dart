import 'package:flutter/material.dart';
import '../models/news_article.dart';

class NewsDetailScreen extends StatelessWidget {
  final NewsArticle article;

  NewsDetailScreen({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              article.imageUrl,
              errorBuilder: (context, error, stackTrace) =>
                  Icon(Icons.broken_image),
              fit: BoxFit.cover,
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              article.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  article.content.isNotEmpty
                      ? article.content
                      : 'No content available for this article', // Mostrar el contenido de la noticia o un mensaje por defecto
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
