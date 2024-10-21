import 'package:mason/mason.dart';
import 'dart:io';

void run(HookContext context) {
  final outputDir = Directory(context.vars['output_dir'] as String);

  context.logger.info('Output Directory: ${outputDir.path}');

}
