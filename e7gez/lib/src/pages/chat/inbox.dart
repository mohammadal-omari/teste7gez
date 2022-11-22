import 'package:e7gez/src/models/chatUsers_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

enum MessageType {
   sender,
   receiver
}
class Inbox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {

  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello", messageType: MessageType.receiver.toString()),
    ChatMessage(messageContent: "hi", messageType: MessageType.sender.toString()),
    ChatMessage(messageContent: "sdfg", messageType: MessageType.receiver.toString()),
    ChatMessage(messageContent: "Hsdfello", messageType: MessageType.sender.toString()),
    ChatMessage(messageContent: "Helthrtlo", messageType: MessageType.receiver.toString()),
    ChatMessage(messageContent: "Hecllo", messageType: MessageType.sender.toString()),
    ChatMessage(messageContent: "Hesdfllo", messageType: MessageType.receiver.toString()),
    ChatMessage(messageContent: "Hesllo", messageType: MessageType.sender.toString()),

    ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF1EA955),
          leading: IconButton(
              onPressed: () => {Navigator.pop(context)},
              icon: const Icon(Icons.arrow_back)),
          title: Row(
            children: const [
               CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "MM",
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 10),
              child: Text("Mostafa", style: TextStyle(fontSize: 15)))
            ]
          ),
            actions:  <Widget>[
              Padding(padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(Icons.more_vert, size: 30.0),
                
              ),)

            ]
        ),
        body: Stack(children:<Widget> [
          ListView.builder(itemCount: messages.length,
           shrinkWrap: true,
           padding: EdgeInsets.only(top: 10, bottom: 10),
           physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) { 
              return Container(
                padding: const EdgeInsets.only(
                  left: 14, right: 14, top: 10, bottom: 10
                ),
                child: Align(alignment: 
                (messages[index].messageType == MessageType.receiver.toString()? Alignment.topLeft: Alignment.topRight),
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                  color: (messages[index].messageType == MessageType.receiver.toString()? Color(0xFF1EA955): Colors.grey.shade300)),
                   padding: const EdgeInsets.all(16),
                   child: Text(messages[index].messageContent, style: TextStyle(
                    fontSize: 13,
                    color: messages[index].messageType == MessageType.receiver.toString()? Colors.white: Colors.black),),
                  ),
                 
                  ),
              );
             },),
             Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.only(left: 10, bottom: 10.0, top: 10.0),
                height: 60,
                width: double.infinity,
                color: Colors.white,
                child: Row(children: <Widget>[
                  GestureDetector(
                    onTap: (() {
                      
                    }),
                    child: Container(height: 30,
                    width: 30,
                    decoration: BoxDecoration(color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(30)),
                    child: Icon(Icons.add,color: Colors.white, size: 20,) ,
                    ),
                  ),
                  Expanded(
                    child: TextField(decoration: InputDecoration(hintText: "Write a messag ...",
                    hintStyle: TextStyle(color: Colors.black54),
                    border: InputBorder.none)),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(onPressed: (){},
                  child: Icon(Icons.send, color: Colors.white, size: 18,),
                  backgroundColor: Color(0xFF1EA955),
                  elevation: 1,
                  )
                ]),
              ),
             )
        ]),
      ),
    );
  }
}
