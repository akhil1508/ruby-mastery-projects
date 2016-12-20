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

    def build_tree(array)
        return -1 if array.empty?
        @root = Node.new(array.shift)
        @list << @root
        array.each do |item|
            if @root.left_child.nil? && left_check(@list, item)
                @root.left_child = Node.new(item) if @root.value >= item
            end
            if @root.right_child.nil? && right_check(@list, item)
                @root.right_child = Node.new(item) if @root.value < item
            end
        end
        build_tree array
    end

    def left_check(list, element)
        list.each do |i|
            if i.left_child
                return false if i.left_child.value == element
        end
        end
        true
  end

    def right_check(list, element)
        list.each do |i|
            if i.right_child
                return false if i.right_child.value == element
              end
        end
        true
    end
end

x = BinaryTree.new
x.build_tree [2, 1, 3, 4]
x.list.each do |i|
    if i.left_child && i.right_child
        puts "Element's value is #{i.value} and left_child is #{i.left_child.value} and right_child is #{i.right_child.value}"
    elsif i.left_child
        puts "Element's value is #{i.value} and left_child is #{i.left_child.value}"
    elsif i.right_child
        puts "Element's value is #{i.value} and right_child is #{i.right_child.value}"
    end
end
