# Квадратное уравнение.
# Пользователь вводит 3 коэффициента a, b и с.
# Программа вычисляет дискриминант (D) и корни уравнения (x1 и x2, если они есть) и выводит значения
# дискриминанта и корней на экран. При этом возможны следующие варианты:
# Если D > 0, то выводим дискриминант и 2 корня
# Если D = 0, то выводим дискриминант и 1 корень (т.к. они в этом случае равны)
# Если D < 0, то выводим дискриминант и сообщение "Корней нет"
# Подсказка: Алгоритм решения с блок-схемой (www.bolshoyvopros.ru). 
# Для вычисления квадратного корня, нужно использовать `Math.sqrt`,
# например, `Math.sqrt(16)` вернет 4, т.е. квадратный корень из 16.

puts "Квадратное уравнение"
print "Введите первый коэффициент: "
a = Integer(gets.to_f) # или a = gets.to_f
print "Введите второй коэффициент: "
b = Integer(gets.to_f)
print "Введите третий коэффициент: "
c = Integer(gets.to_f)

# Вычислим дискриминант и корни
discriminant = b**2 - (4*a*c)

x1 = (-b + Math.sqrt(discriminant)) / a * 2
x2 = (-b - Math.sqrt(discriminant)) / a * 2

case
when discriminant <  0 then puts "Дискриминант: #{discriminant}. Корней нет."
when discriminant == 0 then puts "Дискриминант: #{discriminant}. Корень: #{x1}."
when discriminant >  0 then puts "Дискриминант: #{discriminant}. Корень 1: #{x1}, Корень 2: #{x2}."
end