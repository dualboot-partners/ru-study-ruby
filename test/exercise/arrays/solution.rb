module Exercise
  module Arrays
    class << self
      def replace(array)
        max_value = array.max
        
        array.map{ |value| value > 0 && value < max_value ? max_value : value }
      end

      def search(_array, _query)
        0
      end
    end
  end
end
