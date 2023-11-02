module Exercise
  module Arrays
    class << self
      def replace(array)
        max = 0
        item = 0
        array.size.times { |n| max = array[n] if max < array[n] }
        while array.size > item
          if (array[item]).positive?
            array[item] = max
          else
            array[item]
          end
          item += 1
        end
        array
      end

      def search(array, query)
        return -1 if array.size.zero? || query < array.first || query > array.last

        mid_index = array.length / 2

        case query <=> array[mid_index]
        when -1
          search(array.take(mid_index), query)
        when 0
          mid_index
        when 1
          subs = search(array.drop(mid_index + 1), query)
          subs.nil? ? nil : (mid_index + 1) + subs
        end
      end
    end
  end
end
