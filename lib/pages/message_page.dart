import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whatsapp/model/chat.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key, required this.chatModel}) : super(key: key);
  final ChatModel chatModel;

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  bool showEmoji = false;
  FocusNode focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        showEmoji = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[200],
      appBar: AppBar(
        titleSpacing: 0,
        leadingWidth: 65,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(Icons.arrow_back),
              CircleAvatar(
                radius: 18,
                child: SvgPicture.asset(
                  widget.chatModel.isGroup
                      ? "assets/groups.svg"
                      : "assets/person.svg",
                  color: Colors.white,
                  height: 27,
                  width: 27,
                ),
                backgroundColor: Colors.grey,
              )
            ],
          ),
        ),
        title: Container(
          margin: const EdgeInsets.all(6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.chatModel.name,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Text(
                "last seen at 12:00",
                style: TextStyle(fontSize: 13),
              )
            ],
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.videocam_rounded)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PopupMenuButton<String>(
              onSelected: (value) {
                debugPrint(value);
              },
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem(
                    child: Text("View Contact"),
                    value: "View Contact",
                  ),
                  const PopupMenuItem(
                    child: Text("Media, links, and docs"),
                    value: "Media, links, and docs",
                  ),
                  const PopupMenuItem(
                    child: Text("Search"),
                    value: "Search",
                  ),
                  const PopupMenuItem(
                    child: Text("Mute Notifications"),
                    value: "Mute Notifications",
                  ),
                  const PopupMenuItem(
                    child: Text("Wallpaper"),
                    value: "Wallpaper",
                  ),
                  const PopupMenuItem(
                    child: Text("More"),
                    value: "More",
                  ),
                ];
              },
              child: const Icon(Icons.more_vert),
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WillPopScope(
          child: Stack(
            children: [
              ListView(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width - 60,
                            child: Card(
                                margin: const EdgeInsets.only(
                                    left: 2, right: 2, bottom: 8),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                child: TextFormField(
                                  controller: _controller,
                                  focusNode: focusNode,
                                  textAlignVertical: TextAlignVertical.center,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 5,
                                  minLines: 1,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Type a message",
                                      prefixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              focusNode.unfocus();
                                              focusNode.canRequestFocus = false;
                                              showEmoji = !showEmoji;
                                            });
                                          },
                                          icon: const Icon(
                                              Icons.emoji_emotions_outlined)),
                                      suffixIcon: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                showModalBottomSheet(
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    context: context,
                                                    builder: (builder) =>
                                                        attachMenu());
                                              },
                                              icon: const Icon(
                                                  Icons.attach_file)),
                                          IconButton(
                                              onPressed: () {},
                                              icon:
                                                  const Icon(Icons.camera_alt))
                                        ],
                                      ),
                                      contentPadding: const EdgeInsets.all(5)),
                                ))),
                        Padding(
                            padding: const EdgeInsets.only(right: 2, bottom: 8),
                            child: CircleAvatar(
                              radius: 24,
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.mic,
                                    color: Colors.white,
                                  )),
                            ))
                      ],
                    ),
                    // showEmoji ? emojiSelect() : Container(),
                  ],
                ),
              )
            ],
          ),
          onWillPop: () {
            if (showEmoji) {
              setState(() {
                showEmoji = false;
              });
            } else {
              Navigator.pop(context);
            }
            return Future.value(false);
          },
        ),
      ),
    );
  }

  Widget emojiSelect() {
    return EmojiPicker(
        config: const Config(
          columns: 7,
        ),
        onEmojiSelected: (emoji, category) {
          // ignore: avoid_print
          print(emoji);
          setState(() {
            _controller.text = _controller.text + emoji.toString();
          });
        });
  }

  Widget attachmentIcons(IconData icon, Color color, String text) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(
              icon,
              size: 29,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 13, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget attachMenu() {
    return SizedBox(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  attachmentIcons(
                      Icons.insert_drive_file, Colors.indigo, "Document"),
                  const SizedBox(
                    width: 40,
                  ),
                  attachmentIcons(Icons.camera_alt, Colors.pink, "Camera"),
                  const SizedBox(
                    width: 40,
                  ),
                  attachmentIcons(Icons.insert_photo, Colors.purple, "Gallery"),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  attachmentIcons(
                      Icons.headphones_rounded, Colors.orange, "Audio"),
                  const SizedBox(
                    width: 40,
                  ),
                  attachmentIcons(Icons.location_pin, Colors.pink, "Location"),
                  const SizedBox(
                    width: 40,
                  ),
                  attachmentIcons(Icons.person, Colors.lightBlue, "Contact"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
