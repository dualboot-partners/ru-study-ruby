module Exercise
  module Arrays
    class << self
      def findMax(array)
        $maxNum = 0;
        array.each_with_index do |num, i|
          $maxNum < num ? $maxNum = num : $maxNum;
        end
        $maxNum
      end

      def replace(array)
        $maxNum = findMax(array)
        array.map { |num| num > 0 ? $maxNum : num }
      end

      def search(_array, _query)
        low = 0
        high = _array.length - 1
        
          while (low <= high)
            mid = (low + high) / 2
            midVal = _array[mid]

            if (midVal < _query)
                low = mid + 1
            elsif (midVal > _query)
                high = mid - 1
            else
                return mid
            end
          end
          -1
      end
    end
  end
end
