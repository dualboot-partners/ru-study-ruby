module Exercise
  module Fp
    class << self
      def rating(array)
        filtered_films = array.select do |film|
          film_has_multiple_countries?(film) && valid_kinopoisk_rating?(film)
        end
      
        total_rating = calculate_total_rating(filtered_films)
      
        total_rating / filtered_films.size
      end

      def chars_count(films, threshold)
        films.reduce(0) do |count, film|
          rating_kp = film['rating_kinopoisk']&.to_f
          if rating_kp && rating_kp >= threshold && film['name']
            count + film['name'].count('и')
          else
            count
          end
        end
      end
      
      private
      
      def film_has_multiple_countries?(film)
        countries = film['country']&.split(',')&.map(&:strip)
        countries && countries.count >= 2
      end
      
      def valid_kinopoisk_rating?(film)
        rating_kp = film['rating_kinopoisk']&.to_f
        rating_kp && rating_kp.positive?
      end
      
      def calculate_total_rating(films)
        films.reduce(0.0) do |sum, film|
          sum + film['rating_kinopoisk'].to_f
        end
      end
    end
  end
end
