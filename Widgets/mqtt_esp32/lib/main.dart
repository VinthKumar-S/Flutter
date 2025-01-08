import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart' as mqtt;
import 'package:mqtt_client/mqtt_server_client.dart';

void main() => runApp(MaterialApp(home: MqttApp(),));

class MqttApp extends StatefulWidget {
  const MqttApp({super.key});

  @override
  State<MqttApp> createState() => _MqttAppState();
}


class _MqttAppState extends State<MqttApp> {
   
   late MqttServerClient client;
   final String broker = 'c3bd32745792416a9930ecc733eff6c7.s1.eu.hivemq.cloud';
   final String clientId = 'flutter_client';
   final String username ='Vinithkumar';
   final String password= 'Vini2002';
   final String topic = 'from/esp32';
   String receivedMessage ='';

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    client = MqttServerClient(broker, clientId);
    client.port = 8883;
    client.secure = true;
    client.setProtocolV31();
   // client.onDisconnected = onDisconnected;

    connect();
  }

    Future<void> connect() async {
        try{
            await client.connect(username, password);
            print('Connected to the broker');
            subscribeToTopic();
        }catch(e){
            print('Connection failed: $e');
            client.disconnect();
        }
    }

    void publishMessage(){
        final builder = mqtt.MqttClientPayloadBuilder();
        builder.addString('Hello from Flutter');
        client.publishMessage(topic, mqtt.MqttQos.atLeastOnce, builder.payload!);
        print('Message published');
    }

    void subscribeToTopic(){
        client.subscribe(topic, mqtt.MqttQos.atLeastOnce);
        print('Subscribed to $topic');
        client.updates!.listen((List<mqtt.MqttReceivedMessage<mqtt.MqttMessage>> event) {
            final mqtt.MqttPublishMessage recMess = event[0].payload as mqtt.MqttPublishMessage;
            final String message = mqtt.MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
            setState(() {
              receivedMessage = message;
            });
            print('Received message: $message');
        });
    }

    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('MQTT App'),
            ),
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed:(){ 
                            publishMessage();
                        },
                        child: Text('Publish Message'),
                    ),
                    SizedBox(height: 20),
                    Text('Received message: $receivedMessage'),
                  ],
                ),
            ),
        );
    }


}



// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:mqtt_client/mqtt_client.dart';
// import 'package:mqtt_client/mqtt_server_client.dart';

// void main() => runApp(MaterialApp(home: MqttApp(),));

// class MqttApp extends StatefulWidget {
//   const MqttApp({super.key});

//   @override
//   State<MqttApp> createState() => _MqttAppState();
// }

// class _MqttAppState extends State<MqttApp> {

//     final MqttServerClient client = MqttServerClient('bfacb7eeb8364eefa75e42c51bf4982d.s1.eu.hivemq.cloud', '');
//     final TextEditingController _messageController = TextEditingController();
//     List<String> messages = [];

//     @override
//     void initState() {
//     // TODO: implement initState
//         super.initState();
//         _connectToMqtt();
//     }

//     Future<void> _connectToMqtt() async {
//         client.logging(on: true);
//         client.keepAlivePeriod = 20;
//        // client.onConnected = _onConnected;
//         //client.onDisconnected = _onDisconnected;
//         client.setProtocolV311();
//         client.connectionMessage = MqttConnectMessage().withClientIdentifier('').startClean();
//         client.securityContext = SecurityContext.defaultContext;
//         client.secure = true;
//         client.port = 8883;
//         client.connectTimeoutPeriod = 30;

//         final connMess = MqttConnectMessage()
//             .withClientIdentifier('flutter_client')
//             .startClean()
//             .withWillQos(MqttQos.atLeastOnce);
        
//         client.connectionMessage = connMess;

//         try{
//             await client.connect('Vinithkumar','Vini2002');
//         }
//         catch(e){
//             print('Exception: $e');
//             client.disconnect();
//         }

//         if(client.connectionStatus!.state == MqttConnectionState.connected){
//             client.subscribe('flutter/from/esp32', MqttQos.atMostOnce);
//             client.updates!.listen((List<MqttReceivedMessage<MqttMessage>> event) {
//                 final MqttPublishMessage message = event[0].payload as MqttPublishMessage;
//                 final String payload = MqttPublishPayload.bytesToStringAsString(message.payload.message);
//                 setState(() {
//                     messages.add('Received: $payload');
//                 });
//             });
//         }
//         else{
//             print('Failed to connect: ${client.connectionStatus!.state}');
//             client.disconnect();
//         }

//     }

//     void _sendMessage(String message){
//         final String message = _messageController.text;
//         if(messages.isNotEmpty){
//            // print('Sending: $message');
//             final builder = MqttClientPayloadBuilder();
//             builder.addString(message);
//             client.publishMessage('esp32/topic', MqttQos.atMostOnce, builder.payload!);

//             client.publishMessage('flutter/topic', MqttQos.atLeastOnce, builder.payload!);
//             setState(() {
//                 messages.add('Sent: $message');
//                 _messageController.clear();
//             });
//         }
//     }


//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//         appBar: AppBar(
//             title: Text('MQTT App'),
//         ),
//         body: Column(
//             children: [
//                 Expanded(
//                     child: ListView.builder(
//                         itemCount: messages.length,
//                         itemBuilder: (context, index){
//                             return ListTile(
//                                 title: Text(messages[index]),
//                             );
//                         },
//                     ),
//                 ),
//                Padding(padding: const EdgeInsets.all(8.0),
//                 child: Row(children: [
//                     Expanded(
//                         child: TextField(
//                             controller: _messageController,
//                             decoration: InputDecoration(
//                                 hintText: 'Enter message',
//                                 border: OutlineInputBorder()
//                             ),
//                         ),
//                     ),
//                     IconButton(
//                         icon: Icon(Icons.send),
//                         onPressed: (){
//                             _sendMessage(_messageController.text);
//                         },
//                     ),
//                 ]),
//                ),
//             ],
//         ),
//     );
//   }
// }

// class MqttApp extends StatefulWidget {
//   @override
//   _MqttAppState createState() => _MqttAppState();
// }

// class _MqttAppState extends State<MqttApp>{
//   final String broker = 'broker.hivemq.com';
//   final String topicToESP32 = 'flutter/to/esp32';
//   final String topicFromESP32 = 'flutter/from/esp32';

//   late MqttServerClient client;
//   List<String> messages = [];

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     client = MqttServerClient(broker, 'flutter_client');
//     connectMQTT();
//   }

//   Future<void> connectMQTT() async {
//     client.logging(on: true);
//     client.keepAlivePeriod = 20;
//     client.onConnected = onConnected;
//     client.onDisconnected = onDisconnected;
//    // client.port = 1883;
//     client.setProtocolV311();
//     client.connectionMessage = MqttConnectMessage().withClientIdentifier('flutter_client').startClean();

//     try{
//       print('Attempting to connect');
//       await client.connect();
//       if(client.connectionStatus!.state == MqttConnectionState.connected){
//         print('Connected to $broker');
//         client.subscribe(topicFromESP32, MqttQos.atMostOnce);
//       }
//       else{
//         print('Failed to connect: ${client.connectionStatus!.state}');
//         client.disconnect();
//       }
//     }
//     catch(e){
//       print('Exception: $e');
//       client.disconnect();
//     }

//     if(client.connectionStatus!.state == MqttConnectionState.connected){
//       client.subscribe(topicFromESP32, MqttQos.atMostOnce);
//       client.updates!.listen((List<MqttReceivedMessage<MqttMessage>> event) {
//         final MqttPublishMessage message = event[0].payload as MqttPublishMessage;
//         final String payload = MqttPublishPayload.bytesToStringAsString(message.payload.message);
//         setState(() {
//           messages.add('Received: $payload');
//         });
//       });
//     }
//   }

//   void onConnected(){
//     print('Connected to $broker');
//     client.subscribe(topicFromESP32, MqttQos.atMostOnce);
//     client.updates!.listen((List<MqttReceivedMessage<MqttMessage>> event) {
//       final MqttPublishMessage message = event[0].payload as MqttPublishMessage;
//       final String payload = MqttPublishPayload.bytesToStringAsString(message.payload.message);
//       setState(() {
//         messages.add('Received: $payload');
//       });
//     });
//   }

//   void onDisconnected(){
//     print('Disconnected from $broker');
//     setState(() {
//       messages.add('Disconnected from $broker');
//     });
//   }

//   void sendMessage(String message){
//     if(client.connectionStatus!.state == MqttConnectionState.connected){
//       final MqttClientPayloadBuilder builder = MqttClientPayloadBuilder();
//       builder.addString(message);
//       client.publishMessage(topicToESP32, MqttQos.atMostOnce, builder.payload!);
//       setState(() {
//         messages.add('Sent: $message');
//       });
//     }
//     else{
//       print('Connot send message,Client not connected');
//       setState(() {
//         messages.add('Cannot send message, Client not connected');
//       });
//     }
//   }

//   void dispose(){
//     client.disconnect();
//     super.dispose();
//   }

//   Widget build(BuildContext context){
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('MQTT App'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: messages.length,
//               itemBuilder: (context, index){
//                 return ListTile(
//                   title: Text(messages[index]),
//                 );
//               },
//             ),
//           ),
//           TextField(
//             onSubmitted: sendMessage,
//             decoration: InputDecoration(
//               hintText: 'Enter message',
//               suffixIcon: IconButton(
//                 icon: Icon(Icons.send),
//                 onPressed: (){
//                   sendMessage('Hello from Flutter');
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// void main() => runApp(MaterialApp(home: MqttApp(),));


// import 'package:mqtt_client/mqtt_client.dart';
// import 'package:mqtt_client/mqtt_browser_client.dart';

// void main() {
//   runApp(MyApp());
// }

// MqttBrowserClient client =
// MqttBrowserClient('ws://127.0.0.1:8080', 'flutter01');

// class MyApp extends StatefulWidget
// {
//   @override
//   MyAppState createState()=> MyAppState();
// }

// class MyAppState extends State<MyApp>{

//   @override

//   Widget build(BuildContext context) {

//     return
//       MaterialApp(
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home:new Scaffold(
//           appBar: AppBar(title: Text("My app"),),
//           body: Center(
//           child:new Column(
//             children: [
//               ElevatedButton(onPressed: connect, child: const Text("Connect")),
//               ElevatedButton(onPressed: subscribe, child: const Text("Subscribe"))
//             ],
//           ),
//           ),
//         )

//       );
//   }

//   Future<MqttBrowserClient> connect() async {

//     client.logging(on: true);
//     client.port = 8080;
//     client.onConnected = onConnected;
//     client.onDisconnected = onDisconnected;
//    // client.onUnsubscribed = onUnsubscribed;
//     client.onSubscribed = onSubscribed;
//     client.onSubscribeFail = onSubscribeFail;
//     client.pongCallback = pong;
//     client.setProtocolV311();
//     final connMessage = MqttConnectMessage()
//         .withWillTopic('willtopic')
//         .withWillMessage('Will message')
//         .startClean()
//         .withWillQos(MqttQos.atLeastOnce);
//     client.connectionMessage = connMessage;
//     client.setProtocolV311();
//     try {
//       await client.connect();
//     } catch (e) {
//       print('Exception: $e');
//       client.disconnect();
//     }

//     client.updates?.listen((List<MqttReceivedMessage<MqttMessage>> c) {
//       final MqttPublishMessage message = c[0].payload as MqttPublishMessage;
//       final payload =
//       MqttPublishPayload.bytesToStringAsString(message.payload.message);

//       print('Received message:$payload from topic: ${c[0].topic}>');
//     });
//     client = client;
//     return client;
//   }

//   //Subscribe
//   void subscribe(){
//     client.subscribe("topic/test", MqttQos.atLeastOnce);
//   }
// // connection succeeded
//   void onConnected() {
//     print('Connected');
//   }

// // unconnected
//   void onDisconnected() {
//     print('Disconnected');
//   }

// // subscribe to topic succeeded
//   void onSubscribed(String topic) {
//     print('Subscribed topic: $topic');
//   }

// // subscribe to topic failed
//   void onSubscribeFail(String topic) {
//     print('Failed to subscribe $topic');
//   }

// // unsubscribe succeeded
//   void onUnsubscribed(String topic) {
//     print('Unsubscribed topic: $topic');
//   }

// // PING response received
//   void pong() {
//     print('Ping response client callback invoked');
//   }

// }


