class Piece < ApplicationRecord
  after_initialize :set_defaults

  @@bufferSize = 7

  def set_defaults
    self.date ||= Date.today
    self.practices ||= Array.new(@@bufferSize, false)
  end 

  def update_date(new_date)
    diff = (new_date - date()).to_i
    self.practices = Array.new([@@bufferSize, diff].min(), false) + self.practices.slice(0, [0, @@bufferSize - diff].max())
    self.date = new_date
    save()
  end 
end
