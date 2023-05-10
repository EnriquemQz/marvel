// To parse this JSON data, do
//
//     final charactersModel = charactersModelFromJson(jsonString);

import 'dart:convert';

CharactersModel charactersModelFromJson(String str) => CharactersModel.fromJson(json.decode(str));

String charactersModelToJson(CharactersModel data) => json.encode(data.toJson());

class CharactersModel {
    final Data data;

    CharactersModel({
        required this.data,
    });

    factory CharactersModel.fromJson(Map<String, dynamic> json) => CharactersModel(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    final int offset;
    final int limit;
    final int total;
    final int count;
    final List<Char> results;

    Data({
        required this.offset,
        required this.limit,
        required this.total,
        required this.count,
        required this.results,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        offset: json["offset"],
        limit: json["limit"],
        total: json["total"],
        count: json["count"],
        results: List<Char>.from(json["results"].map((x) => Char.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "offset": offset,
        "limit": limit,
        "total": total,
        "count": count,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Char {
    final int id;
    final String name;
    final String description;
    final String modified;
    final Thumbnail thumbnail;

    Char({
        required this.id,
        required this.name,
        required this.description,
        required this.modified,
        required this.thumbnail,
    });

    factory Char.fromJson(Map<String, dynamic> json) => Char(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        modified: json["modified"],
        thumbnail: Thumbnail.fromJson(json["thumbnail"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "modified": modified,
        "thumbnail": thumbnail.toJson(),
    };
}

class Thumbnail {
    final String path;
    final String extension;

    Thumbnail({
        required this.path,
        required this.extension,
    });

    factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        path: json["path"],
        extension: json["extension"],
    );

    Map<String, dynamic> toJson() => {
        "path": path,
        "extension": extension,
    };

    String get fullUrl => '$path.$extension';
}
