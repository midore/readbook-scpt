#!/usr/local/bin/ruby19 -E utf-8 
# coding: utf-8

# This File Save in pathto/readbook-xx/bin/

$LOAD_PATH.delete(".")
$LOAD_PATH.unshift File.dirname(File.dirname(File.expand_path($PROGRAM_NAME)))
load 'bin/config', wrap=true

begin
  raise "sorry, i use ruby 1.9.1" if RUBY_VERSION < "1.9.1"
  ext = Encoding.default_external.name
  raise "Error, LANG must be UTF-8" unless ext == 'UTF-8'
  require 'readbook'
  ReadBook::Starter.start
  rescue RuntimeError => err
  print err.message, "\n"
  abort "abort.\n"
end
