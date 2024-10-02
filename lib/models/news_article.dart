class NewsArticle {
  final String title;
  final String imageUrl;
  final String url;
  final String content; // Nuevo campo para el contenido de la noticia

  NewsArticle({
    required this.title,
    required this.imageUrl,
    required this.url,
    required this.content, // Asegúrate de que este campo sea requerido
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'],
      imageUrl: json['urlToImage'] ?? '',
      url: json['url'],
      content: json['content'] ?? 'No content available', // Asigna el contenido o un valor por defecto
    );
  }
}
