class SimpleQueue
    attr_accessor :elements
    def initialize
        @elements = []
    end

    def enqueue(element)
        @elements.push(element)
    end

    def dequeue
        @elements.pop
    end

    def empty?
        @elements.empty?
    end

    def size
        @elements.length
    end
end