class Game

  def initialize(word)
    @word = word
    @user_correct = []
    @guesses = 8
    @game_over = false
  end

  def show_current_status
    print "Word: "
    @word.each_char do |char|
      if @user_correct.include?(char)
        print char
      else
        print "_"
      end
    end
    puts "\n#{@guesses} guesses remaining."
  end

  def take_a_guess
    puts "Guess a single letter (a-z) or the entire word:"
    user_input = gets.chomp
    if good_guess?(user_input)
      char_guess(user_input) if user_input.size == 1
      word_guess(user_input) if user_input.size > 1
    else
      puts "Invalid character(s) detected. Choose a single letter (a-z) or the entire word:"
      take_a_guess
    end
  end

  def char_guess(guess)
    if @word.include?(guess) == true
      @user_correct << guess
      puts "Found #{@word.count(guess)} occurrence(s) of the character #{guess}."
    else
      puts "Sorry no #{guess}'s found."
      @guesses -= 1
    end
  end

  def word_guess(guess)
    puts "Congratulations, you've guessed the word!" if guess == @word
    puts "Sorry, that is not the word..."  if guess != @word
    @game_over = true
  end

  def good_guess?(guess)
    return false if guess =~ /[0-9]|\W/
    true
  end

  def game_over?
    if @word.split(//).sort.uniq == @user_correct.sort
      puts "Congratulations, you have won the game."
      return true
    end
    return true if @game_over == true
    if @guesses == 0
      puts "You have run out of guesses. GAME OVER."
      return true
    end
  end

end
