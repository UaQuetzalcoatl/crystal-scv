require "csv"

class Ls::Formatter

  def initialize(@Localizer : Ls::Localizer, @columns : Array(String))
  end
  
  def format(stream : IO,)
    CSV.each_row(stream) do |row|
      arr = [] of String
      row.each_index do |index|
        arr << localizer.default(row[index]).to_s
      end

    yield arr

    end
  end

end
