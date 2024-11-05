import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'first.g.dart';

@JsonSerializable()
class First {
  int? userId;
  int? id;
  String? title;
  String? body;

  First({this.userId, this.id, this.title, this.body});

  @override
  String toString() {
    return 'First(userId: $userId, id: $id, title: $title, body: $body)';
  }

  factory First.fromJson(Map<String, dynamic> json) => _$FirstFromJson(json);

  Map<String, dynamic> toJson() => _$FirstToJson(this);

  First copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return First(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! First) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      userId.hashCode ^ id.hashCode ^ title.hashCode ^ body.hashCode;
}
