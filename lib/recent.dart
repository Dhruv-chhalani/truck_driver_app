import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/services.dart';

class RecentServicesWidget extends StatefulWidget {
  const RecentServicesWidget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RecentServicesWidgetState createState() => _RecentServicesWidgetState();
}

class _RecentServicesWidgetState extends State<RecentServicesWidget> {
  // Example static data
  final List<Map<String, dynamic>> _services = [
    {
      "name": "Oil Change",
      "description": "Standard oil change service",
      "image": "https://example.com/oil_change.png",
      "date": "2024-02-10",
    },
    {
      "name": "Tire Rotation",
      "description": "Tire rotation to ensure even wear",
      "image": "https://example.com/tire_rotation.png",
      "date": "2024-02-15",
    },
    {
      "name": "Battery Check",
      "description": "Battery health inspection and cleaning",
      "image": "https://example.com/battery_check.png",
      "date": "2024-02-20",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recent Services', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: _services.length,
          itemBuilder: (context, index) {
            final service = _services[index];
            return ServiceCard(service: service);
          },
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final Map<String, dynamic> service;

  const ServiceCard({Key? key, required this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        leading: CachedNetworkImage(
          imageUrl: service['image'],
          placeholder: (context, url) =>
              SpinKitFadingCircle(color: Colors.deepPurple),
          errorWidget: (context, url, error) => Icon(Icons.error),
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(service['name']),
        subtitle: Text(service['description']),
        trailing: Text(service['date']),
      ),
    );
  }
}
