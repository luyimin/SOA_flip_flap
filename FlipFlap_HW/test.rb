require_relative 'tsv_buddy'

class Test
  include TsvBuddy
end

t = Test.new.take_tsv(File.read('data/survey.tsv'))

puts t
