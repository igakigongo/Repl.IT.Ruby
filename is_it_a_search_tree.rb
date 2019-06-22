module SearchTree
    class Node
        attr_reader :data
        attr_accessor :left, :right

        def initialize(data)
            @data = data
            @left = nil
            @right = nil
        end
    end

    class Tree 
        attr_reader :root

        def initialize(array)
            @root = build_tree(array)
        end

        def build_tree(array, i = 0)
            return nil if i >= array.length || array[i].zero?
    
            node = SearchTree::Node.new(array[i])
            node.left = build_tree(array, 2*i+1)
            node.right = build_tree(array, 2*i+2)
        
            node
        end

        def is_a_search_tree?
            a = internal_in_order(@root)
            a == a.sort
        end

        def in_order
            internal_in_order(@root).strip!
        end
        
        def post_order
            internal_post_order(@root).strip!
        end

        def pre_order
            internal_pre_order(@root).strip!
        end

        def internal_in_order(node)
            return [] if node.nil?

            in_order_array = internal_in_order(node.left)
            in_order_array << node.data
            in_order_array += internal_in_order(node.right)
        end

        def internal_post_order(node)
            node.nil? ? '' : "#{internal_post_order(node.left)}#{internal_post_order(node.right)} #{node.data}"
        end

        def internal_pre_order(node)
            node.nil? ? '' : "#{node.data} #{internal_pre_order(node.left)}#{internal_pre_order(node.right)}"
        end

        private :build_tree, :internal_in_order, :internal_post_order, :internal_pre_order
    end
end
