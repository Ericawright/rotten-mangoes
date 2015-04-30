class Movie < ActiveRecord::Base
  validates :title, presence: true
  validates :director, presence: true
  validates :runtime_in_minutes, numericality: { only_integer: true }
  validates :description, presence: true
  validates :image, presence: true, unless: ->(movie){movie.remote_image_url.present?}
  validates :remote_image_url, presence: true, unless: ->(movie){movie.image.present?}

  validates :release_date, presence: true
  # validate :release_date_is_in_the_future
  has_many :reviews
  mount_uploader :image, ImageUploader


  scope :search, -> (search){where("director LIKE ? OR title LIKE ?", "%#{search}%", "%#{search}%")}
  scope :duration, -> (min, max) {where("runtime_in_minutes BETWEEN ? AND ?", "#{min}", "#{max}")}





  def review_average

   reviews.sum(:rating_out_of_ten)/reviews.size if reviews.size != 0 

  end

  protected

  def release_date_is_in_the_future
    if release_date.present?
      errors.add(:release_date, "should probably be in the future") if release_date < Date.today
    end
  end
end
