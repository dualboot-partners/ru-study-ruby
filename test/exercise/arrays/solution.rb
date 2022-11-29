module Exercise
  module Arrays
    class << self
      def replace(array)
        max_num = array[0]
        array.each do |num|
          if num > max_num
            max_num = num
          end
        end  

        array.map do |num|
          if num > 0
            max_num
          else 
            num
          end
        end
      end

      def search(array, query)
        max = array.length - 1
        min = 0 

        while min <= max
          mid = (min + max) / 2
          if array[mid] == query
            return mid 
          elsif array[mid] > query
            max = mid - 1
          else 
            min = mid + 1 
          end
        end
        -1 
      end
    end
  end
end
