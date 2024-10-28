void main() {
  List<int> score = [45, 78, 62, 49, 85, 33, 90, 50, 40, 20, 95];
  var passed = score.where((number) => number >= 50);
  // print list of passed score
  print(passed);
  print('numbers of passed student are: ${passed.length}');
}
