
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MQTTManager{
  final String server = 'test.mosquitto.org';
  final String clientId = 'flutter_client';
  final String topic = 'test/topic';
  final int port = 1883;

  late MqttServerClient client;

  Future<void> connect() async{
    client = MqttServerClient.withPort(server, clientId,port);
    client.logging(on: true);
    client.keepAlivePeriod = 20;
    client.onConnected = onConnected;
    client.onDisconnected = onDisconnected;

    final connMessage = MqttConnectMessage()
      .withClientIdentifier(clientId)
      .startClean()
      .keepAliveFor(20)
      .withWillQos(MqttQos.atLeastOnce);
    
    client.connectionMessage = connMessage;

    try{
      print('Connecting to Mqtt broker');
      await client.connect();
    }
    catch(e){
      print('Error: $e');
      client.disconnect();
    }

  if(client.connectionStatus!.state == MqttConnectionState.connected){
    print('Connected to MQTT broker');
    client.subscribe(topic, MqttQos.atLeastOnce);

    client.updates!.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      final MqttPublishMessage message = c[0].payload as MqttPublishMessage;
      final payload = MqttPublishPayload.bytesToStringAsString(message.payload.message);
      print('Received message: $payload from topic :${c[0].topic}');
    });

    publishMessage('Hello from Flutter');
  }
  else{
    print('Failed to connect. Status: ${client.connectionStatus}');
    client.disconnect();
  }
  }

  void publishMessage(String message){
    final builder = MqttClientPayloadBuilder();
    builder.addString(message);
    client.publishMessage(topic, MqttQos.atMostOnce, builder.payload!);
    print('Message published : $message');
  }

  void onConnected(){
    print('MQTT Connected');
  }

  void onDisconnected(){
    print("MQTT Disconnected");
  }
}