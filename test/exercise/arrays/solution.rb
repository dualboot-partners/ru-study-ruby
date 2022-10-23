module Exercise
  module Arrays
    class << self
      def max(array)
        max = array[0]
        array.each do |elem|
          max = elem if elem > max
        end
        max
      end

      def replace(array)
        max = max(array)
        array.each_with_index do |elem, ind|
          array[ind] = max if elem.positive?
        end
        array
      end

      def recursive_bin_search(array, query, low = 0, high = array.size - 1)
        return -1 if low > high

        mid = (low + high) / 2
        if query == array[mid]
          mid
        elsif query < array[mid]
          recursive_bin_search(array, query, low, mid - 1)
        else
          recursive_bin_search(array, query, mid + 1, high)
        end
      end

      def search(array, query)
        recursive_bin_search(array, query)
      end
    end
  end
end
