module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        return '#<Enumerator: ...>' unless block_given?

        for element in self
          yield(element)
        end
      end

      # Написать свою функцию my_map
      def my_map
        return '#<Enumerator: ...>' unless block_given?

        output_array = MyArray.new
        my_each { |element| output_array << yield(element) }
        output_array
      end

      # Написать свою функцию my_compact
      def my_compact
        output_array = MyArray.new
        my_each { |element| output_array << element unless element.nil? }
        output_array
      end

      # Написать свою функцию my_reduce
      def my_reduce; end
    end
  end
end
