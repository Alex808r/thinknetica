# frozen_string_literal: true

# Сумма покупок.
# Пользователь вводит поочередно название товара, цену за единицу и кол-во купленного товара
# (может быть нецелым числом). Пользователь может ввести произвольное кол-во товаров до тех пор,
# пока не введет "стоп" в качестве названия товара. На основе введенных данных требуетеся:
# Заполнить и вывести на экран хеш, ключами которого являются названия товаров, а значением - вложенный хеш,
# содержащий цену за единицу товара и кол-во купленного товара. Также вывести итоговую сумму за каждый товар
# Вычислить и вывести на экран итоговую сумму всех покупок в "корзине"

puts 'Сумма покупок.'

# создаем хеш для покупок
basket = {}

# бесконечный цикл с условием выхода stop
loop do
  print 'Введите название товара или stop для выхода: '
  product = gets.strip.capitalize
  break if product.downcase == 'stop'

  print 'Введите цену за единицу товара: '
  price = gets.to_f
  break puts 'Цена товара должна быть больше 0' if price.negative?

  print 'Введите количество товара: '
  number = gets.to_f
  break puts 'Количество товара должна быть больше 0' if price.negative?

  basket[product] = { number: number, price: price }
end

# переменная для суммирования всех покупок в корзине
full_basket_price = 0

basket.each do |product_name, value|
  sum_to_product = value[:number] * value[:price]
  puts "Товар: #{product_name}. Количество: #{value[:number]}. Цена #{value[:price]}. Всего за товар: #{sum_to_product}"
  full_basket_price += sum_to_product
end

puts "Стоимость всех покупок:#{full_basket_price}"
