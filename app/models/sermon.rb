class Sermon < ApplicationRecord
  belongs_to :series
  has_one_attached :sermonPic

  before_create :cleanData

  def cleanData
    self.title = title.capitalize
    self.sermon_time = Time.current
  end
end
