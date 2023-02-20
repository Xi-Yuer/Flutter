// ignore_for_file: non_constant_identifier_names

class MoviceItem {
  final Map<String, dynamic> rating;

  final List pubdate;

  // final Map<String, String> pic;
  final String year;
  final String card_subtitle;
  final String id;

  final List genres;

  // final List<dynamic> actors;
  final String cover_url;

  MoviceItem({
    required this.rating,
    required this.pubdate,
    // required this.pic,
    required this.year,
    required this.card_subtitle,
    required this.id,
    required this.genres,
    // required this.actors,
    required this.cover_url,
  });

  factory MoviceItem.fromJson(Map<String, dynamic> parsedJson) {
    return MoviceItem(
        rating: (parsedJson["rating"]),
        pubdate: (parsedJson["pubdate"] as List).map((e) => e).toList(),
        // pic: parsedJson["pic"],
        year: parsedJson["year"],
        card_subtitle: parsedJson["card_subtitle"],
        id: parsedJson["id"],
        genres: (parsedJson["genres"] as List).map((e) => e).toList(),
        // actors: parsedJson["actors"],
        cover_url: parsedJson["cover_url"]);
  }

  @override
  String toString() {
    return 'MoviceItem{rating: $rating, pubdate: $pubdate, year: $year, card_subtitle: $card_subtitle, id: $id, genres: $genres, cover_url: $cover_url}';
  }
}

class Rating {
  final double count;
  final double max;
  final double star_count;
  final double value;

  Rating({required this.count, required this.max, required this.star_count, required this.value});

  factory Rating.fromJson(Map<String, dynamic> parsedJson) {
    return Rating(
      count: parsedJson["count"],
      max: parsedJson["max"],
      star_count: parsedJson["star_count"],
      value: parsedJson["value"],
    );
  }
}
