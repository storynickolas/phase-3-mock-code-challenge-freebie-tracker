class Dev < ActiveRecord::Base
  has_many :freebies
  has_many :companies, through: :freebies

  def received_one?(item_name)
    self.freebies.where("item_name == ?", item_name).exists?
  end

  def give_away(dev, freebie)
    dev.freebies.where("item_name == ?", freebie).update(:dev_id => self.id)
  end
end
