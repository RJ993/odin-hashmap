require_relative 'lib/hashmap_class'

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
hashmap_test.set('moon', 'silver')
hashmap_test.set('dog', 'golden')

puts hashmap_test.get('dog')
puts hashmap_test.capacity