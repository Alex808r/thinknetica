# frozen_string_literal: true

# Заполнить массив числами от 10 до 100 с шагом 5

# Вариант 1
array_1 = *(10..100).step(5)
p array_1

# Вариант 2
array_2 = [] # array_2 = Array.new
(10..100).step(5) { |i| array_2.push(i) }
p array_2

# Вариант 3
array_3 = [] # array_3 = Array.new
range = Range.new(10, 100)
range.step(5) { |i| array_3.push(i) }
p array_3

# Вариант 4
array_4 = Range.new(10, 100).step(5)
p array_4.to_a
