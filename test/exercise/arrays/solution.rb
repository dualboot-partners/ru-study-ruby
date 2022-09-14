module Exercise
  module Arrays
    class << self
      def replace(array)
        array_size = array.size
        # находим максимальное значение
        maximum = array[0]
        i = 1
        while i < array_size
          if array[i] > maximum
            maximum = array[i]
            i += 1
          end
        end
        # меняем положительные числа на максимальное значение
        for element in array do
          if element.positive? element = maximum
          end
        end
      end

      def search(array, query, first = 0, last = array.length - 1)
        return -1 if first > last || query < array[first] || query > array[last]

        middle = (first + (last - first) / 2)
        return middle if array[middle] == query

        if array[middle] > query
          search(array, query, first, middle - 1)
        else
          search(array, query, middle + 1, last)
        end
      end
    end
  end
end
