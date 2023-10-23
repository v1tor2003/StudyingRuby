# Exemplo de Programacao Estruturada

# Funcao para somar
def add_numbers(a, b)
  result = a + b
  return result
end

# Funcao para subtrair
def subtract_numbers(a, b)
  result = a - b
  return result
end

# Funcao para multiplicar
def multiply_numbers(a, b)
  result = a * b
  return result
end

# Funcao para dividir
def divide_numbers(a, b)
  if b != 0
    result = a / b
    return result
  else
    return "Nao eh possivel dividir por 0"
  end
end

# Programa Principal, o loop se repete ate que o usuario entre com `n`
loop do
  # Limpa a tela
  os = RbConfig::CONFIG['host_os']
  clear_screen = (os =~ /mswin|mingw|cygwin/i) ? 'cls' : 'clear'
  system(clear_screen)

  # Entrada do usuario
  puts 'Calculadora Estruturada'
  print "Insira o primeiro numero: "
  num1 = gets.chomp.to_f
  print "Insira o segundo numero: "
  num2 = gets.chomp.to_f

  # Executa as operacoes
  sum_result = add_numbers(num1, num2)
  diff_result = subtract_numbers(num1, num2)
  prod_result = multiply_numbers(num1, num2)
  div_result = divide_numbers(num1, num2)

  # Mostra resultados
  puts "Soma: #{sum_result}"
  puts "Diferenca: #{diff_result}"
  puts "Produto: #{prod_result}"
  puts "Divisao: #{div_result}"

  puts 'Deseja fazer novas operações? s/n'

  # Checa se o usario deseja continuar
  input = gets.chomp
  break if input == "n"
end
