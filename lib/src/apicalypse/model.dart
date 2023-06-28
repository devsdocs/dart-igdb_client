// ignore_for_file: constant_identifier_names

class APICalypse {
  String search = '';
  String fields = '';
  String exclude = '';
  String limit = '';
  String offset = '';
  String sort = '';
  String where = '';

  APICalypse buildSort(String field, Sort order) {
    sort = 's $field ${order.apiName};';
    return this;
  }

  APICalypse buildFields(String fields) {
    this.fields = 'f $fields;';
    return this;
  }

  APICalypse buildExclude(String fields) {
    exclude = 'x $fields;';
    return this;
  }

  APICalypse buildLimit(int limit) {
    this.limit = 'l $limit;';
    return this;
  }

  APICalypse buildOffset(int offset) {
    this.offset = 'o $offset;';
    return this;
  }

  APICalypse buildSearch(String searchQuery) {
    search = 'search "$searchQuery";';
    return this;
  }

  APICalypse buildWhere(String where) {
    if (where.contains('where ') || where.contains('w ')) {
      this.where = where;
    } else {
      if (where.contains(';')) {
        this.where = 'w $where';
      } else {
        this.where = 'w $where;';
      }
    }
    return this;
  }

  String buildQuery() {
    var query = '';
    if (search.isNotEmpty) query += search;
    if (fields.isNotEmpty) query += fields;
    if (exclude.isNotEmpty) query += exclude;
    if (limit.isNotEmpty) query += limit;
    if (offset.isNotEmpty) query += offset;
    if (sort.isNotEmpty) query += sort;
    if (where.isNotEmpty) query += where;

    return query;
  }
}

class Sort {
  const Sort(this.apiName);
  final String apiName;

  static const Sort ASCENDING = Sort('asc');
  static const Sort DESCENDING = Sort('desc');
}
