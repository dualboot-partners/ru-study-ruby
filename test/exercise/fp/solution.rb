module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        array.lazy.select { |film| film['rating_kinopoisk'].to_f.positive? }.select { |film| film['country'].to_s.include?(',') }
             .map { |film| film['rating_kinopoisk'].to_f }.reduce([0, 0]) { |acc, rating| [acc[0] + rating, acc[1] + 1] }.reduce(:/)
      end

      def chars_count(_films, _threshold)
        0
      end
    end
  end
end
