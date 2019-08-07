class Element
  attr_reader :datum
  attr_accessor :next

  def initialize(datum)
    @datum = datum
    @next = nil
  end
end

class SimpleLinkedList
  def initialise
    @head = nil
    @tail = nil
    @array = []
  end

  def push(element)
    @head = element if @head.nil?

    @tail = element unless @head.nil?

    self
  end

  def pop
    return @head if @tail.nil?

    @tail
  end
end
