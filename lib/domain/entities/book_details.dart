import 'package:floor/floor.dart';
import 'package:kango/domain/entities/auter.dart';
import 'package:kango/domain/entities/book.dart';
import 'package:kango/domain/entities/book_cover.dart';

@entity
class BookEntity {
  @primaryKey
  final int id;
  final String slug;
  final int price;
  final String publicationYear;
  final bool isFeatured;
  final bool isPrivate;
  final bool isActive;
  final String title;
  final String description;
  final String publisher;
  final String authorName;
  final int rating;
  final String imagePath;
  final String bookPath;
  final String authorSlug;
  final String? authorDescription;
  final int authorId;

  BookEntity({
    required this.id,
    required this.slug,
    required this.price,
    required this.publicationYear,
    required this.isFeatured,
    required this.isPrivate,
    required this.isActive,
    required this.title,
    required this.description,
    required this.publisher,
    required this.authorName,
    required this.rating,
    required this.imagePath,
    required this.bookPath,
    required this.authorSlug,
    this.authorDescription,
    required this.authorId,
  });

  Book toBook() {
    return Book(
        id: id,
        slug: slug,
        fileType: null,
        fileUrl: null,
        embedCode: null,
        isbn: null,
        price: price,
        publicationYear: publicationYear,
        viewed: null,
        isFeatured: isFeatured,
        isPrivate: isPrivate,
        isActive: isActive,
        authorId: authorId,
        title: title,
        description: description,
        shortDescription: null,
        publisher: publisher,
        author: Author(
            slug: authorSlug, name: authorName, description: authorDescription),
        rating: rating,
        bookCover: BookCover(path: imagePath),
        bookFile: BookCover(path: imagePath),
        ordered: null,
        localPath: bookPath

    );
  }
}
