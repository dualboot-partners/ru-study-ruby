module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        selected_films = array.lazy.select { |film| film['rating_kinopoisk'].to_f.positive? && film['country'].to_s.split(',').count > 1 }
                              .map { |film| film['rating_kinopoisk'].to_f }
        selected_films.reduce(:+) / selected_films.count
      end

      def chars_count(films, threshold)
        films.lazy.reject { |film| film['rating_kinopoisk'].to_f < threshold }.map { |film| film['name'] }
             .reduce(0) { |acc, name| acc + name.count('и') }
      end
    end
  end
end
