class Sermon < ApplicationRecord
  #Define relationships
  belongs_to :series
  has_one_attached :sermonPic

  #Before save: strip spaces, capitalize title, and set sermon time to now
  before_save :cleanData

  #Validate attachment format
  validate :sermonPic_format

  validates_presence_of :title, :description

  def cleanData
    self.title = title.strip.capitalize
    self.sermon_time = Time.current
  end

  private

  #Validate attachment format
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
