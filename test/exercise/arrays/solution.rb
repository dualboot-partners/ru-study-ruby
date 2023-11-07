module Exercise
  module Arrays
    class << self
      def my_max(array)
        maximum_value = array[0]
        array.each { |el| el > maximum_value ? maximum_value = el : maximum_value }
        maximum_value
      end

      def replace(array)
        maximum_value = my_max(array)
        array.map { |el| el.positive? ? maximum_value : el }
      end

      def search(array, query, numerator = 1.0, denominator = 2.0)
        return -1 if array.empty? || denominator > 2**(array.length.to_s.length * 4)

        index = ((array.length - 1) * (numerator / denominator)).round

        if query < array[index]
          search(array, query, (numerator * 2) - 1, denominator * 2)
        elsif query > array[index]
          search(array, query, (numerator * 2) + 1, denominator * 2)
        elsif query == array[index]
          index
        end
      end
    end
  end
end
