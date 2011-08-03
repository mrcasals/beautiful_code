require 'rmagick'

class Converter
  def initialize(input, output = 'demo.bmp', options)
    @input = input
    @output = output

    @scale_factor = options[:scale_factor] || 5
    @desired_length = options[:desired_length] || 3
  end
  def solve
    # Set variables
    # input = "hello ma123456789" * 5

    input_array = @input.bytes.to_a
    max = input_array.max
    min = input_array.min

    # Make colors prettier
    input_array = input_array.map do |num|
      num = ((num - min + 1) * (255 / max.to_f)).to_i
    end

    # Make pixels
    input_array = input_array.each_slice(3).to_a

    # Ensure last element is a pixel
    last_element = input_array.pop
    last_element.fill(0, (last_element.length..(@desired_length-1)))
    input_array << last_element

    #Fix color scale
    input_array.each_with_index do |arr, index|
      if index % 2 == 0
        input_array[index][1] += 50
      else
        input_array[index][2] += 50
      end
    end

    # Make columns
    sqrt = Math.sqrt(input_array.length).to_i
    input_array = input_array.each_slice(sqrt).to_a

    # Ensure equal length for all columns
    last_element = input_array.pop
    desired_length = sqrt
    last_element.fill([0,0,0], (last_element.length..(desired_length-1)))
    input_array << last_element

    # Multiply columns
    array = []
    input_array.each do |col|
      @scale_factor.times do
        array << col
      end
    end
    input_array = array

    # Multiply pixels
    input_array.map! do |col|
      array = []
      col.each do |pix|
        @scale_factor.times do
          array << pix
        end
      end
      col = array
    end

    # Set image dimensions
    height = input_array.first.length
    width = input_array.length

    # pp input_array
    # puts width
    # puts height

    # Create image
    img = Magick::Image.new(width, height)

    input_array.each_with_index do |row, row_index|
      row.each_with_index do |item, column_index|
        img.pixel_color(row_index, column_index, "rgb(#{item.join(', ')})")
      end
    end

    img.write(@output)
  end
end
