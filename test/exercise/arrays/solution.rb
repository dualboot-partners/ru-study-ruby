module Exercise
  module Arrays
    class << self
      def replace(array)
        max_num = array.max

        array.each_with_index do |elem, index|
          array[index] = max_num if elem.positive?
        end
      end

      def search(_array, _query)
        min_num = 0
        avg_num = _array.size / 2
        max_num = _array.size - 1

        return -1 unless _array.include?(_query)

        while _array[avg_num] != _query && min_num <= max_num
          if _query > _array[avg_num]
            min_num = avg_num + 1
          else
            max_num = avg_num - 1
          end

          avg_num = (min_num + max_num) / 2
        end
        avg_num
      end
    end
  end
end
