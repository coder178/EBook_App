class Booksdata {
  final String id;
  final String bookname;
  final String authorName;
  final String imagePath;
  final String description;
  double? rating;

  Booksdata({ required this.id,
    required this.bookname,
    required this.authorName,
    required this.description,
    required this.imagePath,
    this.rating,
  });



  static List<Booksdata> popular = [
    Booksdata(
        id: '1',
        bookname: "Wings of Fire",
        authorName: "APJ Abdul Kalam",

        imagePath: 'assets/images/APJ.jpg',
        description: 'When Hans died, he left Ariana a small box filled with letters, diary entries, and other memorabilia. Ten years later Ariana finally summoned the courage to have the letters translated, and she began reading. What she discovered launched her on a worldwide search that would deliver indelible portraits of a family loving, finding meaning, and trying to survive amid the worst that can be imagined.'),
    Booksdata(
        id: '2',
        bookname: "The Arsonist",
        authorName: "Chloe Hooper",
        description: 'When Hans died, he left Ariana a small box filled with letters, diary entries, and other memorabilia. Ten years later Ariana finally summoned the courage to have the letters translated, and she began reading. What she discovered launched her on a worldwide search that would deliver indelible portraits of a family loving, finding meaning, and trying to survive amid the worst that can be imagined.',
        imagePath: 'assets/images/ChloeHooper.jpg'),
    Booksdata(
        id: '3',
        bookname: "Harry Potter",
        authorName: "J.K Rowling",
        description: 'When Hans died, he left Ariana a small box filled with letters, diary entries, and other memorabilia. Ten years later Ariana finally summoned the courage to have the letters translated',
        imagePath: 'assets/images/HarryPotter.jpeg'),
    Booksdata(
        id: '4',
        bookname: "This is How It Always Is",
        authorName: "Laurie Frankel",
        description: 'When Hans died, he left Ariana a small box filled with letters, diary entries, and other memorabilia. Ten years later Ariana finally summoned the courage to have the letters translated',
        imagePath: 'assets/images/ThisisHow.jpeg',
        rating: 4.5),
    Booksdata(
        id: '5',
        bookname: "In A Land Of Paper Gods",
        authorName: "Rebecca Mackenzie",
        description: 'When Hans died, he left Ariana a small box filled with letters, diary entries, and other memorabilia. Ten years later Ariana finally summoned the courage to have the letters translated',
        imagePath: 'assets/images/rebbeca.jpg',
        rating: 4.3),
    Booksdata(
        id: '6',
        bookname: "The Guest List",
        authorName: "Lucy Foley",
        description: 'When Hans died, he left Ariana a small box filled with letters, diary entries, and other memorabilia. Ten years later Ariana finally summoned the courage to have the letters translated',
        imagePath: 'assets/images/theguest.jpeg',
        rating: 4.0),
  ];
}
List<Booksdata> continueReading = [
  Booksdata(
      id: '1',
      bookname: "Wings of Fire",
      authorName: "APJ Abdul Kalam",

      imagePath: 'assets/images/APJ.jpg',
      description: 'When Hans died, he left Ariana a small box filled with letters, diary entries, and other memorabilia. Ten years later Ariana finally summoned the courage to have the letters translated, and she began reading. What she discovered launched her on a worldwide search that would deliver indelible portraits of a family loving, finding meaning, and trying to survive amid the worst that can be imagined.'),
  Booksdata(
      id: '2',
      bookname: "The Arsonist",
      authorName: "Chloe Hooper",
      description: 'When Hans died, he left Ariana a small box filled with letters, diary entries, and other memorabilia. Ten years later Ariana finally summoned the courage to have the letters translated, and she began reading. What she discovered launched her on a worldwide search that would deliver indelible portraits of a family loving, finding meaning, and trying to survive amid the worst that can be imagined.',
      imagePath: 'assets/images/ChloeHooper.jpg'),
  Booksdata(
      id: '3',
      bookname: "Harry Potter",
      authorName: "J.K Rowling",
      description: 'When Hans died, he left Ariana a small box filled with letters, diary entries, and other memorabilia. Ten years later Ariana finally summoned the courage to have the letters translated',
      imagePath: 'assets/images/HarryPotter.jpeg'),
];
