require_relative '../lib/simple_queue'

# test if queue works

q = SimpleQueue.new
q.enqueue('1')
q.enqueue('two')
q.enqueue('3')
q.enqueue({"id": 4, "type": "ELECTRIC", "passengers": "PEOPLE", "isDining": false, "consumption": 13})

puts("empty = #{q.empty?}")
puts("size = #{q.size}")
puts ''

until q.empty? do
    x = q.dequeue
    puts(x)
end

puts ''
puts("empty = #{q.empty?}")
puts("size = #{q.size}")
