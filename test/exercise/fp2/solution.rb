module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        return self unless block_given?

        i = 0
        while i < size
          yield self[i]
          i += 1
        end
        self
      end

      # Написать свою функцию my_map
      def my_map
        return self unless block_given?

        result = MyArray.new
        i = 0
        while i < size
          result << (yield self[i])
          i += 1
        end
        result
      end

      # Написать свою функцию my_compact
      def my_compact
        result = MyArray.new
        i = 0
        while i < size
          result << self[i] unless self[i].nil?
          i += 1
        end
        result
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil)
        return nil unless block_given?
        return nil if empty?

        i = 0
        if acc.nil?
          acc = self[0]
          i = 1
        end

        while i < size
          acc = (yield acc, self[i])
          i += 1
        end
        acc
      end
    end
  end
end
