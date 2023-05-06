import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Only show the banner if not running on the web
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(title: 'Radios'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

 class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
   final List<Map<String, String>> stations = [];

   // Variables to track the selected and hovered index
   int _selectedIndex = -1;

   late AnimationController _animationController;

   final AudioPlayer _audioPlayer = AudioPlayer();

   @override
   void initState() {
     super.initState();
     _loadStations();
   }

   void _loadStations() async {
     final dbReference = FirebaseDatabase.instance.ref().child(
         'stationsradios');
     final dataSnap = await dbReference.once();
     final stationsInfo = dataSnap.snapshot.value;

     if (stationsInfo != null) {
       for (var stationInfo in (stationsInfo as Map<dynamic, dynamic>).values) {
         final station = <String, String>{
           'nom': stationInfo['nom'],
           'lien': stationInfo['lien'],
           'photo': stationInfo['photo'],
         };
         stations.add(station);
       }
     }

     setState(() {});
   }

   @override
   void dispose() {
     _audioPlayer.dispose();
     _animationController.dispose();
     super.dispose();
   }

   void _playRadio(String url) async {
     await _audioPlayer.play(url);
   }

   void _stopRadio() async {
     await _audioPlayer.stop();
   }


   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text(widget.title),
       ),
       body: Padding(
         padding: const EdgeInsets.all(16),
         child: GridView.builder(
           itemCount: stations.length,
           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount: 2,
             mainAxisSpacing: 16,
             crossAxisSpacing: 16,
             childAspectRatio: 1,
           ),
           itemBuilder: (context, index) {
             return GestureDetector(
               onTap: () {
                 if (_selectedIndex == index) {
                   _stopRadio();
                   setState(() {
                     _selectedIndex = -1;
                   });
                 } else {
                   _playRadio(stations[index]['lien']!);
                   setState(() {
                     _selectedIndex = index;
                   });
                 }
               },
               onTapDown: (TapDownDetails details) {
                 _animationController.forward();
               },
               onTapUp: (TapUpDetails details) {
                 _animationController.reverse();
               },
               child: AnimatedContainer(
                 duration: const Duration(milliseconds: 450),
                 decoration: BoxDecoration(
                   color: _selectedIndex == index
                       ? Colors.grey[600]
                       : Colors.grey[350],
                 ),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Image.network(
                       stations[index]['photo']!,
                       width: 100,
                       height: 100,
                       fit: BoxFit.cover,
                     ),
                     const SizedBox(height: 8),
                     Text(
                       stations[index]['nom']!,
                       style: const TextStyle(
                         fontWeight: FontWeight.bold,
                       ),
                       textAlign: TextAlign.center,
                     ),
                   ],
                 ),
               ),

             );
           },
         ),
       ),
     );
   }
 }
