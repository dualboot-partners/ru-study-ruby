module Exercise
  module Arrays
    class << self
      def replace(array)
        max_value = array.max
        
        array.map{ |value| value > 0 && value < max_value ? max_value : value }
      end

      def search(_array, _query)
        default_return_value = -1

        if _array.empty?
          return default_return_value
        end

        start_index = 0
        end_index = _array.length - 1

        while start_index <= end_index
          middle_index = start_index + (end_index - start_index) / 2
          current_value = _array[middle_index]   

          if current_value == _query
            return middle_index
          elsif current_value < _query
            start_index = middle_index + 1
          else
            end_index = middle_index - 1
          end
        end

        default_return_value
      end
    end
  end
end
