class Piece < ApplicationRecord
  after_initialize :set_defaults

  def set_defaults
    self.date ||= Date.today
    self.practices ||= Array.new(7, false)
  end 
end
