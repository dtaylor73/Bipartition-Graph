
class Queue
  def initialize
    @store = Array.new(4)
    @front = @back = -1
    @data = ''
    # - 1 gets put into @back and the value of @back is put into @front 
  end

  def enqueue(element)
    # ## if the queue is empty
    if @front == -1 && @back == -1
      @front = 0
      @back = 1
      @store[@front] = element
    elsif @front == @back
      # if the queue if full
      raise ArgumentError.new('The queue is full') 
    else
      @store[@back] = element
      @back = (@back + 1) % @store.length
    end 
  end

  def dequeue
    if @front == -1
      raise ArgumentError, "Queue Empty"
    else
      value = @store[@front]

      @store[@front] = nil

      @front = (@front +  1) % @store.length
      
      if @front == @back 
        @front = @back = -1
      end
      return value
    end
 
  end

  def empty?
    return true if @front == @back

    return false
  end


  def to_s
    return @store.compact.to_s
  end
end 