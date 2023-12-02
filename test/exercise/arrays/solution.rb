module Exercise
  module Arrays
    class << self
      def max_value(array)
        max = 0
        array.each do |item|
          max = item if item > max && item.positive?
        end
        max
      end

      def replace(array)
        array.map do |item|
          item.positive? ? max_value(array) : item
        end
      end

      def search(array, query)
        return -1 if array.size.zero? || query < array.first || query > array.last

        mid_index = array.length / 2
        return search(array.take(mid_index), query) if query < array[mid_index]

        min_index = search(array.drop(mid_index + 1), query)
        min_index.nil? ? nil : (mid_index + 1) + min_index
      end
    end
  end
end
