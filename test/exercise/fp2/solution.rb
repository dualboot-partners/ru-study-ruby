module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(i = 0, &block)
        
        while i < size
          block.call(self[i])
          return my_each(i + 1, &block)
        end
        self
      end

      # Написать свою функцию my_map
      def my_map(&block)
        my_result = MyArray.new
        i = 0

        while i < size
          my_result << block.call(self[i])
          i += 1
        end
        my_result
      end

      # Написать свою функцию my_compact
      def my_compact(*)
        my_result = MyArray.new
        i = 0

        while i < size
          my_result << self[i] unless self[i].nil?
          i += 1
        end
        my_result
      end

      # Написать свою функцию my_reduce
      def my_reduce(i = 0, acc = nil, &block)
        # i = 0

        if acc.nil?
          acc = self[0]
          # return my_reduce(i + 1, acc, &block) 
          i = 1
        end

        while i < size
          acc = (block.call acc, self[i])
          return my_reduce(i + 1, acc + i, &block) 
          # i += 1
        end
        acc
      end
    end
  end
end
