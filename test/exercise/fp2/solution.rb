module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.
      # Написать свою функцию my_each
      def my_each
        for el in self
          yield el
        end  
      end

      # Написать свою функцию my_map
      def my_map
        new_array = MyArray.new
        my_each do |el| 
          new_value = yield el
          new_array << new_value  
        end
        new_array
      end

      # Написать свою функцию my_compact
      def my_compact
        compact_array = MyArray.new
        my_each do |el| 
          compact_array << el unless el.nil?
        end 
        compact_array  
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil)
        if acc.nil?
          acc = self[0]
          start_index = 1
        else 
          start_index = 0
        end
        subject_array = self[start_index..-1]
        for el in subject_array
          acc = yield(acc, el)
        end  
        # my_each do |el|
        #   acc = yield(acc, el)  
        # end
        acc
        
      end
    end
  end
end
