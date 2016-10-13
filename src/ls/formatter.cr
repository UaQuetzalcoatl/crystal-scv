require "csv"

require "./column"

class Ls::Formatter

  def initialize(@localizer : Localizer, @columns : Array(Column))
  end
  
  def format(stream : IO)
    CSV.each_row(stream) do |row|
      arr = [] of String
      row.each_index do |index|
        arr << @localizer.default(row[index]).to_s
      end

    yield arr

    end
  end

end
