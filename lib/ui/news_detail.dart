import 'package:flutter/material.dart';
import '../models/news_article.dart';
import 'package:intl/intl.dart';

class NewsDetailScreen extends StatelessWidget {
  final NewsArticle article;

  const NewsDetailScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    String formattedDate = article.publishedAt != null
        ? DateFormat('yyyy-MM-dd – kk:mm').format(article.publishedAt!)
        : 'Unknown date';

    return Scaffold(
      appBar: AppBar(
        title: const Text('El Beber'),
        backgroundColor: const Color(0xFF4673B8),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            article.imageUrl != null && article.imageUrl!.isNotEmpty
                ? Image.network(
                    article.imageUrl!,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.broken_image),
                    fit: BoxFit.cover,
                  )
                : const Icon(
                    Icons.image_not_supported,
                    size: 100,
                  ),
            const SizedBox(height: 20),
            Text(
              article.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text('By ${article.author ?? 'Unknown author'}'),
            const SizedBox(height: 5),
            Text('Source: ${article.sourceName ?? 'Unknown source'}'),
            const SizedBox(height: 5),
            Text('Published: $formattedDate'),
            const SizedBox(height: 20),
            Text(
              article.description,
              style: const TextStyle(fontSize: 18), // Aumentar tamaño del texto
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
