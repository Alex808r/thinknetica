# frozen_string_literal: true

# Прямоугольный треугольник.
# Программа запрашивает у пользователя 3 стороны треугольника и определяет, является ли треугольник прямоугольным,
# используя теорему Пифагора и выводит результат на экран. Также, если треугольник является при этом равнобедренным
# (т.е. у него равны любые 2 стороны), то дополнитьельно выводится информация о том, что треугольник еще и равнобедренный.
# Подсказка: чтобы воспользоваться теоремой Пифагора, нужно сначала найти самую длинную сторону (гипотенуза)
# и сравнить ее значение в квадрате с суммой квадратов двух остальных сторон.
# Если все 3 стороны равны, то треугольник равнобедренный и равносторонний, но не прямоугольный.

puts 'Программа прямоугольный треугольник.'

# инициализируем массив в который поместим стороны треугольника
parties = [] # или parties = Array.new() используем [] т.к. создаем массив без параметров

print 'Введите сторону A: '
parties.push(Integer(gets.to_f)) # аналогичная запись .push(gets.to_i) но нет валидации на тип введенного значения

print 'Введите сторону B: '
parties.push(Integer(gets.to_f))

print 'Введите сторону C: '
parties.push(Integer(gets.to_f))

abort 'Треуголник равнобедренный и равносторонний, но не прямоугольный' if parties.uniq.size == 1

# Вычислим гипотинузу путем определения максимального значения из массива, далее удалим это значение,
# оставив в массиве только 2 катета.
hypotenuse = parties.delete(parties.max)

if hypotenuse**2 == parties.first**2 + parties.last**2
  puts 'Треугольник прямоугольный'
  puts 'А еще треугольник равнобедренный' if parties.first == parties.last
elsif parties.uniq.size == 1
  puts 'Треугольник равнобедренный'
else
  puts 'Треугольник разносторонний'
end
