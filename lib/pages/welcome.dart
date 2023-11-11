import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import '../routes/appRouteConstants.dart';
import '../widgets/constants.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:peacenew/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//Packages
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

//Services
import '../services/navigation_service.dart';
import '../services/media_service.dart';
import '../services/cloud_storage_service.dart';
import '../services/database_service.dart';

class WelcomeScreen extends StatefulWidget {
  final VoidCallback onInitializationComplete;

  const WelcomeScreen({Key? key, required this.onInitializationComplete()})
      : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2)).then(
      (_) {
        _setup().then(
          (_) => widget.onInitializationComplete(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Spacer(flex: 2),
              SizedBox(
                width: double.infinity,
                child: Container(
                  child: Image.asset('assets/logo.jpg'),
                  height: 150, // adjust the height here as needed
                ),
              ),
              const Spacer(flex: 3),
              Text(
                "Welcome to our messaging app",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Text(
                "let's talk with our beloved ones",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .color!
                      .withOpacity(0.64),
                ),
              ),
              const Spacer(flex: 3),
              FittedBox(
                child: TextButton(
                    onPressed: () {
                      (_) => widget.onInitializationComplete();
                      // GoRouter.of(context)
                      //     .pushNamed(MyAppRouteConstants.signupPageRoute);
                    },
                    child: Row(
                      children: [
                        Text(
                          "Skip",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .color!
                                        .withOpacity(0.8),
                                  ),
                        ),
                        const SizedBox(width: kDefaultPadding / 4),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .color!
                              .withOpacity(0.8),
                        )
                      ],
                    )),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _setup() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    _registerServices();
  }

  void _registerServices() {
    GetIt.instance.registerSingleton<NavigationService>(
      NavigationService(),
    );
    GetIt.instance.registerSingleton<MediaService>(
      MediaService(),
    );
    GetIt.instance.registerSingleton<CloudStorageService>(
      CloudStorageService(),
    );
    GetIt.instance.registerSingleton<DatabaseService>(
      DatabaseService(),
    );
  }
}
