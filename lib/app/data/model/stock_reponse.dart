import 'dart:convert';

import 'package:equatable/equatable.dart';

class StockReponse extends Equatable {
	final String? ticker;
	final String? name;
	final double? price;
	final String? exchange;
	final int? updated;
	final String? currency;

	const StockReponse({
		this.ticker, 
		this.name, 
		this.price, 
		this.exchange, 
		this.updated, 
		this.currency, 
	});

	factory StockReponse.fromMap(Map<String, dynamic> data) => StockReponse(
				ticker: data['ticker'] as String?,
				name: data['name'] as String?,
				price: (data['price'] as num?)?.toDouble(),
				exchange: data['exchange'] as String?,
				updated: data['updated'] as int?,
				currency: data['currency'] as String?,
			);

	Map<String, dynamic> toMap() => {
				'ticker': ticker,
				'name': name,
				'price': price,
				'exchange': exchange,
				'updated': updated,
				'currency': currency,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [StockReponse].
	factory StockReponse.fromJson(String data) {
		return StockReponse.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [StockReponse] to a JSON string.
	String toJson() => json.encode(toMap());

	StockReponse copyWith({
		String? ticker,
		String? name,
		double? price,
		String? exchange,
		int? updated,
		String? currency,
	}) {
		return StockReponse(
			ticker: ticker ?? this.ticker,
			name: name ?? this.name,
			price: price ?? this.price,
			exchange: exchange ?? this.exchange,
			updated: updated ?? this.updated,
			currency: currency ?? this.currency,
		);
	}

	@override
	bool get stringify => true;

	@override
	List<Object?> get props {
		return [
				ticker,
				name,
				price,
				exchange,
				updated,
				currency,
		];
	}
}
