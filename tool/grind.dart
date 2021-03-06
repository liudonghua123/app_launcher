import 'dart:io';

import 'package:grinder/grinder.dart';

main(args) => grind(args);

@Task()
test() => new TestRunner().testAsync();

@DefaultTask()
@Depends(test)
build() {
  // create build directory if it doesn't exist.
  Directory('build').createSync();
  // run dart compile exe bin/app_launcher.dart -o build/app_launcher.exe
  Process.runSync('dart', [
    'compile',
    'exe',
    'bin/app_launcher.dart',
    '-o',
    'build/app_launcher${Platform.isWindows ? '.exe' : ''}'
  ]);
}

@Task()
clean() => defaultClean();
