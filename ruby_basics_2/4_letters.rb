# Заполнить хеш гласными буквами,
# где значением будет являтся порядковый номер буквы в алфавите (a - 1).

alphabet = ('a'..'z').to_a

vowel_letters = {} # vowel_letters = Hash.new

alphabet.each_with_index do |letter, index|
  vowel_letters[letter] = index + 1 if %w[a e i o u y].include?(letter)
end

p vowel_letters
