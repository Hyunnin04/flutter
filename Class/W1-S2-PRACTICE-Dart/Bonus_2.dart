// Chat gpt
String checkBalanced(String input) {
  // Stack to keep track of opening brackets
  List<String> stack = [];
  
  // Map to hold the matching pairs
  Map<String, String> pairs = {
    '(': ')',
    '{': '}',
    '[': ']',
  };

  // Loop through each character in the input
  for (var char in input.split('')) {
    // Check if it's an opening bracket
    if (pairs.containsKey(char)) {
      stack.add(char); // Push opening bracket onto the stack
    } 
    // Check if it's a closing bracket
    else if (pairs.values.contains(char)) {
      // If stack is empty or top of stack doesn't match, it's not balanced
      if (stack.isEmpty || pairs[stack.removeLast()] != char) {
        return 'Not balanced';
      }
    }
  }

  // If the stack is empty, all brackets are balanced
  return stack.isEmpty ? 'Balanced' : 'Not balanced';
}

void main() {
  List<String> inputs = [
    '{what is (42)}?',
    '[text}',
    '{[[(a)b]c]d}',
  ];

  for (var input in inputs) {
    print('$input -> ${checkBalanced(input)}');
  }
}
