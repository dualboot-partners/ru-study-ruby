require 'csv'
require './test/test_helper'
require_relative './solution'

# Нужно реализовать примитивы функционального программирования
class Exercise::Fp2Test < Minitest::Test
  def setup
    @array = generate :array
    @my_array = Exercise::Fp2::MyArray.new(@array)
    @int = generate :int
  end

  def test_my_each
    result = []
    my_result = []

    func = ->(element) { result << element if element.odd? }
    my_func = ->(element) { my_result << element if element.odd? }

    assert @array.each(&func) == @my_array.my_each(&my_func)
    assert result == my_result
  end

  def test_my_map
    func = ->(element) { element * @int }
    assert @array.map(&func) == @my_array.my_map(&func)
    assert @array.map(&func).map(&func) == @my_array.my_map(&func).my_map(&func)
  end

  def test_my_compact
    func = ->(element) { element if element.even? }
    func_another = ->(element) { element * @int }
    func_yet_another = ->(element) { element.even? }
    assert @array.map(&func).compact == @my_array.my_map(&func).my_compact
    assert @array.map(&func).compact.map(&func_another) == @my_array.my_map(&func).my_compact.my_map(&func_another)
    assert @array.map(&func_yet_another).compact == @my_array.my_map(&func_yet_another).my_compact
  end

  def test_my_reduce
    func = ->(acc, element) { acc * element }

    assert @array.reduce(&func) == @my_array.my_reduce(&func)
    assert @array.reduce(2, &func) == @my_array.my_reduce(2, &func)
    assert @array.reduce(&:+) == @my_array.my_reduce(&:+)
  end
end
