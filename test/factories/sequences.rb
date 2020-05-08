FactoryGirl.define do
  sequence :int do |n|
    n
  end

  sequence :array do |n|
    [n, n + 1, n + 7, n + 19, n + 12]
  end
end
