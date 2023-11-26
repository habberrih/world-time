class LocalDate {
  final String dateTime;
  final String offset;

  LocalDate({
    required this.dateTime,
    required this.offset,
  });

  DateTime setTimeDate(dateTime) {
    return DateTime.parse(dateTime);
  }

  factory LocalDate.fromJson(Map<String, dynamic> json) => LocalDate(
        dateTime: json['datetime'],
        offset: json['utc_offset'],
      );

  Map<String, dynamic> toJson() => {
        "datetime": dateTime,
        "utc_offset": offset,
      };
}
