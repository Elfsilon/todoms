import 'package:json_annotation/json_annotation.dart';
import 'package:todoms/shared/interfaces/common.dart';

part 'collection.g.dart';

@JsonSerializable()
class Collection implements Serializable {
  Collection({
    required this.id,
    required this.title,
    required this.deadline,
  });

  final int id;
  String title;
  DateTime deadline;

  Collection build() => Collection(
    id: id, 
    title: title,
    deadline: deadline,
  );

  factory Collection.fromJson(Map<String, dynamic> map) => _$CollectionFromJson(map);

  @override
  Map<String, dynamic> toJson() => _$CollectionToJson(this);
}