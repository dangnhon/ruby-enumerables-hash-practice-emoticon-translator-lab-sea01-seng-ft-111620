# require modules here
require 'yaml'
require 'pry'

def load_library(emoticon_file)

emoticons = YAML.load_file('./lib/emoticons.yml')

final_hash = {}
emoticons_library = {}

 emoticons.each do |name, value|
  english_value = value[0]
  japanese_value = value[1]
  english = {:english => english_value}
  japanese = {:japanese => japanese_value}

    divided_emotes = english.merge(japanese)
    emoticons_library = name
    final_hash.store(name, divided_emotes)
  end
final_hash
end


def get_english_meaning(emoticon_file, emoticon)
  final_hash = load_library(emoticon_file)
  final_hash.each do |key|
    if emoticon == final_hash[key][:japanese]
      return key
    end
  end
"Sorry, that emoticon was not found"
end


def get_japanese_emoticon(emoticon_file, emoticon)
  final_hash = load_library(emoticon_file)
  final_hash.each do |key|
    if emoticon == final_hash[key][:english]
      return final_hash[key][:japanese]
    end
  end
"Sorry, that emoticon was not found"
end
