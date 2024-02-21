import path from 'path';

import { Mime } from 'mime/lite';
import standardTypes from 'mime/types/standard.js';
import otherTypes from 'mime/types/other.js';

const mime = new Mime(standardTypes, otherTypes);

mime.define(
  {
    'text/plain': [
      'authors',
      'changes',
      'license',
      'makefile',
      'patents',
      'readme',
      'ts',
      'flow'
    ]
  },
  /* force */ true
);

const textFiles = /\/?(\.[a-z]*rc|\.git[a-z]*|\.[a-z]*ignore|\.lock)$/i;

export default function getContentType(file) {
  const name = path.basename(file);

  return textFiles.test(name)
    ? 'text/plain'
    : mime.getType(name) || 'text/plain';
}
