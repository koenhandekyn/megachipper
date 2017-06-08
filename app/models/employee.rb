class Employee < ApplicationRecord

  def name
    "#{firstname} #{lastname}"
  end

  def regime_raw
    JSON.generate(self.regime || {}) rescue "{}"
  end

  def regime_raw=(value)
    self.regime = JSON.parse(value)
  end

end
