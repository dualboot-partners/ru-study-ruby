module Exercise
  module Arrays
    class << self
      def replace(array)
        max_el = array.inject do |el, el_next|
          el > el_next ? el : el_next
        end
        array.map { |el| el.negative? ? el : max_el }
      end

      def search(_array, _query)
        mid = (_array.length - 1) / 2
        return -1 if mid <= 0 && _array[mid] != _query

        return mid if _array[mid] == _query

        if _array[mid] < _query
          next_iter = search(_array[mid + 1..], _query)
          next_iter == -1 ? -1 : mid + next_iter + 1
        else
          search(_array[0..mid], _query)
        end
      end
    end
  end
end
