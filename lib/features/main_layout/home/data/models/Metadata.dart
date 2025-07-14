class Metadata {
  final num currentPage;
  final num numberOfPages;
  final num limit;

  Metadata({
    required this.currentPage,
    required this.numberOfPages,
    required this.limit,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return Metadata(
      currentPage: json['currentPage'] as num,
      numberOfPages: json['numberOfPages'] as num,
      limit: json['limit'] as num,
    );
  }

}