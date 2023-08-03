module Exercise
  module Arrays
    class << self
      def replace(array)
        maxim = array.first
        array.each { |element| maxim = element if element > maxim }

        array.map { |element| element.positive? ? maxim : element }
      end

      def search(array, query, low = 0, high = array.size - 1)
        return -1 if low > high
        
        mid = (low + high) / 2

        return mid if array[mid] == query

        query < array[mid] ? search(array, query, low, mid - 1) : search(array, query, mid + 1, high)
      end
    end
  end
end
