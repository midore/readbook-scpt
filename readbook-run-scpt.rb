#!/usr/local/bin/ruby19 -E utf-8 -E utf-8
# coding: utf-8

$LOAD_PATH.delete(".")
$LOAD_PATH.unshift File.dirname(File.dirname(File.expand_path($PROGRAM_NAME)))
load 'bin/config', wrap=true

raise "sorry, i use ruby 1.9.1" if RUBY_VERSION < "1.9.1"
ext = Encoding.default_external.name
raise "Error, LANG must be UTF-8" unless ext == 'UTF-8'
# start
require 'readbook'
ReadBook::Starter.start
