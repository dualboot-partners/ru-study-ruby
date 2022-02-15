module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        array_ratings = array.map do |film|
          if (!film["rating_kinopoisk"].nil? && film["rating_kinopoisk"].to_f.positive? && \
            !film["country"].nil? && film["country"].to_s.split(',').count >= 2)
             film["rating_kinopoisk"].to_f
          end
        end
        array_ratings = array_ratings.compact
        array_ratings.reduce(&:+) / array_ratings.size
      end

      def chars_count(_films, _threshold)
        0
      end
    end
  end
end
