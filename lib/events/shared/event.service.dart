import 'package:http/http.dart' as http;
import 'event.model.dart';
import 'dart:convert';

class EventService {
  List<Event> parseEvents(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Event>((json) => Event.fromJson(json)).toList();
  }

  Future<List<Event>> getAll() async {
    final response = await http.get(
        Uri.http('10.0.2.2:8080', '/events'),
        headers: <String, String>{ "Accept": "application/vnd.api+json",
          "Content-Type": "text/html; charset=utf-8"}
    );

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      return parseEvents(body);
    } else {
      throw Exception('Failed to load events');
    }
  }

  Future<Event> getById(int id) async {
    final response = await http.get(
        Uri.http('10.0.2.2:8080', '/events/${id.toString()}'),
        headers: <String, String>{ "Accept": "application/vnd.api+json",
          "Content-Type": "text/html; charset=utf-8" }
    );

    if (response.statusCode == 200) {
      return Event.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load events');
    }
  }
}