module Exercise
  module Arrays
    class << self
      def replace(array)
        max_element = array[0]

        array.each do |element|
          max_element = element if element > max_element
        end

        array.map do |element|
          if element >= 0
            max_element
          else
            element
          end
        end
      end

      def search(array, query)
        low = 0
        high = _array.length - 1

        while low <= high
          mid = (high + low) / 2

          if array[mid] == query
            mid
          elsif array[mid] < query
            low = mid + 1
          else
            high = mid - 1
          end
        end

        -1
      end
    end
  end
end
