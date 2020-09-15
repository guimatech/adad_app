class Event {
  final int id;
  final String description;
  final DateTime date;

  Event({this.id, this.description, this.date});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      description: json['description'],
      date: DateTime.parse(json['date'])
    );
  }
}