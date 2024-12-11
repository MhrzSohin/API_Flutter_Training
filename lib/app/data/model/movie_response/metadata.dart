import 'dart:convert';

import 'package:equatable/equatable.dart';

class Metadata extends Equatable {
	final String? currentPage;
	final int? perPage;
	final int? pageCount;
	final int? totalCount;

	const Metadata({
		this.currentPage, 
		this.perPage, 
		this.pageCount, 
		this.totalCount, 
	});

	factory Metadata.fromMap(Map<String, dynamic> data) => Metadata(
				currentPage: data['current_page'] as String?,
				perPage: data['per_page'] as int?,
				pageCount: data['page_count'] as int?,
				totalCount: data['total_count'] as int?,
			);

	Map<String, dynamic> toMap() => {
				'current_page': currentPage,
				'per_page': perPage,
				'page_count': pageCount,
				'total_count': totalCount,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Metadata].
	factory Metadata.fromJson(String data) {
		return Metadata.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Metadata] to a JSON string.
	String toJson() => json.encode(toMap());

	Metadata copyWith({
		String? currentPage,
		int? perPage,
		int? pageCount,
		int? totalCount,
	}) {
		return Metadata(
			currentPage: currentPage ?? this.currentPage,
			perPage: perPage ?? this.perPage,
			pageCount: pageCount ?? this.pageCount,
			totalCount: totalCount ?? this.totalCount,
		);
	}

	@override
	bool get stringify => true;

	@override
	List<Object?> get props {
		return [
				currentPage,
				perPage,
				pageCount,
				totalCount,
		];
	}
}
