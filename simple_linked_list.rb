class Element
  attr_reader :datum
  attr_accessor :next

  def initialize(datum)
    @datum = datum
    @next = nil
  end
end

class SimpleLinkedList
  def initialize
    @head = nil
    @tail = nil
    @array = []
  end

  def push(element)
    return assign_head(element) if @head.nil?

    assign_next(element) unless @head.nil?
  end

  def assign_head(element)
    @head = element
    @array << @head.datum
    self
  end

  def assign_next(element)
    @head.next = element
    @array << @head.next.datum
    self
  end

  def pop
    return @head if @head.nil?

    return @head if @head.next.nil?

    @head.next
  end

  def to_a
    @array
  end
end
