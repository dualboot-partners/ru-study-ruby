module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array[0]

        array.each { |el| el > max ? max = el : el }

        array.map { |el| el > 0 ? max : el }
      end

      def search(_array, _query, first = 0, last = _array.length - 1)
        return -1 if first > last || _query < _array[0] || _query > _array[-1]

        avg = (first + (last-first)/2)
        return avg if _array[avg] == _query

        _array[avg] > _query ? search(_array, _query, first, avg - 1) : search(_array, _query, avg + 1, last)
      end
    end
  end
end
