module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        sum = array.reduce(0) do |acc, film|
          if !film['rating_kinopoisk'].nil? && film['rating_kinopoisk'].to_f.positive? && \
             !film['country'].nil? && film['country'].to_s.split(',').count >= 2
            acc += film['rating_kinopoisk'].to_f
          end
          acc
        end
        num = array.reduce(0) do |acc, film|
          if !film['rating_kinopoisk'].nil? && film['rating_kinopoisk'].to_f.positive? && \
             !film['country'].nil? && film['country'].to_s.split(',').count >= 2
            acc += 1
          end
          acc
        end
        sum / num
      end

      def chars_count(films, threshold)
        array = films.reduce('') do |acc, film|
          acc << film['name'].to_s if film['rating_kinopoisk'].to_f >= threshold
          acc
        end
        array.split('').reduce(0) do |num, char|
          num += 1 if char == 'и'
          num
        end
      end
    end
  end
end
