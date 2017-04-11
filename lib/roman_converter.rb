# frozen_string_literal: true
class String
  def to_arabic_number
    validate_roman
    convert_to_integer
  end

  def convert_to_integer
    result = []
    roman_to_numbers.each_with_index do |num, _index|
      if result.last && num > result.last
        result.push  num - result.pop
      else
        result.push(num)
      end
    end
    result.inject(&:+)
  end

  def roman_to_numbers
    chars.to_a.map { |letter| roman_mapping[letter] }
  end

  def validate_roman
    valid_letters = roman_mapping.keys
    unless chars.to_a { |letter| valid_letters.include?(letter) }
      printf('invalid Roman numeral')
      exit(1)
    end
  end

  def roman_mapping
    {
      'M' => 1000,
      'D' => 500,
      'C' => 100,
      'L' => 50,
      'X' => 10,
      'V' => 5,
      'I' => 1
    }
  end
end

class TradeMineral
  attr_accessor :coin_name, :unit_price
  @@mimeral = []
  def initialize(coin_name, unit_price)
    @coin_name = coin_name
    @unit_price = unit_price
    @@mimeral << self
  end

  def self.get_trade_metal(question)
    sentence = question.split
    @@mimeral.detect { |trademetal| sentence.include? trademetal.coin_name }
  end
end

class Translate
  attr_accessor :pattern
  # This stores the data all assignments of galactic words to it's Roman Number
  # e.x glob => I, prok => V

  @@galactic_words_to_roman_number_assigments = {}
  def self.galactic_words_to_roman_number_assigments
    @@galactic_words_to_roman_number_assigments
  end

  def initialize(pattern)
    @pattern = pattern
  end

  def valid_pattern?
    pattern_check = @pattern.split.map { |e| Translate.galactic_words_to_roman_number_assigments[e] }.join.to_s
    !pattern_check.to_s.match(/^M*(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$/).nil? # Validacion especial de orden aritmetica de numeros romanos
  end

  def is_valid?
    invalid_words = @pattern.split.detect { |e| !Translate.galactic_words_to_roman_number_assigments.keys.include? e }
    !invalid_words && valid_pattern?
  end

  def self.translate_question(question)
    galactic_words = []
    question.split.each do |word|
      Translate.galactic_words_to_roman_number_assigments.keys.include?(word) ? (galactic_words << word ) : (break if galactic_words.size > 0)
    end
    if galactic_words.size > 0
      str = Translate.new(galactic_words.join(' '))
      return (str.is_valid? ? str : nil)
    end
    return nil
  end
end

class Merchant
  attr_accessor :line, :words

  def initialize(sentence)
    # return if line.chomp == ""
    @line = sentence
    @words = sentence.to_s.split
  end

  def recon_sentence
    # Check the line of the galactic merchant
    if @words.size == 3 && @words[1] == 'is'
      galactic_numeral_assigment(@words[0], @words[2])
    elsif @words.last == 'Credits'
      process_credit
    elsif @words.include?('how') && (@words.last == '?')
      process_question
    else
      clueless
    end
  end

  def clueless
     'I have no idea what you are talking about'.to_s
  end

  def galactic_numeral_assigment(galactic_word, roman_number)
    Translate.galactic_words_to_roman_number_assigments[galactic_word] = roman_number
  end

  def process_credit
    credit_price_of_metal_coins = 0
    galactic_units = []
    coin_name = ''
    @words.each do |word|
      if Translate.galactic_words_to_roman_number_assigments.keys.include?(word)
        galactic_units.push word
      elsif %w(is Credits).include? word # Ignore these words, we don't really care of these words in Credit Statement Lines
        next
      elsif word.to_i > 0 # 2 Silver is '34'
        credit_price_of_metal_coins = word.to_i # e.g 34
      else
        coin_name = word # Mineral Silver, Gold, Iron
      end
    end
    if !coin_name.empty? && credit_price_of_metal_coins > 0 && !galactic_units.empty?
      units_of_coin_in_galactic_words = Translate.new(galactic_units.join(' ')) # glob glob
      units_of_coin_in_numeral = units_of_coin_in_galactic_words.pattern.split.map { |e| Translate.galactic_words_to_roman_number_assigments[e] }.join.to_s.to_arabic_number # converts glob glob  to 2
      if units_of_coin_in_numeral > 0
        unit_price = credit_price_of_metal_coins.to_f / units_of_coin_in_numeral # 2 Silver is 34 so Unit Price is 17.0
        TradeMineral.new(coin_name, unit_price)
      else
        clueless
      end
    else
      clueless
    end
  end

  def process_question
    if @line.start_with? "how many Credits is "
      main_question_part = @line.split("how many Credits is ")[1] # how many Credits is glob prok Silver ? gets glob prok Silver ?
      galatic_words = Translate.translate_question(main_question_part) # glob prok Silver gets glob prok
      trademineral = TradeMineral.get_trade_metal(main_question_part) # glob prok Silver gets Silver
      if trademineral && galatic_words
        galactic_words_to_roman = galatic_words.pattern.split.map { |e| Translate.galactic_words_to_roman_number_assigments[e] }.join.to_s.to_arabic_number
        trademineral_price_credit = (galactic_words_to_roman * trademineral.unit_price).to_i
        return "#{galatic_words.pattern.to_s} #{trademineral.coin_name} is #{trademineral_price_credit} Credits"
      end
    elsif @line.start_with? "how much is "
      main_question = @line.split("how much is ")[1] # how much is pish tegj glob glob ? gets pish tegj glob glob ?
      galatic_words = Translate.translate_question(main_question) #  pish tegj glob glob ? gets pish tegj glob glob
      if galatic_words
        conversion_value = galatic_words.pattern.split.map { |e| Translate.galactic_words_to_roman_number_assigments[e] }.join.to_s.to_arabic_number
        return "#{galatic_words.pattern.to_s} is #{conversion_value}"
      end
    end
    clueless
  end
end
