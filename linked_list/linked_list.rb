class LinkedList
    attr_accessor :list
    def initialize
        @list = []
    end

    def append
        new_node = Node.new
        @list << new_node
    end

    def prepend
        new_node = Node.new
        @list.unshift new_node
    end

    def size
        @list.length
    end

    def head
        @list.first
    end

    def tail
        @list.last
    end

    def at(index)
        @list[index]
    end

    def find(data)
        @list.each_with_index do |i, index|
            if i.value == data
                return index
            else return -1
            end
        end
    end

    def pop
        @list.pop
    end

    def contains?(value)
        @list.each_with_index do |i, _index|
            return true if i.value == value
        end
        false
    end

    def to_s
        @list.each do |i|
            print "#{i.value} -> "
        end
        print "nil "
    end

    def insert_at(index, value_to_insert)
        @list[index].value = value_to_insert
    end

    def remove_at(index)
        @list.delete_at index
    end
end

class Node
    attr_accessor :value, :next_node
    def initialize
        @value = nil
        @next_node = nil
    end

    def value
        @value
    end
end

linkedlist = LinkedList.new
linkedlist.append
linkedlist.insert_at(0,1)
linkedlist.to_s
linkedlist.prepend
linkedlist.insert_at(0,2)
linkedlist.to_s
puts linkedlist.contains? 5
puts linkedlist.find(2)
puts linkedlist.head
puts linkedlist.tail
puts linkedlist.at(0)
linkedlist.remove_at(0)
linkedlist.to_s
