module Exercise
  module Arrays
    class << self
      def replace(array)
        maximum_value = 0
        array.each { |el| el > maximum_value ? maximum_value = el : maximum_value }
        array.map! { |el| el.positive? ? maximum_value : el }
      end

      def search(_array, _query)
        0
      end
    end
  end
end
