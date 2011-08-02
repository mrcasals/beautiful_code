require 'spec_helper'
require 'fileutils'

describe BeautifulCode do
  describe ".convert" do
    it 'converts a text file into a beautiful image' do
      input = File.read('spec/support/input_file.rb')
      expected_output = 'spec/support/expected_output.bmp'
      output = 'spec/support/output.bmp'

      FileUtils.rm(output) if File.exist?(output)

      BeautifulCode.convert(input, output, {})

      contents = open(output, "rb") {|io| io.read }
      expected_contents = open(expected_output, "rb") {|io| io.read }

      contents.must_equal expected_contents
    end
  end
end
