module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        filtered_films = array.select { |el| el['country'] && el['country'].split(',').length > 1 && el['rating_kinopoisk'] }
                              .map { |el| el['rating_kinopoisk'].to_f }
                              .select(&:positive?)

        filtered_films.reduce { |sum, num| sum + num } / filtered_films.length
      end

      def chars_count(films, threshold)
        films.select { |el| el['rating_kinopoisk'] && el['rating_kinopoisk'].to_f >= threshold }
             .map { |el| el['name'].count('и') }
             .reduce(:+)
      end
    end
  end
end
