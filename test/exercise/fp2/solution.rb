module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&func)
        first, *rest = self
        func.call(first)
        return first if rest.empty?

        [first, *MyArray.new(rest).my_each(&func)]
      end

      # Написать свою функцию my_map
      def my_map(&func)
        result = my_reduce([]) do |acc, element|
          acc << func.call(element)
          acc
        end
        MyArray.new(result)
      end

      # Написать свою функцию my_compact
      def my_compact
        result = my_reduce([]) do |acc, element|
          acc << element unless element.is_a? NilClass
          acc
        end
        MyArray.new(result)
      end

      # Написать свою функцию my_reduce
      def my_reduce(item = nil, &func)
        *rest, last = self
        rest.unshift(item) unless item.is_a? NilClass
        return last if rest.empty?

        func.call(MyArray.new(rest).my_reduce(&func), last)
      end
    end
  end
end
