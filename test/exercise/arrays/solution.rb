module Exercise
  module Arrays
    class << self
      def replace(array)
        max = maximum(array)
        new_array = []
        array.each do |arr|
          new_array << (arr.positive? ? max : arr)
        end
        new_array
      end

      def maximum(array)
        max = array[0]
        array.each do |arr|
          max = arr if arr > max
        end
        max
      end

      def search(_array, _query)
        high = _array.length - 1
        low = 0
        recur_search(_array, _query, low, high)
      end

      def recur_search(_array, _query, low, high)
        if low <= high
          mid = (low + high) / 2
          if _array[mid] < _query
            recur_search(_array, _query, mid + 1, high)
          elsif _array[mid] > _query
            recur_search(_array, _query, low, mid - 1)
          else
            mid
          end
        else
          -1
        end
      end
    end
  end
end
