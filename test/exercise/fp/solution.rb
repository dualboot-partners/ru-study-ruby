module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        array_ratings = array.map do |film|
          if !film['rating_kinopoisk'].nil? && film['rating_kinopoisk'].to_f.positive? && \
             !film['country'].nil? && film['country'].to_s.split(',').count >= 2
            film['rating_kinopoisk'].to_f
          end
        end
        array_ratings = array_ratings.compact
        array_ratings.reduce(&:+) / array_ratings.size
      end

      def chars_count(films, threshold)
        string_names = films.reduce('') do |acc, film|
          acc << film['name'].to_s if film['rating_kinopoisk'].to_f >= threshold
          acc
        end
        string_names.chars.reduce(0) do |num, char|
          num += 1 if char == 'и'
          num
        end
      end
    end
  end
end
