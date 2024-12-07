import 'dart:convert';

import 'package:equatable/equatable.dart';

class CelebrityResponse extends Equatable {
	final String? name;
	final int? netWorth;
	final String? gender;
	final String? nationality;
	final List<String>? occupation;
	final double? height;
	final String? birthday;
	final int? age;
	final bool? isAlive;

	const CelebrityResponse({
		this.name, 
		this.netWorth, 
		this.gender, 
		this.nationality, 
		this.occupation, 
		this.height, 
		this.birthday, 
		this.age, 
		this.isAlive, 
	});

	factory CelebrityResponse.fromMap(Map<String, dynamic> data) {
		return CelebrityResponse(
			name: data['name'] as String?,
			netWorth: data['net_worth'] as int?,
			gender: data['gender'] as String?,
			nationality: data['nationality'] as String?,
			occupation: data['occupation'] as List<String>?,
			height: (data['height'] as num?)?.toDouble(),
			birthday: data['birthday'] as String?,
			age: data['age'] as int?,
			isAlive: data['is_alive'] as bool?,
		);
	}



	Map<String, dynamic> toMap() => {
				'name': name,
				'net_worth': netWorth,
				'gender': gender,
				'nationality': nationality,
				'occupation': occupation,
				'height': height,
				'birthday': birthday,
				'age': age,
				'is_alive': isAlive,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CelebrityResponse].
	factory CelebrityResponse.fromJson(String data) {
		return CelebrityResponse.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [CelebrityResponse] to a JSON string.
	String toJson() => json.encode(toMap());

	CelebrityResponse copyWith({
		String? name,
		int? netWorth,
		String? gender,
		String? nationality,
		List<String>? occupation,
		double? height,
		String? birthday,
		int? age,
		bool? isAlive,
	}) {
		return CelebrityResponse(
			name: name ?? this.name,
			netWorth: netWorth ?? this.netWorth,
			gender: gender ?? this.gender,
			nationality: nationality ?? this.nationality,
			occupation: occupation ?? this.occupation,
			height: height ?? this.height,
			birthday: birthday ?? this.birthday,
			age: age ?? this.age,
			isAlive: isAlive ?? this.isAlive,
		);
	}

	@override
	bool get stringify => true;

	@override
	List<Object?> get props {
		return [
				name,
				netWorth,
				gender,
				nationality,
				occupation,
				height,
				birthday,
				age,
				isAlive,
		];
	}
}
