module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        newarray = []
        array.map do |film|
          country = film['country'] || ''
          country_count = country.split(',').size
          newarray << film['rating_kinopoisk'].to_f if film['rating_kinopoisk'].to_f.positive? && country_count > 1
        end
        newarray.reduce { |sum, num| sum + num } / newarray.size
      end

      def chars_count(films, threshold)
        film_names = []
        films.map { |film| film_names << film['name'] if film['rating_kinopoisk'].to_f >= threshold }
        film_names.reduce(0) { |sum_of_char, film_name| sum_of_char + film_name.gsub(/и/).count }
      end
    end
  end
end
