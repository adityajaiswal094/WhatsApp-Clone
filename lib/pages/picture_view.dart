import 'dart:io';

import 'package:flutter/material.dart';

class PictureViewPage extends StatelessWidget {
  const PictureViewPage({Key? key, required this.path}) : super(key: key);
  final String path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.crop_rotate)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.emoji_emotions_outlined)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.title)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit_outlined)),
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 150,
              child: Image.file(
                File(path),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 5,
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 50,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: TextFormField(
                    maxLines: 5,
                    minLines: 1,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.photo_library)),
                      hintText: "Add a caption...",
                    ),
                  ),
                ),
              ),
            ),
            const Positioned(
              bottom: 9,
              right: 4,
              child: CircleAvatar(
                radius: 24,
                backgroundColor: Colors.blueGrey,
                child: Icon(
                  Icons.done,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
