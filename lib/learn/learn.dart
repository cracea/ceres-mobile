//1. DEFINE A CLASS
class Animal {
  // Using late below: late Dart that you are going to initialize the variable at some other point before using it.
  String _name;
  late bool _hasTail;
  late int _nrOfLegs;

  bool _hungry =
      true; // Lets set a default value of true, because animals are always hungry

  //Define getters and setters
  // useful documentation - https://www.geeksforgeeks.org/getter-and-setter-methods-in-dart/
  // getters - are used so that we could GET/RETRIEVE property value of a class
  // setters - are used so that we could SET property value of a class

  //This is a getter for property name.
  //It is the same as writing:
  //function String name()
  //{
  //  return this._name
  //}
  String get name => _name;
  int get nrOfLegs => _nrOfLegs;

  //This is a setter for the property name
  //It takes in a variable name and assigns its value to the property name of the current object
  //It is th same as writing:
  //function void name(String name)
  //{
  //  this._name = name;
  //}
  set setName(String name) => _name = name;

  //Define a getter for the property hungry
  bool get isHungry => _hungry;

  // This is a short way to create a constructor that accepts 2 properties and asssigs their value to the object
  // Below is tha same as:
  // Animal(String name, bool hasTail, int nrOfLegs)
  // {
  //    this.name = name;
  //    this.hasTail = hasTail;
  //    this.nrOfLegs = nrOfLegs;
  // }
  //
  Animal(this._name, this._hasTail, this._nrOfLegs);

  //Lets define sime functions below.

  //This is a function that does not accet any arguments, and it changes the value of property _hungry to false
  void FeedTheAnymal() {
    //some logic of feeding the animal
    _hungry = false;
  }

  //Lets create a function that would tell us if the anymal is sick
  bool isSick() {
    //if an anymal has less than 4 legs and no tails. in our imaginary world lets consider it being sick. :D
    if (_nrOfLegs < 4 || _hasTail == false) {
      return true;
    }
    // otherwise it's not sick
    return false;
  }

  //Lets create another function that will heal our anymal
  void Heal() {
    // We imagine that our society can put back legs and tail on an animal :D
    // inside the class, property can be accessed directly withoud the need to call getters or setters
    _nrOfLegs = 4;
    _hasTail = true;
  }
}

void main() {
//2. CREATE OBJECTS
//Initialise Animal object or in other words create a object
  Animal miota = Animal("Miota", true, 4);
//Initialise another Animal object or in other words create another object
  Animal fiodor = Animal("Fiodor", true, 4);
//And the last one
  Animal poorJeolberto = Animal("Geolberto", false, 3);

//3. ACCESS OBJECT DATA
//Now we will display the data of our example objects above

//This is how we use a getter. The .name part of the code below means that we a calling the getter name
// which gives us the name ob the miota object
  var firstObjectName = miota.name;

//var firstObjectHasTail = miota.hasTail; //This is an error because we don't have a getter for hasTail. We must create one.

  var secondObjectName = fiodor
      .name; //The {secondObjectName} variable will have the value of "Fiodor"
  var thirdObjectName = poorJeolberto
      .name; //The {thirdObjectName} variable will have the value of "Geolberto"

//4. LETS CHANGE SOME DATA
//To change an oject data we use setters
// here we are calling the name seter and passing in the new name of the object;
// !!!! In DART setters are not called as usual functionas, but to make it easier for the programmer
// they a called like below {object}.{setter} = {value_to_pass_to_the_setter}.
//They've tried to make things easier, and have complicated the matters as usual
  miota.setName = "Miota-THE-II";

//now when we try to access the miota object name using name getter, it will give us the new name defined previously
  var newMioTaName = miota.name; //result: "Miota-THE-II"

  //5. Let's feed our animals by calling class functions.

  // First lets check if miota is hungry by getting the value of _hungry property of miota object
  // we're calling the isHungry getter
  if (miota.isHungry) {
    miota.FeedTheAnymal(); // this will change the property hungry to false
  }

  var miotaIsHungry = miota
      .isHungry; //now this must return false bacause we called the FeedTheAnymal

  var fiodatIsHungry = fiodor
      .isHungry; // this mus return true, because we haven't called FeedTheAnymal method of fiodor object

  //Play with poorJeolberto object

  //Lets try to heel our poorJeolberto object, because it has got only 3 legs now and no tail
  poorJeolberto
      .nrOfLegs; // This will return 3. Because when creating the object we specified in the constructor that the number of legs is 3
  // see line 83 of this document.

  //Check if Geolberto is sick
  if (poorJeolberto.isSick()) {
    //lets heal our porr jeolberto
    poorJeolberto.Heal();
  }

  poorJeolberto.nrOfLegs; // This will return 4
}
