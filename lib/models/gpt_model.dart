class GPTModel {
  final String id;
  final String object;
  final int? created;
  final String ownedBy;
  final String root;

  GPTModel({
    required this.id,
    required this.object,
    required this.created,
    required this.ownedBy,
    required this.root,
  });

  factory GPTModel.fromJson(Map<String, dynamic> json) => GPTModel(
        id: (json['id'] ?? '') as String,
        object: (json['object'] ?? '') as String,
        created: json['created'] as int?,
        ownedBy: (json['ownedBy'] ?? '') as String,
        root: (json['root'] ?? '') as String,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['object'] = object;
    data['created'] = created;
    data['owned_by'] = ownedBy;
    data['root'] = root;
    return data;
  }

  static List<GPTModel> formJsonList(Iterable jsons) => jsons
      .map(
        (m) => GPTModel.fromJson(m),
      )
      .toList();
}
