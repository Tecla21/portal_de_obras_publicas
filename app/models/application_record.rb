class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def calc_percent(value = 0, percent = 0)
    return 0 if percent == 0 || percent.blank?
    return value&.to_f / (percent&.to_f * 100.0)
  end

end
