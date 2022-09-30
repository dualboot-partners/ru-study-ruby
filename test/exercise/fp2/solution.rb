module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        count = 0
        size = self.size

        while count < size
          yield(self[count])
          count += 1
        end

        self
      end

      # Написать свою функцию my_map
      def my_map
        result = MyArray.new
        count = 0
        size = self.size

        while count < size
          result << yield(self[count])
          count += 1
        end

        result
      end

      # Написать свою функцию my_compact
      def my_compact
        result = MyArray.new
        count = 0
        size = self.size

        while count < size
          result << self[count] unless self[count].nil?
          count += 1
        end
        result
      end

      # Написать свою функцию my_reduce
      def my_reduce(initial_value = nil)
        count = 0
        size = self.size

        head, *tail = self
        acc = initial_value.nil? ? head : initial_value.to_i
        arr = initial_value.nil? ? tail : self

        while count < size
          acc = yield(acc, arr[count]) unless arr[count].nil?
          count += 1
        end
        acc
      end
    end
  end
end
