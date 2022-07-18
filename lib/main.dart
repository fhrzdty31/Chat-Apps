import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var faker = Faker();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chat app",
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Chat App"),
            bottom: TabBar(
              tabs: myTab,
              indicatorWeight: 4.5,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
            ),
          ),
          body: TabBarView(
            children: [
              ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return ChatItem(
                      imgUrl: "https://picsum.photos/id/$index/200/300",
                      title: faker.person.name(),
                      subtitle: faker.lorem.sentence());
                },
              ),
              ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return GroupItem(
                      imgUrl: "https://picsum.photos/id/2$index/200/300",
                      title: faker.person.name(),
                      subtitle: faker.lorem.sentence());
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Tab> myTab = [
    const Tab(
      icon: Icon(Icons.chat),
      text: "Chat",
    ),
    const Tab(
      icon: Icon(Icons.group),
      text: "Group",
    )
  ];
}

class ChatItem extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String subtitle;

  const ChatItem(
      {Key? key,
      required this.imgUrl,
      required this.title,
      required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imgUrl),
        ),
        title: Text(title),
        subtitle: Text(
          subtitle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Text(
          DateFormat.Hm().format(DateTime.now()),
        ));
  }
}

class GroupItem extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String subtitle;

  const GroupItem(
      {Key? key,
      required this.imgUrl,
      required this.title,
      required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imgUrl),
        ),
        title: Text(title),
        subtitle: Text(
          "Name : $subtitle",
          maxLines: 1,
          overflow: TextOverflow.ellipsis
        ),
        trailing: Text(
          DateFormat.jm().format(DateTime.now()),
        ));
  }
}
