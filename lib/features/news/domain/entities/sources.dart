import 'package:equatable/equatable.dart';

///Represents a source of article
class Source extends Equatable {

  ///Constructs of [Source]
  const Source({
    required this.id,
    required this.name,
  });
  /// The id of source
  final String id;

  ///The name of source
  final String name;

  @override
  List<Object?> get props => [id, name];
}
