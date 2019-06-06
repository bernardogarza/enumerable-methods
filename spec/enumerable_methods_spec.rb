#spec/enumerable_methods_spec.rb

require './enumerable_methods.rb'


describe Enumerable do

    arr = (1..6).to_a

    describe '#my_each' do
        it 'should iterate from every item on the array' do
            ans = []
            arr.my_each { |x| ans << x*2}
            expect(ans).to eql([2, 4, 6, 8, 10, 12])
        end
    end

    describe '#my_each_with_index' do
        it 'should add an index for each element' do
            str = ""
            arr.my_each_with_index { |x, y|  str += "#{y+1}. #{x}, " }
            expect(str).to eql("1. 1, 2. 2, 3. 3, 4. 4, 5. 5, 6. 6, ")
        end
    end

    describe 'my_select' do
        it 'should run trough the input to check which elements are true' do
            ans = arr.my_select { |x| x.even? }
            expect(ans).to eql([2, 4, 6])
        end
    end

    describe 'my_all?' do
        it 'should check if every comparasion is true, if not it will return false' do
            ans = arr.my_all? { |x| x.even? }
            expect(ans).to eql(false)
        end
    end

    describe 'my_any?' do
        it 'checks if the statement it\'s true on any of the values' do
            ans = arr.my_any? { |x| x.even? }
            expect(ans).to eql(true)
        end
    end

    describe 'my_none?' do
        it 'checks if none of the iteratetions are true' do
            ans = arr.my_none? { |x| x.even? }
            expect(ans).to eql(false)
        end
    end

    describe 'my_count' do
        it 'counts the number of times that my comparasion is true' do
            ans = arr.my_count { |x| x.even? }
            expect(ans).to eql(3)
        end
    end

    describe 'my_map' do
        it 'It creates a new array with the results' do
            ans = arr.my_map { |x| x * 2 }
            expect(ans).to eql([2, 4, 6, 8, 10, 12])
        end
    end

    describe 'my_inject' do
        it 'Combines all elements of enum by applying a binary operation, specified by a block or a symbol that names a method or operator' do
            ans = arr.my_inject{ |x, y| x + y }
            expect(ans).to eql(18)
        end
    end    
end