module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(_array)
        arr = _array.map do |film|
          unless film['country'].nil?
            film['rating_kinopoisk'].to_f if film['country'].split(',').length >= 2
          end
        end.compact
        arr.delete(0)
        arr.reduce(:+) / arr.length
      end

      def chars_count(_films, _threshold)
        
      end
    end
  end
end
