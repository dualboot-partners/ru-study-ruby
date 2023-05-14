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
      def my_reduce(accumulator = nil, &block)
        if block.nil? && accumulator.class.name == 'Symbol'
          block = accumulator.to_proc
          accumulator = nil
        end

        if accumulator.nil?
          accumulator, *tail = self
        else
          tail = self
        end

        (self.class.new tail).my_each { accumulator = block.call(accumulator, _1) }

        accumulator
      end
    end
  end
end
