import 'package:riverpod/riverpod.dart';
 
final scoreProvider = StateProvider.autoDispose<int>((ref) => 0);
final questionCountProvider = StateProvider.autoDispose<int>((ref) => 1);