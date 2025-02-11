import 'dart:io';

String fixtures(String name) =>
    File('test/test_values/$name').readAsStringSync();
