module Exercise
  module Arrays
    class << self
      def replace(array)
        array.map { |e| e.positive? ? 100 : e }
      end

      def search(array, query, low = 0, high = array.size - 1)
        return -1 if low > high

        mid = (low + high) / 2

        if query == array[mid]
          mid
        elsif query < array[mid]
          search(array, query, low, mid - 1)
        else
          search(array, query, mid + 1, high)
        end
      end
    end
  end
end
