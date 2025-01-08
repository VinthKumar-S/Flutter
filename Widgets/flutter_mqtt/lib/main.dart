import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
//import 'mqttManager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //final MQTTManager _mqttManager = MQTTManager();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   // _mqttManager.connect();
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _MqttPage(),
    );
  }
}

class _MqttPage extends StatefulWidget {
  const _MqttPage({super.key});

  @override
  State<_MqttPage> createState() => __MqttPageState();
}

class __MqttPageState extends State<_MqttPage> {

  late MqttServerClient client;
  final String broker = 'test.mosquitto.org';
  //final String clientId = 'flutter_client';
  final String topic = 'flutter/mqtt/demo';
  final int port = 1883;
  String receivedMessage = 'No messages yet';

  @override
  void initState() {
    // TODO: implement initState
    connectToBroker();
    super.initState();
  }
  
  Future<void> connectToBroker() async{
    client = MqttServerClient(broker, '');
    client.port = port;
    client.logging(on: true);
    client.logging(on: true);
    client.keepAlivePeriod =20;
    client.onConnected = onConnected;
    client.onDisconnected = onDisconnected;

    final connMessage = MqttConnectMessage()
      .withClientIdentifier('flutter_client')
      .startClean()
      .keepAliveFor(20)
      .withWillQos(MqttQos.atMostOnce);
    
    client.connectionMessage = connMessage;

    try{
      print('Connecting to the MQTT broker');
      await client.connect();
    }
    catch(e){
      client.disconnect();
    }

    if(client.connectionStatus!.state == MqttConnectionState.connected){
      print('Connected to MQTT broker');
      client.subscribe(topic, MqttQos.atLeastOnce);

      client.updates!.listen((List<MqttReceivedMessage<MqttMessage>> c) {
        final MqttPublishMessage message = c[0].payload as MqttPublishMessage;

        final payload = MqttPublishPayload.bytesToStringAsString(message.payload.message);
        setState(() {
          receivedMessage = payload;
        });
        print('Received message: $payload from topic: ${c[0].topic}');
      });
      publishMessage('Hello from Flutter MQTT');
    }
    else{
      print('Failed to connect. Status: ${client.connectionStatus}');
      client.disconnect();
    }
  }

  void onConnected(){
    print('MQTT Conneted');

  }

  void publishMessage(String message){
    final builder = MqttClientPayloadBuilder();
    builder.addString(message);
    client.publishMessage(topic, MqttQos.atMostOnce, builder.payload!);
    print('Message published:$message ');
  }

  void onDisconnected(){
    print('MQTT Disconnected');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MQTT Send and Receive')),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
              Text(
                'Received Message : ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10,),
              Text(
                receivedMessage,
                style: TextStyle(fontSize: 16,color:Colors.blueAccent),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: ()=>publishMessage('Hello again from Fluttet!'), 
              child: Text('Send Message'))
            ],
          ),
        ],
      ),
    );
  }
}