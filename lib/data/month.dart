class Month {
  int month;
  final List<String> monthShortString = [
    "jan",
    "feb",
    "mar",
    "apr",
    "may",
    "jun",
    "jul",
    "aug",
    "sep",
    "oct",
    "nov",
    "dec"
  ];
  Month({required this.month});

  bool operator <(Month other) {
    return (month < other.month);
  }

  bool operator >(Month other) {
    return (month > other.month);
  }

  @override
  String toString() {
    return monthShortString[month];
  }
}
