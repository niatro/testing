import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_app/article.dart';
import 'package:flutter_testing_app/news_change_notifier.dart';
import 'package:flutter_testing_app/news_page.dart';
import 'package:flutter_testing_app/news_service.dart';
import 'package:mocktail/mocktail.dart';

class BadMockNewsService implements NewsService {
  bool getArticlesCalled = false;
  @override
  Future<List<Article>> getArticles() async {
    return [
      Article(title: 'Test 1', content: 'Test 1 content'),
      Article(title: 'Test 2', content: 'Test 2 content'),
      Article(title: 'Test 3', content: 'Test 3 content'),
      Article(title: 'Test 4', content: 'Test 4 content'),
      Article(title: 'Test 5', content: 'Test 5 content'),
    ];
  }
}

class MockNewsService extends Mock implements NewsService {}

void main() {
  late NewsChangeNotifier sut;
  // Se hace late porque se inicializa en el setUp abajo

  setUp(() {
    sut = NewsChangeNotifier(NewsService());
  });
}
