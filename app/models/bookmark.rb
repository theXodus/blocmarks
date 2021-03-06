class Bookmark < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  has_many :likes, dependent: :destroy
  before_validation :smart_add_url_protocol
  validates :url, url: true

  protected

  # adds http to URLs to make them clickable on the bookmark
  # show page
  def smart_add_url_protocol
    unless self.url[/\Ahttp:\/\//] || self.url[/\Ahttps:\/\//]
      self.url = "http://#{self.url}"
    end
  end
end
