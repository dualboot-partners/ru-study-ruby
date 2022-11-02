module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        filtered_films = array.select do |film| 
          !film["country"].nil? && 
          film["country"].split(',').size > 1 &&
          !film["rating_kinopoisk"].nil? &&
          film["rating_kinopoisk"].to_i != 0
        end
        sum_rating = filtered_films.reduce(0) do |sum, film|
          result = film["rating_kinopoisk"].to_f 
          sum + result
        end
        sum_rating / filtered_films.size
      end

      def chars_count(films, threshold)
        films.reduce(0) do |sum, film|
          result = film["name"].split('').select { |char| char == 'и'}.size 
          if film["rating_kinopoisk"].nil? || film["rating_kinopoisk"].to_f < threshold 
            sum
          else 
            sum + result
          end
        end
      end
    end
  end
end




