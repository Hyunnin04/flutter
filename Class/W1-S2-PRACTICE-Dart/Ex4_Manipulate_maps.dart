void main() {
  const pizzaPrices = {
    'margherita': 5.5,
    'pepperoni': 7.5,
    'vegetarian': 6.5,
  };
  const orders = ['pepperoni', 'vegetarian', 'margherita'];

  double total = 0;

  for (var pizza in orders) {
    if (pizzaPrices.containsKey(pizza)) {
      total += pizzaPrices[pizza]!;
    } else {
      print('$pizza pizza is not on the menu');
      return;
    }
  }

  print('Total :\$${total}');
}
