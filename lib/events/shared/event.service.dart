import 'package:http/http.dart' as http;
import 'event.model.dart';
import 'dart:convert';

class EventService {
  List<Event> parseEvents(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Event>((json) => Event.fromJson(json)).toList();
  }

  Future<List<Event>> getAll() async {
    final response = await http.get(Uri.http('10.0.2.2:8080', '/events'));

    if (response.statusCode != 200)
      throw Exception('Failed to load events');

    return parseEvents(utf8.decode(response.bodyBytes));
  }

  Future<Event> getById(int id) async {
    final response = await http.get(
        Uri.http('10.0.2.2:8080', '/events/${id.toString()}')
    );

    if (response.statusCode != 200)
      throw Exception('Failed to load events');

    return Event.fromJson(json.decode(utf8.decode(response.bodyBytes)));
  }

  Future<Event> getLast() async {
    final response = await http.get(Uri.http('10.0.2.2:8080', '/eventlast'));

    if (response.statusCode != 200)
      throw Exception('Failed to load events');

    return Event.fromJson(json.decode(utf8.decode(response.bodyBytes)));
  }
}