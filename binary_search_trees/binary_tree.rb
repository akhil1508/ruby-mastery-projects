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

    def new_list_create(array)
        array.each do |i|
            @list << Node.new(i)
        end
    end

    def build_tree(array)
        new_list_create array
        done = 0
        @list.each do |item|
            @list.each_with_index do |second_item, _index|
                next if item == second_item || second_item.parent || second_item == @list[0]
                if item.right_child.nil?
                    if second_item.parent.nil? && item.value < second_item.value
                        item.right_child = second_item
                        second_item.parent = item
                    end
                end
                next unless item.left_child.nil?
                if second_item.parent.nil? && item.value >= second_item.value
                    item.left_child = second_item
                    second_item.parent = item
                end
            end
        end
    end

    def breadth_first_search(value, queue = [])
        return 'Not found' if list.nil?
        queue.push @list[0] if queue == []
        if queue[0].value == value
            return queue[0]
        else
            queue.push queue[0].left_child if queue[0].left_child
            queue.push queue[0].right_child if queue[0].right_child
            queue.shift
            breadth_first_search value, queue
        end
    end

    def depth_first_search(value)
        stack = [@list[0]]
        loop do
            break if stack.empty?
            node = stack.pop
            stack << node.left_child if node.left_child
            stack << node.right_child if node.right_child
            # node.value
            return node if node.value == value
        end
        'Not found'
      end

    def dfs_rec(value, node = @list[0])
        dfs_recursive_helper(value, node)
        end

    def dfs_recursive_helper(value, current_node)
        return nil if current_node.nil?
        return current_node if current_node.value == value
        left_node = dfs_recursive_helper(value, current_node.left_child)
        return left_node unless left_node.nil?
        right_node = dfs_recursive_helper(value, current_node.right_child)
        return right_node unless right_node.nil?
end

    def list_out(list = @list)
        list.each do |i|
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
x.build_tree [2, 1, 3, 4, 17, 22, 0]

y = x.breadth_first_search 0
z = x.depth_first_search 2
x.list_out
puts z
z = x.dfs_rec 22
puts z
