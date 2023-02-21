// ignore_for_file: non_constant_identifier_names

class MoviceItem {
  final Rating rating;

  final List pubdate;

  final String title;
  final String year;
  final String card_subtitle;
  final String id;

  final List genres;

  final List<ActorItem> actors;
  final String cover_url;

  MoviceItem({
    required this.rating,
    required this.pubdate,
    required this.title,
    required this.year,
    required this.card_subtitle,
    required this.id,
    required this.genres,
    required this.actors,
    required this.cover_url,
  });

  factory MoviceItem.fromJson(Map<String, dynamic> parsedJson) {
    return MoviceItem(
        rating: Rating.fromJson(parsedJson["rating"]),
        pubdate: (parsedJson["pubdate"] as List).map((e) => e).toList(),
        // pic: parsedJson["pic"],
        title:parsedJson["title"],
        year: parsedJson["year"],
        card_subtitle: parsedJson["card_subtitle"],
        id: parsedJson["id"],
        genres: (parsedJson["genres"] as List).map((e) => e).toList(),
        actors: (parsedJson["actors"] as List).map((e) => ActorItem.formJson(e)).toList(),
        cover_url: parsedJson["cover_url"]);
  }

  @override
  String toString() {
    return 'MoviceItem{rating: $rating, pubdate: $pubdate, year: $year, card_subtitle: $card_subtitle, id: $id, genres: $genres, actors: $actors, cover_url: $cover_url}';
  }
}

class Rating {
  final dynamic count;
  final dynamic max;
  final dynamic star_count;
  final dynamic value;

  Rating({required this.count, required this.max, required this.star_count, required this.value});

  factory Rating.fromJson(Map<String,dynamic> parsedJson) {
    return Rating(
      count: parsedJson["count"],
      max: parsedJson["max"],
      star_count: parsedJson["star_count"],
      value: parsedJson["value"],
    );
  }

  @override
  String toString() {
    return 'Rating{count: $count, max: $max, star_count: $star_count, value: $value}';
  }
}
class ActorItem {
  final String name;


  ActorItem(this.name);

  factory ActorItem.formJson(Map<String,dynamic> parsedJson){
    return ActorItem(parsedJson['name']);
  }

  @override
  String toString() {
    return 'ActorItem{name: $name}';
  }
}
