require_relative 'lib/hashmap_class'
require_relative 'lib/hashset_class'

hashmap_test = HashMap.new

hashmap_test.set('apple', 'red')
hashmap_test.set('banana', 'yellow')
hashmap_test.set('carrot', 'orange')
hashmap_test.set('dog', 'brown')
hashmap_test.set('elephant', 'gray')
hashmap_test.set('frog', 'green')
hashmap_test.set('grape', 'purple')
hashmap_test.set('hat', 'black')
hashmap_test.set('ice cream', 'white')
hashmap_test.set('jacket', 'blue')
hashmap_test.set('kite', 'pink')
hashmap_test.set('lion', 'golden')

hashset_test = HashSet.new

hashset_test.set('apple')
hashset_test.set('banana')
hashset_test.set('carrot')
hashset_test.set('dog')
hashset_test.set('elephant')
hashset_test.set('frog')
hashset_test.set('grape')
hashset_test.set('hat')
hashset_test.set('ice cream')
hashset_test.set('jacket')
hashset_test.set('kite')
hashset_test.set('lion')

puts hashset_test.get('lion')
puts hashset_test.has?('carrot')
hashset_test.remove('apple')
puts hashset_test.length
puts hashset_test.entries