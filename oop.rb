class Calculator
  def add_numbers(a, b)
    a + b
  end

  def subtract_numbers(a, b)
    a - b
  end

  def multiply_numbers(a, b)
    a * b
  end

  def divide_numbers(a, b)
    b != 0 ? a / b : "Nao eh possivel dividir por 0"
  end
end

class CalculatorProgram
  def initialize
    @calculator = Calculator.new
  end

  def run
    loop do
      system(clear_screen_command)
      puts 'Calculadora Orientada a Objetos'
      print "Insira o primeiro numero: "
      num1 = gets.chomp.to_f
      print "Insira o segundo numero: "
      num2 = gets.chomp.to_f

      sum_result = @calculator.add_numbers(num1, num2)
      diff_result = @calculator.subtract_numbers(num1, num2)
      prod_result = @calculator.multiply_numbers(num1, num2)
      div_result = @calculator.divide_numbers(num1, num2)

      display_results(sum_result, diff_result, prod_result, div_result)

      puts 'Deseja fazer novas operações? s/n'
      input = gets.chomp
      break if input == "n"
    end
  end

  private

  def clear_screen_command
    os = RbConfig::CONFIG['host_os']
    (os =~ /mswin|mingw|cygwin/i) ? 'cls' : 'clear'
  end

  def display_results(sum, difference, product, division)
    puts "Soma: #{sum}"
    puts "Diferenca: #{difference}"
    puts "Produto: #{product}"
    puts "Divisao: #{division}"
  end
end

# Run the program
CalculatorProgram.new.run
