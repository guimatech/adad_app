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
      'http://10.0.2.2:3000/events',
      headers: <String, String>{ "Accept": "application/vnd.api+json"  }
    );

    if (response.statusCode == 200) {
      return parseEvents(response.body);
    } else {
      throw Exception('Failed to load events');
    }
  }

  Future<Event> getById(int id) async {
    final response = await http.get(
        "http://10.0.2.2:3000/events/${id.toString()}",
        headers: <String, String>{ "Accept": "application/vnd.api+json"  }
    );

    if (response.statusCode == 200) {
      return Event.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load events');
    }
  }
}