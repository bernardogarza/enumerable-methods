module Enumerable
    def my_each
        return self if !block_given?
        for i in 0..self.length-1
            yield(self[i])
        end
      self
    end
    
    def my_each_with_index
        return self if !block_given?
        for i in 0..self.length-1
            yield(self[i], i)
        end
    end

    def my_select
        return self if !block_given?
        arr = []
        my_each {
            |x|
            if yield(x) == true
                arr << x
            end
        }
        arr
    end

    def my_all?
        return self if !block_given?
        my_each {
          |x| 
          if yield(x) == false
            return false
          end
        }
        true
    end

    def my_any?
        return self if !block_given?
        my_each {
          |x| 
          if yield(x) == true
            return true
          end
        }
        false
    end

    def my_none?
        return self if !block_given?
        my_each {
          |x|
          if yield(x) == true
            return false
          end
        }
        true
    end

    def my_count
        return self.length if !block_given?
        i = 0
        my_each {
            |x|
            if x == true
                i += 1
            end
        }
        i
    end

    def my_map
        return self if proc.nil? && !block_given?
        arr = []
        my_each {
          |x|
          val = proc.nil? ? yield(x) : proc.call(x)
          arr << val
        }
        arr
    end

    def my_inject (acc = self)
        return self if !block_given?
        my_each {
            |x|
            if x == acc
                next
            else
                acc = yield(acc, x)
            end
        }
    end
end


=begin
****************************************************************
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>TESTS<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

arr = [1, 3, 5]
arr.my_each { |x| puts x*2}

arr = [1, 3, 5]
arr.my_each_with_index { |x, y| puts "#{y}. #{x}"}

rnd = [1, 3, 5, 2, 4]
rnd.my_select { |x| x.even?}

ar = [2, 4, 6]
ar.my_all? { |x| x.even?}

ar = [2, 4, 6, 3]
ar.my_any? { |x| x.even?}

ar = [3, 1, 1, 3]
ar.my_none? { |x| x.even?}

ar = [3, 1, 1, 2]
ar.my_count { |x| x.even?}

ar = [3, 1, 1, 2]
nar=ar.my_map{ |x| x.even?}
****************************************************************
=end