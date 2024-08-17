class Pagination {
  int? limit;
  int? offset;
  int? count;
  int? total;

  Pagination({this.limit, this.offset, this.count, this.total});

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        limit: json['limit'] as int?,
        offset: json['offset'] as int?,
        count: json['count'] as int?,
        total: json['total'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'limit': limit,
        'offset': offset,
        'count': count,
        'total': total,
      };
}
