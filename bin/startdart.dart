void main() {
  // Numbers
  var age = 5;
  var price = 3.5;

  // String
  String text = "I am a text";

  // Boolean
  bool isCool = true;

  // Dynamic
  dynamic unknown;

  // List
  List<int> list = [1, 2, 3];
  list.add(5);
  var list2 = [6, ...list]; // Spread
  var list3 = [6, ...?list]; // null-aware spread operator
  var list4 = [6, 7, 8, if(isCool) 9]; // collection if
  var list5 = [
    0, 1, 2,
    for (var i in list4) i * 10 // collection for
  ];

  // Sets
  Set<String> names = {'Max', 'Zalupa', 'Reqe'};
  names.add('Max');
  var names2 = <String>{};

  // Maps - dictionary
  Map<int, String> products = {1: 'iPaid', 2:'iFound', 3:'iHate'};
  var listToMap = { for(int i = 0; i < list.length; i++) i:list[i] };
  var setToMap = { for(int i = 0; i < names.length; i++) i:names.elementAt(i) };

  var myMap = Map();
  myMap['one'] = 1;
  myMap['two'] = 2;

  //   // Function
  //   bool canDoIt(int val) {
  //     return val > 5;
  //   }

  // Function automatically
  //   canDoIt(int val) {
  //     return val > 5;
  //   }

  //   canDoIt(val) {
  //     return val > 5;
  //   }
  canDoIt(val) => val > 5;

  Function f1 = (int i) => i * 10;

  //   double calculatePrice(int count, double price) {

  //     var result = count * price;
  //     return result;
  //   }

  // Default optional positional parameter
  //   double calculatePrice(int count, [double price = 5.0]) {

  //     var result = count * price;
  //     return result;
  //   }
  //   print(calculatePrice(7, 5.0));


  // @required -> required kwarg, arg
  // **kwargs
  //   double calculatePrice(int count, {double price = 5.0}) {

  //     var result = count * price;
  //     return result;
  //   }
  //   print(calculatePrice(4, price: 6.0));


  // Function as argument
  double calculatePrice(int count,
      {required double price, bool discount = true, required Function func}) {

    var result = count * price;
    if (discount == true){
      result = result * 0.9 * func(7);
    }
    return result;
  }

  void print1(int i) {
    print(i);
  }

  list.forEach(print1);

  // Anonymous function
  list.forEach((int element){
    print(element + 5);
  });

//   print(calculatePrice(4, price: 6.0, func: f1));
}
