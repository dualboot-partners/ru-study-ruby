module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(_array)
        _array = _array.map { |film| film if film['country'] }.compact
        _array = _array.map { |film| film if film['rating_kinopoisk'] }.compact
        _array = _array.map { |film| film['rating_kinopoisk'].to_f if film['country'].split(',').size > 1 }.compact
        _array = _array.map { |rate| rate if rate.positive? }.compact
        _array.reduce { |sum, el| sum + el }.to_f / _array.size
      end

      # Посчитать количесвто букв 'и' в названиях всех фильмов с рейтингом кинопоиска больше или равным заданному значению

      def chars_count(_films, _threshold)
        _films = _films.map { |film| film['name'].count('и') if film['rating_kinopoisk'].to_f > _threshold }.compact
        _films.reduce { |sum, el| sum + el }
      end
    end
  end
end
