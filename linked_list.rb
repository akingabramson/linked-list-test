class LinkedList
  attr_reader :length
  
  def initialize(headNode)
    @head = headNode
    @length = 1
  end

  def display
    @head.display
  end

  def access(node_number)
    current_node = @head
    (node_number).times do
      current_node = current_node.child
    end

    current_node.value
  end

  def push(value)
    current_node = @head
    while current_node.child
      current_node = current_node.child
    end

    current_node.child = LinkNode.new(value)
    @length += 1
  end

end

class LinkNode
  attr_accessor :child, :value

  def initialize(value)
    @value = value
  end

  def display
    if self.child == nil
      return [self.value]
    else
      return [self.value] + self.child.display
    end 
  end

end


asher = LinkNode.new("Asher")
ryan = LinkNode.new("Ryan")
asher.child = ryan

patrick = LinkNode.new("Patrick")
ryan.child = patrick

list = LinkedList.new(asher)

list.push("Ned")

p list.display

