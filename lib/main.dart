import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/quiz_provider.dart';
import 'screens/splash_screen.dart';
import 'theme/app_theme.dart';
void main()=>runApp(ChangeNotifierProvider(create:(_)=>QuizProvider(),child:const QuizoraApp()));
class QuizoraApp extends StatelessWidget { const QuizoraApp({super.key});
@override Widget build(BuildContext context)=>Consumer<QuizProvider>(builder:(context,quiz,_)=>MaterialApp(
title:'Quizora',debugShowCheckedModeBanner:false,theme:AppTheme.light,darkTheme:AppTheme.dark,
themeMode:quiz.isDarkMode?ThemeMode.dark:ThemeMode.light,home:const SplashScreen())); }
