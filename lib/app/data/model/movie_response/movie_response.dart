import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'datum.dart';
import 'metadata.dart';

class MovieResponse extends Equatable {
	final List<Datum>? data;
	final Metadata? metadata;

	const MovieResponse({this.data, this.metadata});

	factory MovieResponse.fromMap(Map<String, dynamic> data) => MovieResponse(
				data: (data['data'] as List<dynamic>?)
						?.map((e) => Datum.fromMap(e as Map<String, dynamic>))
						.toList(),
				metadata: data['metadata'] == null
						? null
						: Metadata.fromMap(data['metadata'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toMap() => {
				'data': data?.map((e) => e.toMap()).toList(),
				'metadata': metadata?.toMap(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MovieResponse].
	factory MovieResponse.fromJson(String data) {
		return MovieResponse.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [MovieResponse] to a JSON string.
	String toJson() => json.encode(toMap());

	MovieResponse copyWith({
		List<Datum>? data,
		Metadata? metadata,
	}) {
		return MovieResponse(
			data: data ?? this.data,
			metadata: metadata ?? this.metadata,
		);
	}

	@override
	bool get stringify => true;

	@override
	List<Object?> get props => [data, metadata];
}
