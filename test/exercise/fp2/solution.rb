module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        i = 0
        while i < length
          yield self[i]
          i += 1
        end
        self
      end

      # Написать свою функцию my_map
      def my_map
        arr = Exercise::Fp2::MyArray.new([])
        i = 0
        while i < length
          a = yield self[i]
          arr << a
          i += 1
        end
        arr
      end

      # Написать свою функцию my_compact
      def my_compact
        arr = Exercise::Fp2::MyArray.new([])
        i = 0
        while i < length
          arr << self[i] unless self[i].nil?
          i += 1
        end
        arr
      end

      # Написать свою функцию my_reduce
      def my_reduce(*args)
        i = 0
        while i < length
          res = case i
                when 0
                  if args.empty?
                    self[i]
                  else
                    yield(args[0], self[i])
                  end
                else
                  yield(res, self[i])
                end
          i += 1
        end
        res
      end
    end
  end
end
