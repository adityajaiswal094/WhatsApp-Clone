class ChatModel {
  String name;
  bool isGroup;
  String message;
  String time;
  String status;
  String avatar;
  bool selected;

  ChatModel(
      {this.name = "",
      this.isGroup = false,
      this.message = "",
      this.time = "",
      this.status = "",
      this.avatar = "",
      this.selected = false});
}

List<ChatModel> chats = [
  ChatModel(
      name: "Aditya Jaiswal",
      isGroup: false,
      message: "You're late for work again!",
      time: "9:10",
      avatar: "assets/person.svg"),
  ChatModel(
      name: "Jayant Jaiswal",
      isGroup: false,
      message: "Deadline extended. Wohoo!",
      time: "13:00",
      avatar: "assets/person.svg"),
  ChatModel(
      name: "Rohit Jaiswal",
      isGroup: false,
      message: "I am in Kolkata.",
      time: "17:30",
      avatar: "assets/person.svg"),
  ChatModel(
      name: "Barry Allen",
      isGroup: false,
      message: "I am the fastest man alive!",
      time: "15:00",
      avatar: "assets/person.svg"),
  ChatModel(
      name: "Savitar",
      isGroup: false,
      message: "But only in the finale of the season. LOL.",
      time: "15:02",
      avatar: "assets/person.svg"),
  ChatModel(
      name: "Reversh Flash",
      isGroup: false,
      message: "What you doing Barry. Noob.",
      time: "15:10",
      avatar: "assets/person.svg"),
  ChatModel(
      name: "Iris West",
      isGroup: false,
      message: "I know I'm useless. Please don't hate me ;(",
      time: "9:10",
      avatar: "assets/person.svg"),
  ChatModel(
      name: "Cisco Ramon",
      isGroup: false,
      message: "I can make any tech as long as I have plot armor.",
      time: "12:45",
      avatar: "assets/person.svg"),
  ChatModel(
      name: "Caitlin Snow",
      isGroup: false,
      message: "I have powers too.",
      time: "9:10",
      avatar: "assets/person.svg"),
  ChatModel(
      name: "CSE-A",
      isGroup: true,
      message: "No class today.",
      time: "9:10",
      avatar: "assets/groups.svg"),
];
