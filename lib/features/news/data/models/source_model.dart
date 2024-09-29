import 'package:newsapp/features/news/domain/entities/sources.dart';

///Represents a source of TopNewsModel
class SourceModel extends Source {
  ///Construcs a [SourceModel]
  const SourceModel({
    required super.id,
    required super.name,
  });

  ///Converts a json object to a [SourceModel]
  factory SourceModel.fromJson(Map<String, dynamic> json) => SourceModel(
        id: json['id'],
        name: json['name'],
      );
}
