import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:logger/logger.dart';
import 'package:yaml/yaml.dart';

import 'package:logger/src/outputs/file_output.dart';

void main(List<String> arguments) {
  var workingDirectory = path.dirname(Platform.executable);
  var logFile = File(path.join(workingDirectory, 'log.txt'));
  var logger = Logger(
    filter: ProductionFilter(),
    output: MultiOutput(
      [
        ConsoleOutput(),
        FileOutput(file: logFile),
      ],
    ),
  );
  logger.i('workingDirectory: $workingDirectory');
  var configFile = File(path.join(workingDirectory, 'config.yaml'));
  if (!configFile.existsSync()) {
    logger.e('config.yaml file not found!');
    exit(-1);
  }
  var config = loadYaml(configFile.readAsStringSync());
  logger.i('config: $config');
  var arguments = (config['arguments'] as YamlList).value.map((e) {
    var argument = e.toString();
    // handle --user-data-dir argument separated
    var userDataDirArgName = '--user-data-dir';
    if (argument.startsWith(userDataDirArgName)) {
      var userDataDirArgs = argument.split('=');
      return '$userDataDirArgName=${path.join(workingDirectory, userDataDirArgs[1])}';
    }
    return argument;
  }).toList();
  logger.i('arguments: $arguments');
  var result = Process.runSync(
    config['app'],
    arguments,
    runInShell: false,
    workingDirectory: workingDirectory,
  );
  logger.i(
      'result: exitCode: ${result.exitCode}, stdout: ${result.stdout}, stderr: ${result.stderr}');
}
