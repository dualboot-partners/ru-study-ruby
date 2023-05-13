module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for item in self
          yield(item)
        end
      end

      # Написать свою функцию my_map
      def my_map
        new_array = self.class.new
        my_each { |item| new_array << yield(item) }
        new_array
      end

      # Написать свою функцию my_compact
      def my_compact; end

      # Написать свою функцию my_reduce
      def my_reduce; end
    end
  end
end
