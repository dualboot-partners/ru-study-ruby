module Exercise
  module Arrays
    class << self
      def replace(array)
        maxim = array.first
        array.each { |element| maxim = element if element > maxim }

        array.map { |element| element.positive? ? maxim : element }
      end

      def search(array, query)
        return -1 if array.empty? || (array.size == 1 && array[0] != query)

        return 0 if array.size == 1 && array[0] == query

        low = 0
        high = array.size - 1

        while low <= high
          mid = (low + high) / 2
          if array[mid] == query
            return mid
          elsif array[mid] > query
            high = mid - 1
          else
            low = mid + 1
          end
        end
        -1
      end
    end
  end
end
