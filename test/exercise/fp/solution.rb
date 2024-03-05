module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(_array)
        array = CSV.readlines('./test/fixtures/films.csv', headers: true)

        rating_kinopoisk = (array.map do |film|
                              film['rating_kinopoisk'].to_f if film['country'].to_s.split(',').count > 1 && film['rating_kinopoisk'].to_i.positive?
                            end).compact
        rating_kinopoisk.reduce(:+) / rating_kinopoisk.size
      end

      def chars_count(_films, threshold)
        films = CSV.readlines('./test/fixtures/films.csv', headers: true)
        search_letters = films.map do |film|
          film['name'] if film['name'].count('и').positive? && film['rating_kinopoisk'].to_f >= threshold
        end.compact
        search_letters.map { |film| film.count('и') }.reduce(:+)
      end
    end
  end
end
