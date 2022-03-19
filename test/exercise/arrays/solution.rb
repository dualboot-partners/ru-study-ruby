module Exercise
  module Arrays
    class << self
      def replace(array)
        max = -999999999
        array.each { |item| max = item if item > max }  
        array.map { |item| item < 0 ? item : max }
      end

      def search(_array, _query)
        middle = _array.length / 2
        min = 0
        max = _array.length - 1

        while min <= max
          if _array[middle] == _query
            return middle
          elsif _array[middle] < _query
            min = middle + 1
            middle = (min + max) / 2
          else
            max = middle - 1
            middle = (min + max) / 2
          end
        end
        -1
      end
    end
  end
end
