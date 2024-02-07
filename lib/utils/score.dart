import 'package:riverpod/riverpod.dart';
 
final scoreProvider = StateProvider.autoDispose<int>((ref) => 0);