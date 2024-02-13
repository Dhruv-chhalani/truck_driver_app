import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Truckive Dashboard'),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Navigate to notifications
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height -
                  AppBar().preferredSize.height -
                  56, // Adjusted for full-screen map minus app bar and bottom navigation bar heights
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
              margin: EdgeInsets.all(16),
              width: double.infinity,
              child: Center(
                child: FlutterMap(
                  options: MapOptions(
                    initialCenter: LatLng(23.0261076, 72.5565443),
                    initialZoom: 14,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.app',
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: LatLng(23.0261076, 72.5565443),
                          width: 80,
                          height: 80,
                          child: Image.network(
                            'https://cdn-icons-png.flaticon.com/512/2344/2344094.png',
                            width: 20,
                            height: 20,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: _buildDrawer(context),
      bottomNavigationBar: _buildBottomAppBar(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action for FAB
        },
        child: Icon(Icons.map),
        backgroundColor: Colors.deepPurple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 6.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.dashboard, color: Colors.deepPurple),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.monetization_on, color: Colors.green),
            onPressed: () {},
          ),
          SizedBox(width: 48), // The middle space for the FAB
          IconButton(
            icon: Icon(Icons.history, color: Colors.blue),
            onPressed: () {
              Navigator.pushNamed(context, '/recent');
            },
          ),
          IconButton(
            icon: Icon(Icons.settings, color: Colors.grey),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Driver Name'),
            accountEmail: Text('driver@example.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                'D',
                style: TextStyle(fontSize: 40.0, color: Colors.deepPurple),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.deepPurple,
            ),
          ),
          ListTile(
            leading: Icon(Icons.dashboard, color: Colors.deepPurple),
            title: Text('Dashboard'),
            onTap: () {
              Navigator.pop(context); // Closes the drawer
              // Navigator.pushNamed(context, '/dashboard'); // Navigate to Dashboard Page
            },
          ),
          ListTile(
            leading: Icon(Icons.edit, color: Colors.deepPurple),
            title: Text('Edit Profile'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.pushNamed(
                  context, '/editProfile'); // Navigate to the EditProfileWidget
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.deepPurple),
            title: Text('Settings'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.pushNamed(
                  context, '/settings'); // Navigate to Settings Page
            },
          ),

          ListTile(
            leading: Icon(Icons.help_outline, color: Colors.deepPurple),
            title: Text('Help & Support'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.pushNamed(
                  context, '/helpSupport'); // Navigate to Help & Support Page
            },
          ),
          // Additional drawer items can be added here following the same pattern
        ],
      ),
    );
  }
}



// import 'package:flutter/material.dart';

// class DashboardPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Truckive Dashboard'),
//         backgroundColor: Colors.deepPurple, // Updated to a modern color
//         actions: [
//           IconButton(
//             icon: Icon(Icons.notifications),
//             onPressed: () {
//               // Navigate to notifications
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               height: 200, // Height for the map
//               decoration: BoxDecoration(
//                 color: Colors.grey[300],
//                 borderRadius: BorderRadius.circular(
//                     12), // Rounded corners for the map placeholder
//               ),
//               margin: EdgeInsets.all(16),
//               width: double.infinity,
//               child: Center(
//                   child: Text(
//                       'Map View Placeholder')), // Placeholder for map widget
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Text(
//                 'Your Next Job',
//                 style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.deepPurple),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Card(
//                 elevation: 4, // Added elevation for depth
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12)),
//                 child: ListTile(
//                   leading: Icon(Icons.local_shipping, color: Colors.deepPurple),
//                   title: Text('Delivery to XYZ Corporation'),
//                   subtitle: Text('Tap for details and navigation'),
//                   onTap: () {
//                     // Action to view job details
//                   },
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Text(
//                 'Quick Actions',
//                 style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.deepPurple),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Wrap(
//                 spacing: 10,
//                 children: [
//                   _buildActionChip(
//                       context, 'Earnings', Icons.monetization_on, Colors.green),
//                   _buildActionChip(
//                       context, 'Job History', Icons.history, Colors.blue),
//                   _buildActionChip(
//                       context, 'Settings', Icons.settings, Colors.grey),
//                   _buildActionChip(
//                       context, 'Support', Icons.support, Colors.orange),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       drawer: _buildDrawer(context),
//     );
//   }

//   Widget _buildActionChip(
//       BuildContext context, String label, IconData icon, Color color) {
//     return ActionChip(
//       label: Text(label),
//       avatar: Icon(icon, color: Colors.white),
//       onPressed: () {
//         // Navigate based on label
//       },
//       backgroundColor: color,
//       labelStyle: TextStyle(color: Colors.white),
//     );
//   }

//   Widget _buildDrawer(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         children: <Widget>[
//           UserAccountsDrawerHeader(
//             accountName: Text('Driver Name'),
//             accountEmail: Text('driver@example.com'),
//             currentAccountPicture: CircleAvatar(
//               backgroundColor: Colors.white,
//               child: Text(
//                 'D',
//                 style: TextStyle(fontSize: 40.0, color: Colors.deepPurple),
//               ),
//             ),
//             decoration: BoxDecoration(
//               color: Colors.deepPurple,
//             ),
//           ),
//           ListTile(
//             leading: Icon(Icons.dashboard, color: Colors.deepPurple),
//             title: Text('Dashboard'),
//             onTap: () {
//               Navigator.pop(context);
//             },
//           ),
//           // Add other drawer items here
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class DashboardPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Truckive Dashboard'),
//         backgroundColor: Colors.deepPurple,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.notifications),
//             onPressed: () {
//               // Navigate to notifications
//             },
//           ),
//         ],
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           color: Colors.grey[300],
//           borderRadius: BorderRadius.only(
//             bottomLeft: Radius.circular(30),
//             bottomRight: Radius.circular(30),
//           ),
//         ),
//         width: double.infinity,
//         height: MediaQuery.of(context).size.height, // Full screen height
//         child: Center(child: Text('Map View Placeholder')),
//       ),
//       bottomNavigationBar: _buildBottomAppBar(context),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Action for FAB
//         },
//         child: Icon(Icons.map),
//         backgroundColor: Colors.deepPurple,
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//     );
//   }

//   Widget _buildBottomAppBar(BuildContext context) {
//     return BottomAppBar(
//       shape: CircularNotchedRectangle(),
//       notchMargin: 6.0,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: <Widget>[
//           IconButton(
//             icon: Icon(Icons.dashboard, color: Colors.deepPurple),
//             onPressed: () {},
//           ),
//           IconButton(
//             icon: Icon(Icons.monetization_on, color: Colors.green),
//             onPressed: () {},
//           ),
//           SizedBox(width: 48), // The middle space for the FAB
//           IconButton(
//             icon: Icon(Icons.history, color: Colors.blue),
//             onPressed: () {},
//           ),
//           IconButton(
//             icon: Icon(Icons.settings, color: Colors.grey),
//             onPressed: () {},
//           ),
//         ],
//       ),
//     );
//   }
// }
