module Enumerable
    def my_each
        return self if !block_given?
        for i in 0..self.length-1
            yield(self[i])
        end
      self
    end
    
    def my_each_with_index
    end

    def my_select
    end

    def my_all?
    end

    def my_any?
    end

    def my_none?
    end

    def my_count
    end

    def my_map
    end

    def my_inject
    end
end
