import 'package:dashbord_fruit/Core/Widget/custom_bloc_observer.dart';
import 'package:dashbord_fruit/Core/helper_functio/on_generate_route.dart';
import 'package:dashbord_fruit/Core/service/service_locator.dart';
import 'package:dashbord_fruit/Feature/dashbord/presentation/home_view.dart';
import 'package:dashbord_fruit/firebase_options.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await SupabaseStorgaeService.createABucket('fruit_images');
  // await SupabaseStorgaeService.initSupbase();
  await Supabase.initialize(
    url: 'https://cdlkapflfgwkzlewxbgi.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNkbGthcGZsZmd3a3psZXd4YmdpIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc1ODgwOTgxMywiZXhwIjoyMDc0Mzg1ODEzfQ.fMBvfkroTtdx4vzglCGl7e-4Oak7BvrJJat21Ljc-v0',
  );
  // await Supabase.instance.client.storage.createBucket('fruit_images');
   await Firebase.initializeApp();
  Bloc.observer = CustomBlocObserver();
 await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
   await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.playIntegrity,
  );
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(color: Colors.white),
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: HomeView.routeName,
    );
  }
}

