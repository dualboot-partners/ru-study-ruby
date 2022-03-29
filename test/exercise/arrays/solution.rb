module Exercise
  module Arrays
    class << self
      def replace(array)
        max_value = array.max
        array.map do |num|
          if num.positive?
            max_value
          else
            num
          end
        end
      end

      def search(_array, _query)
        0
      end
    end
  end
end
