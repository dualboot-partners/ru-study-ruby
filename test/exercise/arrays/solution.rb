module Exercise
  module Arrays
    class << self
      def replace(array)
        max_value = array[0]
        array.each { |element| max_value = element if element > max_value }
        array.map { |element| element.positive? ? max_value : element }
      end

      def search(array, query, left = 0, right = array.length - 1)
        return -1 if left > right || query < array[left] || query > array[right]

        mid = (left + right) / 2
        return mid if array[mid] == query

        array[mid] > query ? search(array, query, left, mid - 1) : search(array, query, mid + 1, right)
      end
    end
  end
end
