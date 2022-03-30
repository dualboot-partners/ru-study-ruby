module Exercise
  module Arrays
    class << self
      def replace(array)
        array.map { |el| el.positive? ? array.max : el }
      end

      def search(array, query)
        iter = lambda { |first_ind, last_ind|
          return -1 if first_ind > last_ind

          middle_ind = (first_ind + last_ind) / 2
          middle_item = array[middle_ind]

          return middle_ind if middle_item == query

          new_first_ind = middle_item < query ? middle_ind + 1 : first_ind
          new_last_ind = middle_item < query ? last_ind : middle_ind - 1

          iter.call(new_first_ind, new_last_ind)
        }

        iter.call(0, array.length - 1)
      end
    end
  end
end
