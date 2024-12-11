import 'dart:convert';

import 'package:equatable/equatable.dart';

class Datum extends Equatable {
	final int? id;
	final String? title;
	final String? poster;
	final String? year;
	final String? country;
	final String? imdbRating;
	final List<String>? genres;
	final List<String>? images;

	const Datum({
		this.id, 
		this.title, 
		this.poster, 
		this.year, 
		this.country, 
		this.imdbRating, 
		this.genres, 
		this.images, 
	});

	factory Datum.fromMap(Map<String, dynamic> data) => Datum(
				id: data['id'] as int?,
				title: data['title'] as String?,
				poster: data['poster'] as String?,
				year: data['year'] as String?,
				country: data['country'] as String?,
				imdbRating: data['imdb_rating'] as String?,
				genres: (data['genres'] as List<dynamic>?)?.map((e) => e.toString()).toList(),
				images: (data['images'] as List<dynamic>?)?.map((e) => e.toString()).toList(),
			);

	Map<String, dynamic> toMap() => {
				'id': id,
				'title': title,
				'poster': poster,
				'year': year,
				'country': country,
				'imdb_rating': imdbRating,
				'genres': genres,
				'images': images,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datum].
	factory Datum.fromJson(String data) {
		return Datum.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Datum] to a JSON string.
	String toJson() => json.encode(toMap());

	Datum copyWith({
		int? id,
		String? title,
		String? poster,
		String? year,
		String? country,
		String? imdbRating,
		List<String>? genres,
		List<String>? images,
	}) {
		return Datum(
			id: id ?? this.id,
			title: title ?? this.title,
			poster: poster ?? this.poster,
			year: year ?? this.year,
			country: country ?? this.country,
			imdbRating: imdbRating ?? this.imdbRating,
			genres: genres ?? this.genres,
			images: images ?? this.images,
		);
	}

	@override
	bool get stringify => true;

	@override
	List<Object?> get props {
		return [
				id,
				title,
				poster,
				year,
				country,
				imdbRating,
				genres,
				images,
		];
	}
}
