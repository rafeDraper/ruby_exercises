#Module recreation for learning pourposes 

module Enumerable
    def my_each
        i = 0
        while i < self.length
            yield self[i]
            i += 1
        end
    end

    def my_each_with_index
        i = 0
        while i < self.length
            yield self[i], i
            i += 1 
        end  
    end

    def my_select
        res = Array.new
        self.my_each do |el|
            if yield el
                res << el
            end
        end
        res
    end

    def my_all?
        self.my_each do |el| 
            return false if yield(el) == false
        end
        true
    end
    
    def my_any?
        self.my_each do |el|
            return true if yield(el) == true
        end
        false
    end

    def my_none?
        self.my_each do |el|
            return false if yield(el) == true
        end
        true
    end

    def my_count(arg=nil)
        result = []
        if block_given?
            result = self.my_select {|el| yield el }
            elsif arg != nil
                result = self.my_select {|el| el == arg}
            else
                return self.length
            end
            result.size
    end

    def my_map(proc=nil)
        result = []
        if proc
            self.my_each_with_index do |e, i|
                result[i] = proc.call(e)
            end
        else
            self.my_each_with_index do |e, i|
                result[i] = yield e
            end
        end
        result
    end

    def my_inject *args
        case args.length
        when 1
            if args[0].class == Symbol
                memo = self[0]
                self.my_each_with_index do |e, i|
                    next if i == 0
                    memo = memo.method(args[0]).call(e)
                end
            else
                memo = args[0]
                self.my_each do |e|
                    memo = yield(memo, e)
                end
            end
        when 2
            memo = args[0]
            self.my_each do |e|
                memo = memo.method(args[1]).call(e)
            end
        else
            memo = self[0]
            self.my_each_with_index do |e, i|
                next if i == 0
                memo = yield(memo, e)
            end
        end
        memo
    end

end

## Test your #my_inject by creating a method called #multiply_els which multiplies all the elements of the array together by using #my_inject, e.g. multiply_els([2,4,5]) #=> 40

def multiply_els(array)
    array.my_inject { |product, power| product * power}
end

