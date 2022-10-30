module Exercise
  module Arrays
    class << self
      def max(array)
        max = 0
        array.each_with_object(""){|el| el > max ? max = el : el }
        max
      end

      def replace(array)
        i = 0
        array.each_with_object(""){|el| el > 0 ? (array[i] = max(array) ;i += 1): i += 1}
        array
      end

      def search(array, query, index = 0)
        first = 0
        last = array.length - 1
        if array.size.zero?
          -1
        else
          mid = first + ((last - first) / 2)
          if array[mid] == query
            index + mid

          elsif array[mid] < query
            index = index + mid + 1
            search(array[mid + 1, last], query, index)
          else
            search(array[first, mid], query, index)
          end
        end
      end
    end
  end
end
