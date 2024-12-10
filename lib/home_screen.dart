// ignore_for_file: unnecessary_null_comparison, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String Img = "";

  FetchDogImage() async {
    const url = "https://dog.ceo/api/breeds/image/random";
    final responce = await http.get(Uri.parse(url));
    //print(responce.body);
    if (responce.statusCode == 200) {
      final data = jsonDecode(responce.body);
      setState(() {
        Img = data["message"];
      });
      //print(Img);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black12,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Img == null
                ? Container(
                    width: 300,
                    height: 100,
                    color: Colors.black12,
                    child: const Center(
                      child: Text("No image"),
                    ),
                  )
                : Container(
                    width: 300,
                    height: 250,
                    color: Colors.black12,
                    child: Image(
                      image: NetworkImage(Img),
                    ),
                  ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                FetchDogImage();
              },
              child: const Text("NEXT"),
            ),
          ],
        ),
      ),
    );
  }
}
