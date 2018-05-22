require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.test_files = FileList['test/**/**/test.rb']
  p FileList['test/**/**/test.rb']
end

task default: :test
