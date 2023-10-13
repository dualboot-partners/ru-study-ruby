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

      def binary_search_recursive(array, target, low, high)
        return -1 if low > high

        mid = (high + low) / 2

        if array[mid] == target
          mid
        elsif array[mid] < target
          binary_search_recursive(array, target, mid + 1, high)
        else
          binary_search_recursive(array, target, low, mid - 1)
        end
      end

      def search(array, query)
        binary_search_recursive(array, query, 0, array.length - 1)
      end
    end
  end
end
