module Exercise
  module Arrays
    class << self
      def replace(array)
        array.map { |el| el.positive? ? array.max : el }
      end

      def search(_array, _query)
        max = _array.length - 1
        min = 0

        while min <= max
          mid = (min + max) / 2
          if _array[mid] == _query
            return mid
          elsif _array[mid] > _query
            max = mid - 1
          else
            min = mid + 1
          end
        end

        -1
      end
    end
  end
end
