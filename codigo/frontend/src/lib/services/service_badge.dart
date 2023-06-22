import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  badgeToUserById("0398d834-34a0-43c3-91d3-3407d94f054b", "11979e28-cb70-4523-9097-8b484ebed91c");
}

const String baseUrl = "http://load-novo-336193150.us-east-1.elb.amazonaws.com";

Future<void> badgeToUserById(String badge, String userId) async{
  try {
    var url = Uri.parse("$baseUrl/user/$userId");
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      "badges": {
        "connect": [
          {
            "id": badge
          }
        ]
      }
    });

    var response = await http.patch(url, headers: headers, body: body);

    if (response.statusCode == 200 || response.statusCode == 201) {
    } else {
      throw Exception(
          "Failed to include badge. Status code: ${response.statusCode}");
    }
  } catch (e) {
    throw Exception("Failed to include badge: $e");
  }
}