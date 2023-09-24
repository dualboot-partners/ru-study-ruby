module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        return to_enum(:my_each) unless block_given?
    
        for element in self
          yield(element)
        end
        self
      end

      # Написать свою функцию my_map
      def my_map
        return to_enum(:my_map) unless block_given?
    
        result = MyArray.new
        my_each { |element| result << yield(element) }
        result
      end

      # Написать свою функцию my_compact
      def my_compact
        result = MyArray.new
        my_each { |element| result << element unless element.nil? }
        result
      end

      # Написать свою функцию my_reduce
      def my_reduce(accumulator = nil)
        my_each do |element|
          if accumulator.nil?
            accumulator = element
          else
            accumulator = yield(accumulator, element)
          end
        end
        accumulator
      end
    end
  end
end
