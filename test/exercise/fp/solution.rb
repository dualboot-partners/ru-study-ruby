module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(_array)
        arr = _array.map do |film|
          film['rating_kinopoisk'].to_f if !film['country'].nil? && (film['country'].split(',').length >= 2)
        end.compact
        arr.delete(0)
        arr.reduce(:+) / arr.length
      end

      def chars_count(_films, _threshold)
        arr = _films.map do |film|
          film['rating_kinopoisk'].to_f >= _threshold ? film['name'] : 'o'
        end.map(&:chars).flatten
        arr.reduce(0) do |memo, letter|
          memo += letter == 'и' ? 1 : 0
        end
      end
    end
  end
end
