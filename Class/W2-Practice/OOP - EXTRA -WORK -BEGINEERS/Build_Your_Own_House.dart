class Room {
  int number;
  Room(this.number);
}

class House {
  String address;
  List<Room> rooms = [];

  House(this.address);

  // Method to add a room
  void addRoom(Room newRoom) {
    this.rooms.add(newRoom);
  }

  void showHouseDetails() {
    print("House Address: $address");
    print("Number of rooms: ${rooms.length}");
  }
}

void main() {
  House myHouse = House("123 Hello Street");

  Room livingRoom = Room(1);
  Room bedroom = Room(2);
  Room kitchen = Room(3);

  myHouse.addRoom(livingRoom);
  myHouse.addRoom(bedroom);
  myHouse.addRoom(kitchen);

  myHouse.showHouseDetails();
}
