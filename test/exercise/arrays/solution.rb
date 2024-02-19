module Exercise
  module Arrays
    class << self
      def find_max(array)
        max = array[0]
        array.each do |i|
          i > max ? max = i : i
        end
        max
      end

      def replace(array)
        array.map! { |x| x.positive? ? Exercise::Arrays.find_max(array) : x }
      end

      def search(array, query, left = 0, right = array.length - 1)
        return -1 if left > right
        return -1 unless array.include? query

        mid = (left + right) / 2
        return mid if array[mid] == query
        return search(array, query, left, right - 1) if array[mid] > query
        return search(array, query, left + 1, right) if array[mid] < query
      end
    end
  end
end
