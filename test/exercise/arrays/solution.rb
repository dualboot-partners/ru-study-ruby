module Exercise
  module Arrays
    class << self
      def replace(array)
        max = maximum(array)
        new_array = []
        array.each do |arr|
          new_array << (arr.positive? ? max : arr)
        end
        new_array
      end

      def maximum(array)
        max = array[0]
        array.each do |arr|
          max = arr if arr > max
        end
        max
      end

      def search(_array, _query)
        0
      end
    end
  end
end
