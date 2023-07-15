module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.max
        array.map { |v| v.positive? ? max : v }
      end

      def search(_array, _query)
        low_index = 0
        high_index = array.size

        while low_index < high_index
          mid = (low_index + high_index) / 2
          return mid if array[mid] == query

          if array[low_index] <= query && query < array[mid]
            high_index = mid
          elsif array[mid] < query && query <= array[high_index - 1]
            low_index = mid
          else
            break
          end
        end

        -1
      end
    end
  end
end
