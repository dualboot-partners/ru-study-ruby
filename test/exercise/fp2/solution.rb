module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(i = 0, &block)
        if self.size > i
          yield(self[i])
          self.my_each(i + 1, &block)
        else
          self
        end
      end

      # Написать свою функцию my_map
      def my_map;
        self.my_reduce(MyArray.new) { |result, n| result << yield(n) }
      end

      # Написать свою функцию my_compact
      def my_compact;
        self.my_reduce(MyArray.new) { |result, n| n.nil? ? result : result << n }
      end

      # Написать свою функцию my_reduce
      def my_reduce(accum = nil)
        self.my_each { |n| accum.nil? ? accum = n : accum = yield(accum, n) }
        return accum
      end
    end
  end
end
