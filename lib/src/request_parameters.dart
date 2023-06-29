class IGDBRequestParameters {
  // https://api-docs.igdb.com/#pagination

  const IGDBRequestParameters({
    this.where,
    this.fields,
    this.limit,
    this.sort,
    this.search,
    this.exclude,
    this.offset,
    this.ids,
  });
  final String? where; // https://api-docs.igdb.com/#filters
  final List<String>? exclude;
  final List<int>? ids;
  final List<String>? fields;
  final int? limit;
  final String? sort; // https://api-docs.igdb.com/#sorting
  final String? search;
  final int? offset;

  IGDBRequestParameters copyWith({
    String? where,
    List<String>? fields,
    int? limit,
    List<String>? exclude,
    String? sort,
    String? search,
    int? offset,
    List<int>? ids,
  }) {
    return IGDBRequestParameters(
      where: where ?? this.where,
      fields: fields ?? this.fields,
      ids: ids ?? this.ids,
      exclude: exclude ?? this.exclude,
      limit: limit ?? this.limit,
      sort: sort ?? this.sort,
      search: search ?? this.search,
      offset: offset ?? this.offset,
    );
  }

  String toBody() {
    String result = '';

    if (search != null && search != '') {
      result += 'search "$search";';
    }

    if (fields != null && fields!.isNotEmpty) {
      result += 'f ${fields!.join(',')};';
    } else {
      result += 'f *;';
    }

    if (ids != null && ids!.isNotEmpty) {
      result += 'w id = (${ids!.join(',')});';
    }

    if (exclude != null && exclude!.isNotEmpty) {
      result += 'x ${exclude!.join(',')};';
    }

    if (where != null && where!.isNotEmpty) {
      result += 'w $where;';
    }

    if (sort != null && sort != '') {
      result += 's $sort;';
    }

    if (limit != null && limit! > 0) {
      result += 'l $limit;';
    }

    if (offset != null && offset! > 0) {
      result += 'o $offset;';
    }

    return result;
  }
}

class Sort {
  const Sort(this.apiName);

  final String apiName;

  static const Sort ascending = Sort('asc');
  static const Sort descending = Sort('desc');

  @override
  String toString() {
    return apiName;
  }
}
