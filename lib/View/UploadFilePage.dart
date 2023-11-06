import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../Utils.dart';

class UploadFilePage extends StatefulWidget {
  // variables defined for the class
  final File? imageFile;
  final bool imageEditStack;
  final bool toShowImage;
  final String coverPhoto;

  const UploadFilePage(
      {super.key,
      this.imageFile,
      required this.imageEditStack,
      required this.toShowImage,
      required this.coverPhoto});

  @override
  State<UploadFilePage> createState() => _UploadFilePageState();
}

class _UploadFilePageState extends State<UploadFilePage> {
  @override
  Widget build(BuildContext context) {
    File? image = widget.imageFile;
    bool toShowImage = widget.toShowImage;
    bool imageEditStack = widget.imageEditStack;
    String coverPhoto = widget.coverPhoto;

    return SafeArea(
        child: Stack(children: [
      Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xff939091),
              weight: 20,
            ),
            onPressed: () => exit(0),
          ),
          backgroundColor: Colors.white,
          title: const Center(
              child: Text("Add Image / Icon ",
                  style: TextStyle(
                      color: Color(
                          0xff939091)))),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // The container to select the image.
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "Upload Image",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                          fontStyle: FontStyle.italic),
                    ),
                    GestureDetector(
                      onTap: () async {
                        File? file = await Utils.getImage();
                        File cropedImage = await Utils.cropImage(file!);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UploadFilePage(
                                      imageFile: cropedImage,
                                      toShowImage: false,
                                      imageEditStack: true,
                                      coverPhoto: "None",
                                    )));
                      },
                      child: Container(
                        color: const Color(0xff068277),
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                          child: Text(
                            "Choose from Device",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                child: toShowImage
                    ? Stack(children: [
                        Image.file(image!, fit: BoxFit.fill),
                        Image.asset(
                          "assets/${Utils.coverPhoto}.png",
                          fit: BoxFit.fill,
                        )
                      ])
                    : Container(),
              )
            ],
          ),
        ),
      ),
      if (imageEditStack)
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black.withOpacity(0.5),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 210, 20, 210),
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UploadFilePage(
                                            imageFile: image,
                                            toShowImage: false,
                                            imageEditStack: false,
                                            coverPhoto: "None",
                                          )));
                            },
                            child: const Icon(Icons.clear)),
                      ],
                    ),
                    const Text(
                      "Uploaded Image",
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 20,
                        color: Color(0xff939091),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        height: 220,
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Stack(alignment: Alignment.center, children: [
                          Image.file(
                            image!,
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            "assets/${Utils.coverPhoto}.png",
                            fit: BoxFit.cover,
                          ),
                        ])),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          // Original
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                Utils.coverPhoto = "None";
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.grey),
                              ),
                              height: 50,
                              width: 70,
                              child: const Center(
                                  child: Text(
                                "Original",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey,
                                    decoration: TextDecoration.none),
                              )),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          // heart
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                Utils.coverPhoto = "heart";
                                print(Utils.coverPhoto);
                              });
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.grey),
                                ),
                                height: 50,
                                width: 50,
                                child: Image.asset("assets/heartIcon.png")),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          // square
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                Utils.coverPhoto = "square";
                                print(Utils.coverPhoto);
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.grey),
                              ),
                              height: 50,
                              width: 50,
                              child: Image.asset("assets/squareIcon.png"),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          // circle
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                Utils.coverPhoto = "circle";
                                print(Utils.coverPhoto);
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.grey),
                              ),
                              height: 50,
                              width: 50,
                              child: Image.asset(
                                "assets/circleIcon.png",
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          // ractangle
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                Utils.coverPhoto = "ractangle";
                                print(Utils.coverPhoto);
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.grey),
                              ),
                              height: 50,
                              width: 50,
                              child: Image.asset("assets/ractangleIcon.png"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UploadFilePage(
                                    imageFile: image,
                                    toShowImage: true,
                                    imageEditStack: false,
                                    coverPhoto: Utils.coverPhoto)));
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xff068277),
                          ),
                          height: 30,
                          width: MediaQuery.of(context).size.width,
                          child: const Center(
                            child: Text(
                              "Use this Image ",
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 15,
                                  color: Colors.white),
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
    ]));
  }
}
