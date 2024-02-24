import 'package:flutter_riverpod/flutter_riverpod.dart';

final normalProvider = Provider<String>((ref) {
  return "I'm just a normal provider" ;
});

final messageProvider = FutureProvider<String>((ref) async {
  return Future.delayed(const Duration(seconds: 5),(){
    return "A message from the Future";
  });
});

final counterProvider = StateNotifierProvider<CounterNotifier,int>((ref) {
  return CounterNotifier();
});

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier(): super(0);
  void add(){
    state= state+1;
  }
}