
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/news_article.dart';

class NewsService {
  final String apiKey = '1bb366d683604adcb97fcd3d64506a9a';
  final String apiUrl = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=';

  Future<List<NewsArticle>> fetchNewsArticles() async {
    final response = await http.get(Uri.parse('$apiUrl$apiKey'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List articles = data['articles'];
      return articles.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}
