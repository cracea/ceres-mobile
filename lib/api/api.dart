import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ceres/api/dtos/menu_dto.dart';
import 'package:flutter/material.dart';

class Apis {
  static const String users = "/users";
}

Future<List<MenuDto>> fetchMenues() async {
  final response = await http
      .get(Uri.parse('https://ceres-api.azurewebsites.net/api/menu/all'));

  log('data: $response');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
    final menuList =
        parsed.map<MenuDto>((json) => MenuDto.fromJson(json)).toList();
    return menuList;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
