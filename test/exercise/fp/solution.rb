module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(_array)
        array = CSV.readlines('./test/fixtures/films.csv', headers: true).to_a
        rating_kinopoisk = []
        array.map do |row|
          rating_kinopoisk.push row[1].to_f if row[6].to_s.split(',').count > 1 && row[1].to_i.positive?
        end
        rating_kinopoisk.reduce(:+) / rating_kinopoisk.size
      end

      def chars_count(_films, threshold)
        films = CSV.readlines('./test/fixtures/films.csv', headers: true).to_a
        name = []
        films.map do |row|
          name.push row[0] if row[1].to_f >= threshold && row[0].count('и').positive?
        end

        sum = name.map { |film| film.count('и') }
        sum.reduce(:+)
      end
    end
  end
end
