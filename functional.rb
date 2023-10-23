# Funções puras
# A funcaoo dobro eh uma funcao pura, 
# pois sempre produz o mesmo resultado para a mesma entrada.
def dobro(x)
  x * 2
end

puts dobro 3

# Mapeamento (map)
# A funcao map aplica a funcao dobro a cada elemento da lista.
numeros = [1, 2, 3, 4, 5]
dobro_numeros = numeros.map { |x| dobro(x) }
puts dobro_numeros.inspect

# Reducao (reduce)
# A funcao reduce (tambem conhecida como fold) combina os elementos da lista em um unico resultado.
soma = numeros.reduce(0) { |acc, x| acc + x }
puts soma

# Funcoes de ordem superior
# A funcao filtro aceita uma funcao de filtro e uma lista, retornando apenas os elementos que satisfazem o filtro.
def filtro(lista, funcao_filtro)
  lista.select(&funcao_filtro)
end

pares = filtro(numeros, ->(x) { x.even? })
puts pares.inspect

# Recursao
# A funcao fatorial eh definida recursivamente.
def fatorial(n)
  if n == 0
    1
  else
    n * fatorial(n - 1)
  end
end

puts fatorial(5)