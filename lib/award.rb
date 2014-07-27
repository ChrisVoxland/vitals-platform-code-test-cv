class Award
  attr_accessor :name, :expires_in, :quality

  def initialize(name, expires_in, quality)
    @name = name
    @expires_in = expires_in
    @quality = quality
  end

  def daily_update!
    if (quality + increment_from_type) <= 0
      @quality = 0
    elsif quality == 80
      return
    elsif (quality + increment_from_type) >= 50
      @quality = 50
    else
      @quality += increment_from_type
    end
    @expires_in -= 1 unless name == "Blue Distinction Plus"
  end

  private

  def expired?
    expires_in <= 0
  end

  def increment_from_type
    case name
    when "NORMAL ITEM"    
      expired? ? -2 : -1
    when "Blue First"
      expired? ? 2 : 1
    when "Blue Distinction Plus"
      0
    when "Blue Compare"
      if expired?
        -1 * quality
      elsif expires_in > 10
        1
      elsif expires_in > 5
        2
      else
        3
      end
    when "Blue Star"
      expired? ? -4 : -2
    end
  end

end
