require 'pry'

module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        # binding.pry
        ratings = []
        array.select do
          |film|
          unless film['rating_kinopoisk'].nil? || film['rating_kinopoisk'] == '0' || film['country'].nil?
            if film['country'].include?(',')
              ratings << film['rating_kinopoisk'].to_f
            end
          end
        end
        ratings.reduce(:+) / ratings.length
      end

      def chars_count(_films, _threshold)
        0
      end
    end
  end
end
