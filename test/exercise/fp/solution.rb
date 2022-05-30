module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        ratings = array.map { |a| { rating: (a['rating_kinopoisk'] || 0).to_f, countries: (a['country'] || '').split(',').size } }
                       .select { |a| a[:countries] >= 2 && (a[:rating]).positive? }.map { |a| a[:rating] }
        ratings.reduce(:+) / ratings.size
      end

      def chars_count(films, threshold)
        films.select { |m| m['rating_kinopoisk'] && m['rating_kinopoisk'].to_f >= threshold }
             .map { |m| m['name'].count('и') }.reduce(:+)
      end
    end
  end
end
