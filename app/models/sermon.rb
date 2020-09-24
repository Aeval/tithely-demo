class Sermon < ApplicationRecord
  belongs_to :series
  has_one_attached :sermonPic

  before_create :cleanData

  validate :sermonPic_format

  def cleanData
    self.title = title.capitalize
    self.sermon_time = Time.current
  end

  private

  def sermonPic_format
    return unless sermonPic.attached?
    if sermonPic.blob.content_type.start_with? 'image/'
      if sermonPic.blob.byte_size > 10.megabytes
        errors.add(:sermonPic, 'size needs to be less than 10MB')
        sermonPic.purge
      end
     else
      sermonPic.purge
       errors.add(:sermonPic, 'needs to be an image')
     end
   end
end
