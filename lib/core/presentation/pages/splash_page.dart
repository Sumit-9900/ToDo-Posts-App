import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_post_app/core/const/const.dart';
import 'package:todo_post_app/features/todo/presentation/pages/todo_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 5),
      () {
        if (mounted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (ctx) => const TodoPage(),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          Const.splashImage,
          width: 400,
          height: 400,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
