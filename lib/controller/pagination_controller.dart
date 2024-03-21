class PaginationController {
  int _offset = 0;
  final int limit;
  bool hasMore = true;

  PaginationController({this.limit = 10});

  void reset() {
    _offset = 0;
    hasMore = true;
  }

  void updateOffset(int fetchedItems) {
    if (fetchedItems < limit) {
      hasMore = false;
    } else {
      _offset += fetchedItems;
    }
  }

  int get offset => _offset;
}
