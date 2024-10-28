
enum Direction { North, East, South, West }
class Robot {
  int x;
  int y;
  Direction direction;
  Robot(this.x, this.y, this.direction);
  void turnRight() {
    List<Direction> directions = Direction.values;
    direction = directions[(direction.index + 1) % 4]; 
  }
  void turnLeft() {
    List<Direction> directions = Direction.values;
    direction = directions[(direction.index - 1 + 4) % 4]; 
  }
  void advance() {
    switch (direction) {
      case Direction.North:
        y += 1;
        break;
      case Direction.East:
        x += 1;
        break;
      case Direction.South:
        y -= 1;
        break;
      case Direction.West:
        x -= 1;
        break;
    }
  }
  void Instructions(String instructions) {
    for (int i = 0; i < instructions.length; i++) { 
      String command = instructions[i]; 
      if (command == 'R') {
        turnRight();
      } else if (command == 'L') {
        turnLeft();
      } else if (command == 'A') {
        advance();
      } else {
        print('Unknown command: $command');
      }
    }
  }
  void Position() {
    print('Position: ($x, $y), Facing: $direction');
  }
}
void main() {
  Robot robot = Robot(7, 3, Direction.North);
  String instructions = "RAALAL";
  robot.Instructions(instructions);
  robot.Position(); 
}
