import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';

const APP_ID = "148c5e6a45bf40f598b1f7824d75fea2";
const Token =
    "006148c5e6a45bf40f598b1f7824d75fea2IABfGgrLXg03XKJqe1n3F7QGRAB90Ghc6l7ylPF51Zri+dJjSIgAAAAAEACXhJCZo+GvYgEAAQCi4a9i";

class Call extends StatefulWidget {
  static const String routeName = "/call";
  @override
  State<Call> createState() => _CallState();
}

class _CallState extends State<Call> {
  final AgoraClient client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
        appId: "3d00d988d6de4c8fa5812d94fa581a08", channelName: "test"),
    enabledPermission: [Permission.camera, Permission.microphone],
  );

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  void initAgora() async {
    await client.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              AgoraVideoViewer(client: client),
              AgoraVideoButtons(client: client)
            ],
          ),
        ),
      ),
    );
  }
}
