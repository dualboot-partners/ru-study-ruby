module Exercise
  module Fp
    class << self
      require('pry')
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        ratings = array.map { |a| { rating: (a['rating_kinopoisk'] || 0).to_f, countries: (a['country'] || '').split(',').size } }
                       .select { |a| a[:countries] >= 2 && (a[:rating]).positive? }.map { |a| a[:rating] }
        ratings.reduce(:+) / ratings.size
      end

      def chars_count(films, threshold)
        selected = films.select {|f| f["rating_kinopoisk"].to_f >= threshold}

        mapped = selected.map {|f| f["name"].count('и')}

        total = mapped.reduce(:+)
      end
    end
  end
end
