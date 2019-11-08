class Image

  def initialize (picture)
    @picture = picture
  end
  
  def find_ones
    coordinates = []
    @picture.each_with_index do |row, row_number|
      row.each_with_index do |item, col_number|
        if item == 1
          coordinates << [row_number, col_number]
        end
      end
    end
    
    return coordinates
    end

    def blur(blur_distance)
      blur_distance.times do
        coordinates = find_ones
        
        @picture.each_with_index do |row, row_number|
          row.each_with_index do |item, col_number|
            coordinates.each do |found_row_number, found_col_number|
              if row_number == found_row_number && col_number == found_col_number
                @picture[row_number -1][col_number] = 1 unless row_number == 0 
                @picture[row_number +1][col_number] = 1 unless row_number >= @picture.length-1 
                @picture[row_number][col_number -1] = 1 unless col_number == 0 
                @picture[row_number][col_number +1] = 1 unless col_number >= row.length-1 
              end
            end
          end
        end
      end
    end

  def output_image
    @picture.each do |data|
      puts data.join
    end
  end
end

image = Image.new([
  [0, 0, 0, 1],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0], 
  [1, 0, 0, 0]
])

image.blur(3)

image.output_image