class CircularQueue
  def initialize(size)
    @queue = Array.new(size, nil)
    @next_slot, @oldest_slot = 0, 0
  end

  def enqueue(value)
    advance_oldest_slot if replacing_oldest?
    @queue[@next_slot] = value
    advance_next_slot
  end

  def dequeue
    dequeued_num = @queue[@oldest_slot]
    @queue[@oldest_slot] = nil
    advance_oldest_slot unless dequeued_num.nil?
    dequeued_num
  end
  
  private
  
  def replacing_oldest?
    @next_slot == @oldest_slot && @queue[@next_slot]
  end

  def advance_next_slot
    @next_slot = (@next_slot + 1) % @queue.size
  end
  
  def advance_oldest_slot
    @oldest_slot = (@oldest_slot + 1) % @queue.size
  end
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil