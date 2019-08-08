# frozen_string_literal: true

# Element class
class Element
  attr_reader :datum
  attr_accessor :next

  def initialize(datum)
    @datum = datum
    @next = nil
  end
end

# Simple Linked List class
class SimpleLinkedList
  def initialize(passed_in_array = [])
    @head = nil
    assign_passed_in_array_values(passed_in_array)
  end

  def push(element)
    element.next = @head unless @head.nil?
    @head = element
    self
  end

  def pop
    return @head if @head.nil?

    element = @head
    @head = element.next
    element.next = nil
    element
  end

  def to_a
    temp_array = create_temp_array
    temp_array.map(&:datum)
  end

  def reverse!
    temp_array = create_temp_array
    assign_passed_in_array_values(temp_array)
    self
  end

  private

  def assign_passed_in_array_values(passed_in_array)
    passed_in_array.each do |element|
      push(Element.new(element)) if element.is_a?(Integer)
      push(element) if element.is_a?(Element)
    end
  end

  def create_temp_array
    temp_array = []
    temp_array << pop until @head.nil?
    temp_array
  end
end
