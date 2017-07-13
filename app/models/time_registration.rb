class TimeRegistration < ApplicationRecord

  validate :validate_hours
  validate :validate_extra

  def validate_hours
    puts "****", hours.inspect, "****"
    if hours
      errors.add(:hours, 'hours should be positive') if hours.to_f < 0
      errors.add(:hours, 'hours should be less than 8') if hours.to_f > 8
    end
    puts errors.inspect
  end

  def validate_extra
    if extra
      errors.add(:extra, 'hours should be positive') if extra.to_f < 0
      errors.add(:extra, 'hours should be less than 4') if extra.to_f > 4
    end
    puts errors.inspect
  end

  def prestation
    return self.pay_code if self.hours==0 || self.hours==nil
    "%g" % self.hours
  end

  def extra
    "%g" % self["extra"]
  end

end
