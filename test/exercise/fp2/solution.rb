module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for el in self do
          yield el
        end
        self
      end

      # Написать свою функцию my_map
      def my_map
        my_reduce(MyArray.new) { |arr, el| arr << (yield el) }
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(MyArray.new) { |arr, el| el.nil? ? arr : arr << el }
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil)
        return acc if length.zero?

        arr = self
        if acc.nil?
          acc = self [0]
          arr = MyArray.new(self [1, length])
        end
        arr.my_each { |el| acc = yield(acc, el) }

        acc
      end
    end
  end
end
