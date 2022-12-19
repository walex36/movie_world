extension DurationExtension on Duration {
  String secondsToHour() {
    List<String> parts = toString().split(':');
    return '${parts[1].padLeft(2, '0')}h ${parts[2].padLeft(2, '0').substring(0, 2)}m';
  }
}
