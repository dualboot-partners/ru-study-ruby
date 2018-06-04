require 'csv'
require './test/test_helper.rb'
require_relative './solution.rb'

# Оба задания нужно решить используя map и reduce
class Exercise::FpTest < Minitest::Test
  # Посчитать средний рейтинг фильмов по версии кинопоиска у которых две или больше стран
  # Фильмы у которых рейтиг не задан или равен 0 не учитывать в расчете среднего.
  def test_rating
    skip
    array = CSV.readlines('./test/fixtures/films.csv', headers: true)

    result = Exercise::Fp.rating(array)
    assert result == 6.809410385259628
  end

  # Посчитать количесвто букв 'и' в названиях всех фильмов с рейтингом кинопоиска больше или равным заданному значению
  def test_chars_count
    skip
    array = CSV.readlines('./test/fixtures/films.csv', headers: true)

    result = Exercise::Fp.chars_count(array, 5)
    assert result == 3850

    result = Exercise::Fp.chars_count(array, 8.5)
    assert result == 40
  end
end
