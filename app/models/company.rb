class Company < ActiveRecord::Base
  has_many :freebies
  has_many :devs, through: :freebies

  def give_freebie(dev, item_name, value)
    dev.freebies.create_with(value: value, company_id: self.id).find_or_create_by(item_name: item_name)
  end

  def self.oldest_company
    year = minimum("founding_year")
    where("founding_year == ?", year)
  end
end
