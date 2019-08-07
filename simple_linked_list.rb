class Element
  attr_reader :datum
  attr_accessor :next

  def initialize(datum)
    @datum = datum
    @next = nil
  end
end

class SimpleLinkedList
  def initialize(passed_in_array = nil)
    @head = nil
    @array = []
    assign_passed_in_array_values(passed_in_array) if passed_in_array
  end

  def assign_passed_in_array_values(passed_in_array)
    passed_in_array.each do |number|
      element = Element.new(number)
      push(element)
    end
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
    if @head.next.nil?
      @head.next = element
      @array << @head.next.datum
      return self
    end

    unless @head.next.nil?
      @head.next.next = element
      @array << @head.next.next.datum
    end

    self
  end

  def pop
    return @head if @head.nil?

    if @head.next.nil?
      pop_value = @head
      @head = nil
      return pop_value
    end

    if @head.next.next.nil?
      pop_value = @head.next
      @head.next = nil
      return pop_value
    end

    pop_value = @head.next.next
    @head.next.next = nil
    pop_value
  end

  def to_a
    @array.reverse
  end

  def reverse!
    return reverse_head unless @array.empty?

    return self if @array.empty?
  end

  def reverse_head
    unless @head.next.next
      @head.next.next = @head
      @head = @head.next
      @head.next.next = nil
    end

    @array
  end
end
