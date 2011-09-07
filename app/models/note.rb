class Note < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image
  acts_as_taggable

  include ActionView::Helpers::TextHelper
  include ActionView::Helpers::TagHelper
  validates_presence_of :title, :description, :user_id
  before_save :make_html

  def make_html
    text = coderay(description)
    self.html = RedCloth.new(text).to_html
  end


  def coderay(text)
    text.gsub!(/\<code(?: lang="(.+?)")?\>(.+?)\<\/code\>/m) do
      code = CodeRay.scan($2, $1).div(:css => :class)
      "<notextile>#{code}</notextile>"
    end
    return text.html_safe
  end



end
