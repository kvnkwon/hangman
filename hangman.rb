#!/usr/bin/env ruby
require_relative 'game'


word_bank = []
File.open('wordbank.txt') do |answer|
  word_bank = answer.read.split(' ')
end

word = word_bank.sample

game = Game.new(word)

puts "Welcome to Hangman v1.0!\n\n"
while !game.game_over?
 game.show_current_status
 game.take_a_guess
end
  