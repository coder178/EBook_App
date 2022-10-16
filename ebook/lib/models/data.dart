class Booksdata {
  String  bookname;
  String ? authorName;
  String imagePath;

  double? rating;
  Booksdata(
      {this.authorName,
      required this.bookname,

      required this.imagePath,
      this.rating});
}

List<Booksdata> continueReading = [
  Booksdata(
      bookname: "Wings of Fire",
      authorName: "APJ Abdul Kalam",

      imagePath: 'assets/images/APJ.jpg'),
  Booksdata(
      bookname: "The Arsonist",
      authorName: "Chloe Hooper",

      imagePath: 'assets/images/ChloeHooper.jpg'),
  Booksdata(
      bookname: "Harry Potter",
      authorName: "J.K Rowling",

      imagePath: 'assets/images/HarryPotter.jpeg'),
];

List<Booksdata> popular = [
  Booksdata(
      bookname: "This is How It Always Is",
      authorName: "Laurie Frankel",

      imagePath: 'assets/images/ThisisHow.jpeg',
      rating: 4.5),
  Booksdata(
      bookname: "In A Land Of Paper Gods",
      authorName: "Rebecca Mackenzie",

      imagePath: 'assets/images/rebbeca.jpg',
      rating: 4.3),
  Booksdata(
      bookname: "The Guest List",
      authorName: "Lucy Foley",

      imagePath: 'assets/images/theguest.jpeg',
      rating: 4.0),
];
