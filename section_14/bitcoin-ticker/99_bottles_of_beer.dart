void main() {
  for (int i = 99; i >= 0; i--) {
    if (i == 0) {
      print(
          'No more bottles of beer on the wall, no more bottles of beer. Go to the store and buy some more, 99 bottles of beer on the wall.');
      return;
    }

    String numOfBeerOnTheWall = '${i - 1}';
    if (i == 1) {
      numOfBeerOnTheWall = 'no more';
    }

    print(
        '$i bottles of beer on the wall, $i bottles of beer. Take one down and pass it around, $numOfBeerOnTheWall bottles of beer on the wall.');
  }
}
