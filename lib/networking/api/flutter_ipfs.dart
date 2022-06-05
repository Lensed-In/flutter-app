// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';



class FlutterIpfs{

  Future<String> uploadToIpfs(String json) async {
    try {

      final Directory directory = await getApplicationDocumentsDirectory();
      final File file = File('${directory.path}/my_file.json');
      await file.writeAsString(json);

      final bytes = file.readAsBytesSync();

      final response = await http.post(
        Uri.parse('https://api.nft.storage/upload'),
        headers: {
          'Authorization': 'Bearer $storageKey',
          'content-type': 'image/*'
        },
        body: bytes,
      );

      final data = jsonDecode(response.body);

      final cid = data['value']['cid'];

      debugPrint('CID OF IMAGE -> $cid');

      return cid;
    } catch (e) {
      debugPrint('Error at IPFS Service - uploadImage: $e');
      rethrow;
    }
  }
}

const storageKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkaWQ6ZXRocjoweDJkZDJiNDQ2NjA3NTYzZTQyRTkxN0E5NDQzN2E2NzA5OUM2ODA5NTQiLCJpc3MiOiJuZnQtc3RvcmFnZSIsImlhdCI6MTY1NDM3NTg5MTI1MCwibmFtZSI6IkpvYnMifQ.-A0LS5GRiymIuNC5CTyijhdOrIg6MB1vzV-Q0TlHrNI';