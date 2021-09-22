# frozen_string_literal: true

# Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя).
# Найти порядковый номер даты, начиная отсчет с начала года. Учесть, что год может быть високосным.
# (Запрещено использовать встроенные в ruby методы для этого вроде Date#yday или Date#leap?)
# Алгоритм опредления високосного года: www.adm.yar.ru

days_on_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
puts "Количество дней по месяцам: #{days_on_month}"

print 'Ввидеите число: '
day = Integer(gets) # day = gets.to_i

print 'Введите месяц: '
month = Integer(gets)

print 'Введите год: '
year = Integer(gets)

# Проверяем, является ли год високосным.
leap_year = ((year % 4).zero? && year % 100 != 0) || (year % 400).zero?
days_on_month[1] = 29 if leap_year == true

abort 'Выбранной даты не существует' if day > days_on_month[month - 1] || month > days_on_month.size

# без тернарного оператора
# if month == 1
#   day
# else
#   months[0...(month - 1)].each do |i|  #  months[0..(month - 2)].each do |i|
#     day += i
#   end
# end

unless month == 1
  # days_on_month[0...(month - 1)].each do |i|  #  months[0..(month - 2)].each do |i|
  #   day += i
  # end

  # аналогичная запись
  result = days_on_month[0...(month - 1)].reduce(:+) + day
end

puts "Порядковый номер даты #{result}"
