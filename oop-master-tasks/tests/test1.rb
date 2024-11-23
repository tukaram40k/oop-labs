require_relative '../lib/main_queue'

q = MainQueue.new
q.enqueue('w')
q.enqueue('w')
q.enqueue('e')
q.enqueue('w')

puts(q.empty?)
puts(q.size)
q.elements.each do
    puts(q.elements)
    puts(" ")
    x = q.dequeue
    puts(x)
end
puts(q.empty?)
puts(q.size)
