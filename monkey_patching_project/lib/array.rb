# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        if self.length == 0
            return nil
        end

        return self.max - self.min
    end

    def average
        if self.length == 0
            return nil
        end

        return self.sum / (self.length*1.0)
    end

    def median
        if self.length == 0
            return nil
        end

        if self.length.odd?
            idx = self.length/2
            return self.sort[idx]
        else
            idx = self.length/2
            first_ele = self.sort[idx]
            second_ele = self.sort[idx-1]
            return (first_ele + second_ele)/2.0
        end
    end

    def counts
        count = Hash.new(0)
        self.each do |num|
            count[num] += 1
        end
        return count
    end

    def my_count(target)
        count = 0
        self.each do |ele|
            if ele == target
                count += 1
            end
        end
        return count
    end

    def my_index(target)
        self.each_with_index do |ele, i|
            if ele == target
                return i
            end
        end

        return nil
    end

    def my_uniq
        hash = {}
        self.each {|ele| hash[ele]=true}

        return hash.keys
    end

    def my_transpose
        transposed = []
    
        self.each_with_index do |ele1, idx1|
          row = []
    
          self.each_with_index do |ele2, idx2|
            row << self[idx2][idx1]
          end
    
          transposed << row
        end
    
        transposed
    end

end
