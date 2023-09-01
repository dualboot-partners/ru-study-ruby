module Exercise
  module Arrays
    class << self
      def replace(array)
        max_value = array[0]
        array.each { |element| max_value = element if element > max_value }
        array.map! { |element| element.positive? ? max_value : element }
      end

      def search(array, query, left = 0, right = array.length - 1)
        return -1 if left > right

        mid = (left + right) / 2
        if array[mid] == query
          mid
        elsif array[mid] > query
          search(array, query, left, mid - 1)
        else
          search(array, query, mid + 1, right)
        end
      end
    end
  end
end
