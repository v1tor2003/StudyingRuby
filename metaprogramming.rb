class Calculator
  OPERATIONS = {
    add: '+',
    subtract: '-',
    multiply: '*',
    divide: '/',
    # exp: '**'
  }

  def initialize
    OPERATIONS.each do |operation, operator|
      define_singleton_method("#{operation}_numbers") do |a, b|
        b != 0 ? a.send(operator, b) : "Nao eh possivel dividir por 0"
      end
    end
  end
end

class CalculatorProgram
  def initialize
    @calculator = Calculator.new
  end

  def run
    loop do
      system(clear_screen_command)

      puts 'Calculadora Usando Metaprogramação'
      print "Insira o primeiro numero: "
      num1 = gets.chomp.to_f
      print "Insira o segundo numero: "
      num2 = gets.chomp.to_f

      display_results(num1, num2)

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

  def display_results(a, b)
    Calculator::OPERATIONS.each do |operation, _|
      result = @calculator.send("#{operation}_numbers", a, b)
      puts "#{operation.capitalize}: #{result}"
    end
  end
end

# Run the program
CalculatorProgram.new.run
