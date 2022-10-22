module Exercise
  module Arrays
    class << self
      def replace(array)
        max = 0
        array.each do |el|
          max = el if el > max
        end
        i = 0
        array.each do |el|
          if el.positive?
            array[i] = max
            i += 1
          elsif el <= 0
            i += 1
          end
        end
        array
      end

      def search(_array, _query, count = 0)
        first = 0
        last = _array.length - 1
        if _array.size.zero?
          -1
        else
          mid = first + ((last - first) / 2)
          if _array[mid] == _query
            count + mid

          elsif _array[mid] < _query
            count = count + mid + 1
            search(_array[mid + 1, last], _query, count)
          else
            search(_array[first, mid], _query, count)
          end
        end
      end
    end
  end
end
