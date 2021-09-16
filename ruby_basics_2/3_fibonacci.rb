# Заполнить массив числами фибоначи до 100

# инициализируем массив для добавления чисел
fibonacci = [] # fibonacci = Array.new

# инициализируем переменную до начала цикла
i = 0

# основной цикл программы
loop do
  if fibonacci.count < 2      # (size, length)
    fibonacci.push(i)     # fibonacci << i
    i += 1                    # i = i + 1
  else
    i = fibonacci.last(2).reduce(:+) # аналогично i = fibonacci[-1] + fibonacci[-2]
    i <= 100 ? fibonacci.push(i) : break      # тернарный оператор
  end
end

puts fibonacci.to_s

# Вариант 2
a = 0
b   = 1
fib = []
while b <= 100
  fib.push(b)
  a, b = b, a + b
end