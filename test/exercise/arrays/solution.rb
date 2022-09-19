module Exercise
  module Arrays
    class << self
      def replace(array)
        array.map do |el|
          if el >= 0
            el = array.max
          else
            el
          end
        end
      end

      def search(_array, _query)
        if _array.empty? || _array.include?(_query) == false
          -1
        else
          _array.map.with_index { |a, i| a == _query ? i : nil }.compact.first
        end
      end
    end
  end
end
