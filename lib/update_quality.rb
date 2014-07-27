require 'award'

def update_quality(awards)
  awards.each { |award| award.daily_update! }
end