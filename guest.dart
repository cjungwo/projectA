import 'room.dart';

class Guest {
  late int id;
  late String password;
  late String name;
  late int age;
  late double account;
  late List<Room>? reservedList = [];
  late List<Room>? likeRoomList = [];

  bool reserved = false;

  // default constructor
  Guest.origin()
      : id = 0,
        password = "master",
        name = "Maanger",
        age = 24,
        account = 100000;

  // alternative constructor
  Guest(this.id, this.password, this.name, this.age, this.account);

  //getter
  String get getName {
    return name;
  }

  double get getAccount {
    return account;
  }

  bool get getreserved {
    return reserved;
  }

  // setter
  set setName(String name) {
    this.name = name;
  }

  set setAge(int age) {
    this.age = age;
  }

  set setAccount(double account) {
    this.account = account;
  }

  guestInfo() {
    print("Reservation name : " +
        name +
        "\nNumber of Guest : " +
        age.toString() +
        "\nAccount : " +
        account.toString() +
        "\nReserved : " +
        reserved.toString() +
        "\n");
  }

  reservation(Room theRoom) {
    if (theRoom.getTotalRoom() == 20) {
      isCapability(1, theRoom);
    } else {
      print("Sorry, " + name + ". You chose wrong number.");
    }
  }

  succeedMessage(Room theRoom) {
    print("Reservation Success!!");
    print("You resevered " + theRoom.getRoomType() + ".");
    print("Now, you have " + account.toString() + " dollars.\n");
    print("Current room info \n" + theRoom.roomInfo());
  }

  compareAccountAndPrice(Room theRoom) {
    if (account >= theRoom.getPrice()) {
      theRoom.reserved();
      this.account -= theRoom.getPrice();
      this.reserved = true;
      succeedMessage(theRoom);
    } else {
      print("Sorry, " + name + ". You cannot affordable this room.\n");
    }
  }

  hasRoom(Room theRoom) {
    if (theRoom.getEmptyRoom() > 0) {
      compareAccountAndPrice(theRoom);
    } else {
      print("Sorry, " + name + ". All the rooms are full.\n");
    }
  }

  isCapability(numberOfGuests, Room theRoom) {
    if (numberOfGuests >= theRoom.getMinimizeOfCapacity() &&
        numberOfGuests <= theRoom.getMiximizeOfCapacity()) {
      hasRoom(theRoom);
    } else {
      print("Sorry, " + name + ". It has exceeded capacity exceeded.\n");
    }
  }

  cancelReservation(Room theRoom) {
    if (reserved) {
      theRoom.canceled();
      this.reserved = false;
      account += theRoom.getPrice();
      print("Success Cancel.\nYour Account back.\n");
      print("See you next time~\n");
    } else {
      print("You don't reserve any room.\n");
    }
  }
}
