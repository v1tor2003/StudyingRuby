require 'ruby-prolog'
=begin
implication(a, b).
implication(b, c).
implication(c, d).
implication(c, x).

implies(A, B) :- implication(A, B).
implies(A, B) :- implication(A, Something), implies(Something, B).
=end
db = RubyProlog.new do
  implication['a', 'b'].fact
  implication['b', 'c'].fact
  implication['c', 'd'].fact
  implication['c', 'x'].fact

  implies[:A, :B] << implication[:A, :B]
  implies[:A, :B] << [
    implication[:A, :Something],
    implies[:Something, :B]
  ]
end


# What are all the direct implications of 'c'?
puts db.query{ implication['c', :X] }
#=> [{ X: 'd' }, { X: 'x' }]

# What are all the things that can directly imply?
puts db.query{ implication[:X, :_] }
#=> [{ X: 'a' }, { X: 'b' }, { X: 'c' }, { X: 'c' }]

# What are all the things 'a' implies?
puts db.query{ implies['a', :X] }
#=> [{ X: 'b' }, { X: 'c' }, { X: 'd' }, { X: 'x' }]
