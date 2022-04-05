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

    String json =
        '[{"id": "20e71e86-53e3-4682-99c2-4fa2c78ebaf9","name": "Demo Restaurant botanica MENU","restaurantId": "446df011-9ae6-41a1-a512-d6ea8572bb3b","items": []},{ "id": "441f7931-174c-4f60-a1bb-00676b5d45b4", "name": "Demo PUB centru MENU", "restaurantId": "22908cb2-55f8-49bd-a67f-0b35aff6bf53", "items": [] }]';

    var parsedList = jsonDecode(json);

    var menuObject = parsedList
        .map<MenuDto>((listItem) => MenuDto.fromJson(listItem))
        .toList();

    List<MenuDto> menuListA = [];

    // dynamic a = {
    //   "name": "Demo Restaurant botanica MENU",
    //   "restaurantId": "446df011-9ae6-41a1-a512-d6ea8572bb3b",
    //   "items": []
    // };

    // var parsedOriginal = a.cast.cast<Map<String, dynamic>>();

    // var FinalParsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

    // List<MenuDto> menuListA = [];
    // for (var i = 0; i < parsed.length; i++) {
    //   var menuItme = MenuDto.fromJson(parsed[i]);
    //   menuListA.add(menuItme);
    // }

    // final menuListB =
    //     parsed.map<MenuDto>((json) => MenuDto.fromJson(json)).toList();

    return menuListA;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
