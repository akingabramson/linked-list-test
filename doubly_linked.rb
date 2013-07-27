# require_relative "linked_list"

class DoublyLinkedList
  attr_reader :head, :tail, :length

  def initialize(value)
    @head = DoublyLinkedNode.new(value)
    @tail = @head
    @length = 1
  end

  def push(value)
    new_node = DoublyLinkedNode.new(value)
    @tail.child = new_node
    new_node.parent = @tail

    @tail = new_node
    @length +=1

    @tail
  end

  def pop
    popped = @tail
    @tail = popped.parent
    @tail.child = nil

    @length -= 1

    popped
  end

  def display
    display = []

    current_node = @head
    while current_node
      display << current_node.value
      current_node = current_node.child
    end

    display
  end

  def insert(value, new_value)
    new_node = DoublyLinkedNode.new(new_value)
    new_parent_node = access(value)

    new_child_node = new_parent_node.child 
    new_node.parent = new_parent_node
    new_node.child = new_child_node

    new_parent_node.child = new_node if new_parent_node.child
    new_child_node.parent = new_node 

  end

  def access(value)
    current_node = @head
    until current_node.nil? || (current_node.value == value)
      current_node = current_node.child
    end

    current_node
  end


end

class DoublyLinkedNode
  attr_accessor :parent, :child, :value

  def initialize(value)
    @value = value
  end
end


list = DoublyLinkedList.new("Asher")

list.push("Ryan")

list.push("Ned")

list.insert("Ryan", "Patrick")


p list.display


