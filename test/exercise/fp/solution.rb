module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        filtered_countries = array.select do |film|
          !film['country'].nil? && film['country'].split(',').length > 1 && !film['rating_kinopoisk'].nil? && film['rating_kinopoisk'].to_f.positive?
        end
        total_kinopoisk_score = filtered_countries.reduce(0) { |sum, film| sum + film['rating_kinopoisk'].to_f }
        total_kinopoisk_score / filtered_countries.size
      end

      def chars_count(films, threshold)
        films.reduce(0) do |sum, film|
          if !film['rating_kinopoisk'].nil? && film['rating_kinopoisk'].to_f >= threshold
            letters = film['name'].chars.count('и')
            sum += letters
          end
          sum
        end
      end
    end
  end
end
