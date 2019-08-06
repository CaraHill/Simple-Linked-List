class Element
  attr_reader :datum
  attr_accessor :next

  def initialize(datum)
    @datum = datum
    @next = nil
  end
end

class SimpleLinkedList
  attr_accessor :head

  def initialise
    @head = nil
  end

  def push(element)
    @head = element
  end

  def pop
    @head
  end
end
