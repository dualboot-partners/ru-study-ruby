module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        filtered_films = array.map do |film|
          if !film['rating_kinopoisk'].nil? && film['rating_kinopoisk'].to_f.positive? && \
             !film['country'].nil? && film['country'].to_s.split(',').count >= 2
            film
          end
        end
        rating_array = filtered_films.compact.map { |film| film['rating_kinopoisk'].to_f }
        rating_array.reduce(:+) / rating_array.size
      end

      def chars_count(films, threshold)
        names_string = films.reduce('') do |acc, film|
          acc << film['name'].to_s if film['rating_kinopoisk'].to_f >= threshold
          acc
        end
        names_string.chars.reduce(0) do |num, char|
          num += 1 if char == 'и'
          num
        end
      end
    end
  end
end
