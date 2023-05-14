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
      def my_map(&block)
        func = ->(accumulator, element) { accumulator.push(block.call(element)) }
        my_reduce(self.class.new, &func)
      end

      # Написать свою функцию my_compact
      def my_compact
        func = lambda { |accumulator, element|
          accumulator.push(element) unless element.nil?
          accumulator
        }
        my_reduce(self.class.new, &func)
      end

      # Написать свою функцию my_reduce
      def my_reduce(accumulator = nil, &block)
        if block.nil? && accumulator.instance_of?(Symbol)
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
