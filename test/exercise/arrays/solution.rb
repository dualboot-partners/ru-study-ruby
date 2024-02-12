module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array[0]
        array.each do  |i|
          max = i if i >= max
        end
        array.map! { |x| x.positive? ? max : x }
      end

      def search(array, query)
        right = array.length - 1
        left = 0

        while left <= right
          mid = (left + right) / 2
          if array[mid] == query
            return mid
          elsif array[mid] > query
            right = mid - 1
          else
            left = mid + 1
          end
        end
        -1
      end
    end
  end
end
