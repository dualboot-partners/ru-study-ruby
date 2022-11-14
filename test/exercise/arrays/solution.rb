module Exercise
  module Arrays
    class << self
      def replace(array)
        arr = []
        max = max_number(array)

        for number in array
          if number >= 0
            arr.push(max)
          else
            arr.push(number)
          end
        end

        arr
      end

      def search(array, query)
        low = 0
        high = array.length - 1

        while low <= high
          mid = (low + high) >> 1
          mid_val = array[mid]

          if mid_val < query
            low = mid + 1
          elsif mid_val > query
            high = mid - 1
          else
            return mid
          end
        end

        -1
      end

      private

      def max_number(array)
        max_number = 0
        for number in array
          max_number = number if number > max_number
        end
        max_number
      end
    end
  end
end
