import 'package:mockito/mockito.dart';

class MockCallback extends Mock {
  call();
}

class MockCallbackWithParam<T> extends Mock {
  call(T param);
}

class MockCallbackWithParams2<T, K> extends Mock {
  call(T param0, K param1);
}

class MockCallbackWithParams3<T, K, J> extends Mock {
  call(T param0, K param1, J param2);
}

class MockCallbackWithParam1<P, R> extends Mock {
  R call(P param);
}

abstract class BoolCallback {
  bool call();
}

abstract class BoolCallbackWithParam<P> {
  bool call(P param);
}