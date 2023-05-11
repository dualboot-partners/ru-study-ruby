module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        i = 0

        until i >= self.size
          yield(self[i])
          i += 1
        end

        self
      end

      # Написать свою функцию my_map
      def my_map; end

      # Написать свою функцию my_compact
      def my_compact; end

      # Написать свою функцию my_reduce
      def my_reduce(accum = nil)
        self.my_each { |n| accum.nil? ? accum = n : accum = yield(accum, n) }
        return accum
      end
    end
  end
end
