class Node
    attr_accessor :value, :parent, :left_child, :right_child
    def initialize(value = nil)
        @value = value
        @left_child = nil
        @right_child = nil
        @parent = nil
    end
end

class BinaryTree
    attr_accessor :root, :list
    def initialize
        @list = []
    end

    def new_list_create array
      array.each do |i|
        @list << Node.new(i)
      end
    end

    def build_tree(array)
      new_list_create array
      done = 0
      @list.each do |item|
        @list.each_with_index do |second_item, index|
          next if item == second_item || second_item.parent || second_item == @list[0]
          if item.right_child == nil
            if second_item.parent == nil && item.value < second_item.value
              item.right_child = second_item
              second_item.parent = item
            end
          end
          if item.left_child == nil
            if second_item.parent == nil && item.value >= second_item.value
              item.left_child = second_item
              second_item.parent = item
            end
          end
        end
      end
    end
    def breadth_first_search value, queue = []
      return "Not found" if list.nil?
      queue.push @list[0] if queue == []
      if queue[0].value == value
        return queue[0]
      else
        if queue[0].left_child
          queue.push queue[0].left_child
      end
      if queue[0].right_child
        queue.push queue[0].right_child
      end
        queue.shift
        breadth_first_search value, queue
      end
    end

    def list_out
      @list.each do |i|
          if i.left_child && i.right_child
              puts "Element's value is #{i.value} and left_child is #{i.left_child.value} and right_child is #{i.right_child.value}"
          elsif i.left_child
              puts "Element's value is #{i.value} and left_child is #{i.left_child.value}"
          elsif i.right_child
              puts "Element's value is #{i.value} and right_child is #{i.right_child.value}"
          end
      end
    end
end
x = BinaryTree.new
x.build_tree [2, 1, 3, 4, 17, 22, 0, 1]

x.list_out 
y = x.breadth_first_search 0
puts y
