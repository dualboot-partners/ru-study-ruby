module Exercise
  module Arrays
    class << self
      def replace(array)
        max = -999999999
        array.each { |item| max = item if item > max }
        array.map { |item| item.negative? ? item : max }
      end

      def search(_array, _query)
        return -1 if _array.empty?

        mid_index = _array.length / 2

        case _query <=> _array[mid_index]
        when -1
          search(_array.take(mid_index), _query)
        when 0
          mid_index
        when 1
          subs = search(_array.drop(mid_index + 1), _query)
          subs == -1 ? -1 : (mid_index + 1) + subs
        end
      end
    end
  end
end
