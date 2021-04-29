class Pagination {
  Pagination({
    this.total,
    this.hasNextPage ,
  });

  final int total;
  final bool hasNextPage;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    total: json["total"],
    hasNextPage: json["has_next_page"] ==  null ? false: json["has_next_page"] ,
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "has_next_page": hasNextPage,
  };
}