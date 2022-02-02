module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array[0]
        array.each { |el| el > max ? max = el : max }.map { |el| el.positive? ? max : el }
      end

      def search(array, query)
        return -1 if array.empty? || (array.last < query)

        mid = array.count / 2
        if query == array[mid]
          mid
        elsif query < array[mid]
          search(array[0..mid - 1], query)
        elsif query > array[mid]
          search(array[mid + 1..-1], query) + mid + 1
        end
      end
    end
  end
end
