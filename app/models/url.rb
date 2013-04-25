class Url < ActiveRecord::Base
  validates :url, :format => { :with => /^w{3}.*/, :message => "must start with www" }
  # validates :url, :uniqueness => true, :message => "okkkkkkk"
  before_create :shorten_url
  # unique validation on short_url

  private

  def shorten_url
    array = ('a'..'z').to_a + (0..9).to_a
    self.short_url = array.sample(5).join("")
  end
end
