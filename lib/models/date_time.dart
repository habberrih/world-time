class LocalDate {
  final String dateTime;
  final String offset;
  final String timeZone;

  LocalDate({
    required this.dateTime,
    required this.offset,
    required this.timeZone,
  });

  DateTime setTimeDate(dateTime) {
    return DateTime.parse(dateTime);
  }

  factory LocalDate.fromJson(Map<String, dynamic> json) => LocalDate(
      dateTime: json['datetime'],
      offset: json['utc_offset'],
      timeZone: json['timezone']);

  Map<String, dynamic> toJson() => {
        "datetime": dateTime,
        "utc_offset": offset,
        "timezone": timeZone,
      };
}
