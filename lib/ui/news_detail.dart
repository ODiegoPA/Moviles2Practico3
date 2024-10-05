import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; 
import 'package:intl/intl.dart';
import '../models/news_article.dart';

class NewsDetailScreen extends StatelessWidget {
  final NewsArticle article;

  const NewsDetailScreen({super.key, required this.article});

  
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url); 
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

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
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            
            GestureDetector(
              onTap: () {
                _launchURL(article.url);
              },
              child: const Text(
                'Leer Articulo CompletoQ',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
