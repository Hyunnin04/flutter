enum Country { CAMBODIA, FRANCE, USA }

enum Color { Blue, Yellow, Red, White }

class Address {
  final Country country;

  final String city;

  final String street;

  Address({
    required this.country,
    required this.city,
    required this.street,
  });

  String toString() {
    return "$country - $city - $street";
  }
}

class Window {
  final Color color;
  Window({required this.color});

  String toString() {
    return "$color";
  }
}

class Door {}

class Roof {
}

class House {
  final Address address;
  final List<Roof> roofs = [];
  final List<Window> window = [];
  final List<Door> doors = [];

  House({required this.address});

  String toString() {
    return ("Number of doors: ${doors.length} \nNumber of roofs : ${roofs.length} \nNumber of windows: ${window.length}, \Colors: ${window.map((w) => w.color).join(', ')}");
  }

// method to add door
  void addDoor(Door newDoor) {
    this.doors.add(newDoor);
  }

// method to add roof
  void addRoof(Roof newRoof) {
    this.roofs.add(newRoof);
  }

// method to add window
  void addWindow(Window newWindow) {
    this.window.add(newWindow);
  }
}

main() {
  // Create an Address
  Address houseAddress = Address(
    country: Country.CAMBODIA,
    city: "Phnom Penh",
    street: "Helloworld",
  );

  // Create a House with the Address and Window
  House myHouse = House(address: houseAddress);

  // Add doors to the house
  myHouse.addRoof(Roof());

  // Add doors to the house
  myHouse.addDoor(Door());

  // Add window TO the house
  myHouse.addWindow(Window(color: Color.Blue));
  myHouse.addWindow(Window(color: Color.Blue));

  // Print the house address and details
  print("House Address: ${myHouse.address}");
  print(myHouse.toString());
}
