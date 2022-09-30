module Exercise
  module Arrays
    class << self
      def replace(array)
        array.map { |num| num.positive? ? array.max : num }
      end

      def search(array, query)
        array.find_index { |element| element == query } || -1
      end
    end
  end
end
