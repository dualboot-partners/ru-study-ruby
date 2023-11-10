module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        return to_enum unless block_given?

        for element in self
          yield(element)
        end
      end

      # Написать свою функцию my_map
      def my_map
        return to_enum unless block_given?

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
      def my_reduce(accumulator = nil, array = nil, &block)
        if accumulator.instance_of?(String) || accumulator.instance_of?(Symbol)
          block = ->(acc, element) { acc.send(accumulator, element) }
          return my_reduce(&block)
        elsif array.instance_of?(String) || array.instance_of?(Symbol)
          block = ->(acc, element) { acc.send(array, element) }
          return my_reduce(accumulator, &block)
        end

        array ||= self
        unless accumulator
          accumulator = self[0]
          array = array.drop(1)
        end
        return accumulator if array.empty?

        accumulator = yield accumulator, array[0]
        array = array.drop(1)
        my_reduce(accumulator, array, &block)
      end
    end
  end
end
