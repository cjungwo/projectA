class Room {
  // attribute
  late String roomType;
  late double price;
  late int minimizeOfCapacity;
  late int miximizeOfCapacity;
  late final int totalRoom;
  late int emptyRoom;
  late String details;

  // default constructor
  Room.origin()
      : roomType = "Manager room",
        minimizeOfCapacity = 1,
        miximizeOfCapacity = 1,
        totalRoom = 1,
        emptyRoom = 0,
        price = 0,
        details = "This is manager room";

  // alternative constructor
  Room(this.roomType, this.minimizeOfCapacity, this.miximizeOfCapacity,
      this.emptyRoom, this.price, this.details)
      : this.totalRoom = 20;

  //Getter
  String getRoomType() {
    return roomType;
  }

  int getMinimizeOfCapacity() {
    return minimizeOfCapacity;
  }

  int getMiximizeOfCapacity() {
    return miximizeOfCapacity;
  }

  int getTotalRoom() {
    return totalRoom;
  }

  int getEmptyRoom() {
    return emptyRoom;
  }

  double getPrice() {
    return price;
  }

  //Setter
  setRoomType(String roomType) {
    this.roomType = roomType;
  }

  setCapacity(int capacity) {
    this.minimizeOfCapacity = capacity;
  }

  setEmptyRoom(int emptyRoom) {
    this.emptyRoom = emptyRoom;
  }

  setPrice(double price) {
    this.price = price;
  }

  //toString
  String roomInfo() {
    return "Room : " +
        roomType +
        " type." +
        "\nPrice : " +
        price.toString() +
        "\$" +
        "\nTotal : " +
        totalRoom.toString() +
        "rooms." +
        "\nEmpty : " +
        emptyRoom.toString() +
        "rooms left. \n";
  }

  reserved() {
    emptyRoom--;
  }

  //canceled
  canceled() {
    emptyRoom++;
  }
}
