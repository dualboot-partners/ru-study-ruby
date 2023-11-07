module Exercise
  module Arrays
    class << self
      def my_max(array)
        maximum_value = array[0]
        array.each { |el| el > maximum_value ? maximum_value = el : maximum_value }
        maximum_value
      end

      def replace(array)
        maximum_value = my_max(array)
        array.map { |el| el.positive? ? maximum_value : el }
      end

      def search(array, query, minimum_value = 0, maximum_value = array.length - 1)
        return -1 if minimum_value > maximum_value || array[minimum_value] > query || array[maximum_value] < query

        index = (minimum_value + maximum_value) / 2

        return index if query == array[index]

        query < array[index] ? search(array, query, minimum_value, index - 1) : search(array, query, index + 1, maximum_value)
      end
    end
  end
end
