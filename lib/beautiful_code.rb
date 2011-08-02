require 'beautiful_code/guarrada'

module BeautifulCode
  class << self
    def convert(input = ARGV[0], output = ARGV[1], options = {})
      Converter.new(input, output, options).solve
    end
  end
end