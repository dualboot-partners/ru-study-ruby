module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(_array)
        ratings = _array.map do |film|
          rating_kinopoisk = film["rating_kinopoisk"].to_f
          countries = film["country"].to_s.split(',')

          rating_condition = rating_kinopoisk > 0
          country_condition = countries.length > 1

          rating_condition && country_condition ? rating_kinopoisk : nil
        end.compact

        ratings.length > 0 ? ratings.reduce(:+) / ratings.length : 0
      end

      def chars_count(_films, _threshold)
        0
      end
    end
  end
end
