class LinkedList
  
  class Node
    attr_accessor :data, :next
    def initialize data
      self.data = data
      self.next = nil
    end
    
    def to_s
      "Data: #{self.data}, Next: #{self.next ? "Existe" : "Nil"}"
    end
  end

  attr_accessor :head, :tail, :length

  def initialize
    self.head = nil
    self.tail = nil
    self.length = 0
  end

  def insert data
    node = Node.new data
    
    unless head
      self.head = node
    else
      self.tail.next = node
    end

    self.tail = node
    self.length += 1
  end

  def remove node
    return nil unless node

    if head == node
      if head.next.nil?
        self.head = self.tail = nil
      else
        self.head = self.head.next
      end
    else
      tmp = self.head
      while tmp && tmp.next != node
        tmp = tmp.next
      end
      tmp.next = node.next if tmp
    end
    self.length -= 1
  end

  def cat list
    return nil unless list
    self.tail.next = list.head
    self.length += list.length
  end

  def clear
    while self.length > 0
      puts self.head
      remove self.head
    end
    puts "*********************"
  end

  def find_first &predicate
    return nil unless block_given?
    current = self.head
    while current
      return current if predicate.call(current)
      current = current.next
    end
  end

  def each
    return nil unless block_given?
    current = self.head
    while current
      yield current
      current = current.next
    end
  end

  def print
    if self.length == 0
      puts "empty"
    else
      self.each { |n| puts n.data }
    end
  end
end

lista = LinkedList.new

lista.insert(1)
lista.insert(2)
lista.insert(3)

otra_lista = LinkedList.new
otra_lista.insert(77)
otra_lista.insert(45)

lista.cat(otra_lista)
lista.print

lista.clear
lista.print




