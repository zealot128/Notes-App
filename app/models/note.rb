class Note < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image
  has_attached_file :preview, :styles => { :thumb => "100x100", :normal => "300x300" }
  acts_as_taggable

  include ActionView::Helpers::TextHelper
  include ActionView::Helpers::TagHelper
  validates_presence_of :title, :description, :user_id
  before_save :make_html, :generate_preview

  self.per_page = 20

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

  def generate_preview
    if self.link_changed?
      cmd = "#{Rails.root}/wkhtmltoimage --height 768 '#{link}' tmp/tmp.png "
      logger.info `#{cmd}`
      file = File.open("#{Rails.root}/tmp/tmp.png")
      self.preview = file
    end
  end

  def has_link?
    self.link.present?
  end

  def domain
    URI.parse(self.link).host.gsub("www.","")
  end


  def self.initialize_from_tumblr(params)
    Note.new(:link => params["u"], :description => params["s"], :title => params["t"])
  end

end
