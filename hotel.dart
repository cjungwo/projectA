import 'dart:io';

import 'guest.dart';
import 'room.dart';

void main() {
  Hotel();
}

class Hotel {
  late Room managerRoom,
      singleRoom,
      doubleRoom,
      twinRoom,
      familyRoom,
      chosenRoom;
  late Guest m1, guest;

  Hotel() {
    managerRoom = Room.origin();
    singleRoom = Room("Single room", 1, 2, 8, 100.0, "This is Single Room");
    doubleRoom = Room("Double room", 1, 4, 10, 230.0, "This is Double Room");
    twinRoom = Room("Twin room", 1, 4, 0, 300.0, "This is Twin Room");
    familyRoom = Room("Family room", 4, 6, 15, 500.0, "This is Family Room");
    chosenRoom = managerRoom;
    // manager
    m1 = Guest.origin();

    startFrontDesk();
  }

  startFrontDesk() {
    registration();
    String start = "y";
    while (start == "y") {
      askWanted();
      print("Do it again? (y/n)");
      start = stdin.readLineSync()!;
    }
  }

  login() {
    checkVaild(askId());
    checkVaild(askPassword());
  }

  int? askId() {
    print("Enter Id: ");
    int? id = int.parse(stdin.readLineSync()!);
    return id;
  }

  checkVaild(dynamic arg) {}

  String? askPassword() {
    print("Enter Password: ");
    String? password = stdin.readLineSync();
    return password;
  }

  registration() {
    print("Enter Id:");
    int? id = int.parse(stdin.readLineSync()!);
    print("Enter Password:");
    String? password = stdin.readLineSync()!;
    print("Enter name:");
    String? name = stdin.readLineSync()!;
    print("Enter age:");
    int? age = int.parse(stdin.readLineSync()!);
    print("Enter account:");
    double? account = double.parse(stdin.readLineSync()!);
    guest = Guest(id, password, name, age, account);
  }

  askWanted() {
    print("What do you want?" +
        "\n1. Reservation 2. Reservation cancellation 3. My info 4. Nothing");
    int? answer = int.parse(stdin.readLineSync()!);
    switch (answer) {
      case 1:
        askViewBoard();
        break;
      case 2:
        guest.cancelReservation(chosenRoom);
        break;
      case 3:
        print(guest.guestInfo());
        break;
      case 4:
        print("Okay, bye~! See you next time.");
        break;
      default:
        print("You pressed wrong number.");
    }
  }

  askViewBoard() {
    print("Do you want to view the options? (y/n)");
    String? answer = stdin.readLineSync();

    if (answer == "y") {
      showOption();
      askRoomType();
    } else if (answer == "n") {
      askRoomType();
    } else {
      print("Please press y or n. See you next time.");
    }
  }

  Room changeIntToRoom(int roomTypeNumber) {
    switch (roomTypeNumber) {
      case 1:
        chosenRoom = singleRoom;
        break;
      case 2:
        chosenRoom = doubleRoom;
        break;
      case 3:
        chosenRoom = twinRoom;
        break;
      case 4:
        chosenRoom = familyRoom;
        break;
      default:
        print("We have only 4 option.");
    }
    return chosenRoom;
  }

  showOption() {
    print("----Hotel Room Types----\n");
    print(singleRoom.roomInfo());
    print(doubleRoom.roomInfo());
    print(twinRoom.roomInfo());
    print(familyRoom.roomInfo());
    print("------------------------");
  }

  askRoomType() {
    print("Which type of room? (Choose number) " +
        "\n1.Single Room 2.Double Room " +
        "3. Twin Room 4.FamilyRoom");
    int? roomTypeNumber = int.parse(stdin.readLineSync()!);
    guest.reservation(changeIntToRoom(roomTypeNumber));
  }
}
