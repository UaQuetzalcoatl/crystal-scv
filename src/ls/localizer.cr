class Ls::Localizer

  def initialize(@locale : String)
  end

  def hidden : Nil
  end

  def currency (value : String) : String
    value
  end

  def number (value : Number) : String
    value
  end

  def date (value : String) : String
    value
  end

  def numeric_key (value : String) : String
    value
  end

  def default (value : String) : String
    value
  end
end
