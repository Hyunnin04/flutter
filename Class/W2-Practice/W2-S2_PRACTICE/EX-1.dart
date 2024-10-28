enum Skill { FLUTTER, DART, OTHER }

// add class address
enum City { PhnomPenh, Paris, NewYork, Seoul, Tokyo }

class Address {
  String? _street;
  City? _city;
  String? _zipCode;

  Address({required City city, String? street, String? zipCode}) {
    _city = city;
    _street = street;
    _zipCode = zipCode;
  }

  String? get Street => _street;
  City? get city => _city;
  String? get zipCode => _zipCode;

  @override
  String toString() {
    return "Address: $_city - Street: $_street - Zip Code: $_zipCode";
  }
}

class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skills;
  final Address _address;
  final int _yearsOfExperience;

  Employee({
    required String name,
    required double baseSalary,
    required List<Skill> skills,
    required Address address,
    required int yearsOfExperience,
  })  : _name = name,
        _baseSalary = baseSalary,
        _skills = skills,
        _address = address,
        _yearsOfExperience = yearsOfExperience;

  Employee.mobileDeveloper({
    required String name,
    required double baseSalary,
    required Address address,
    required int yearsOfExperience,
  })  : _name = name,
        _baseSalary = baseSalary,
        _skills = [Skill.DART, Skill.FLUTTER],
        _address = address,
        _yearsOfExperience = yearsOfExperience;

  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => _skills;
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;

  double skillBonus() {
    double Bonus = 0;
    for (var skill in _skills) {
      switch (skill) {
        case Skill.FLUTTER:
          Bonus += 5000;
          break;
        case Skill.DART:
          Bonus += 3000;
          break;
        case Skill.OTHER:
          Bonus += 1000;
          break;
      }
    }
    return Bonus;
  }

  double computeSalary() {
    double Computed = _yearsOfExperience * 2000;
    double result = Computed + skillBonus();
    return result;
  }

  double totleSalary() {
    double totle = computeSalary() + _baseSalary;
    return totle;
  }

  void printDetails(int employeeNumber) {
    print(
        'Employee No. $employeeNumber : \n  - $name \n  - Base Salary: \$${baseSalary} \n  - $skills \n  - Years Of Experience: $yearsOfExperience');
    print('  - Computed Salary: \$${computeSalary().toStringAsFixed(2)}');
    print('  - Total Salary: \$${totleSalary().toStringAsFixed(2)}');
    print('  Address  No. $employeeNumber : $address');
  }
}

void main() {
  var address1 = Address(
      street: 'Mao Tse Tung St', city: City.PhnomPenh, zipCode: '12345');
  var emp1 = Employee(
      name: 'Sokea',
      baseSalary: 40000,
      skills: [Skill.DART],
      address: address1,
      yearsOfExperience: 5);
  emp1.printDetails(1);

  var address2 =
      Address(street: 'Champs Elysées St', city: City.Paris, zipCode: '67890');
  var emp2 = Employee.mobileDeveloper(
      name: 'Ronan',
      baseSalary: 45000,
      address: address2,
      yearsOfExperience: 6);
  emp2.printDetails(2);
}
