class NewsArticle {
  final String title;
  final String description;
  final String url;
  final String? imageUrl; 
  final String? author;
  final String? sourceName;
  final DateTime? publishedAt;

  NewsArticle({
    required this.title,
    required this.description,
    required this.url,
    this.imageUrl,
    this.author,
    this.sourceName,
    this.publishedAt,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'] ?? 'No title',
      description: json['description'] ?? 'No description',
      url: json['url'] ?? '',
      imageUrl: json['urlToImage'],
      author: json['author'],
      sourceName: json['source']['name'],
      publishedAt: json['publishedAt'] != null
          ? DateTime.parse(json['publishedAt'])
          : null,
    );
  }
}
