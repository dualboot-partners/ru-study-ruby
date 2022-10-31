module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def find_comma_in_string(string_el)
        return nil if string_el == nil
        return (string_el.include? ',') ? string_el : nil
      end

      def rating(array)
        filtered_films = array.map{|film| find_comma_in_string(film['country']) ? film : nil}.compact
        ratings_of_films = filtered_films.map{|film| film["rating_kinopoisk"].to_f == 0 ? nil : film["rating_kinopoisk"].to_f}.compact
        return ratings_of_films.inject(:+)/ratings_of_films.length
      end 

      def chars_count(films, threshold)
        filtered_films = films.map{|film| film["rating_kinopoisk"].to_f <= threshold ? nil : film["name"]}.compact
        return filtered_films.inject(0){|counter, film_name| counter+film_name.count('и')}
      end
    end
  end
end
