class Note < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image
  has_attached_file :preview, :styles => { :thumb => "100x100", :normal => "300x300" }
  acts_as_taggable

  include ActionView::Helpers::TextHelper
  include ActionView::Helpers::TagHelper
  validates_presence_of :title, :description, :user_id
  before_save :make_html, :generate_preview

  self.per_page = 10

  def make_html
    text = coderay(description)
    self.html = RedCloth.new(text).to_html
  end


  def coderay(text)
    text.gsub(/\<code(?: lang="(.+?)")?\>(.+?)\<\/code\>/m) do
      #code = CodeRay.scan($2, $1).div(:css => :class).html_safe
      code = pygmentize($2, $1).html_safe rescue ""
      "<notextile>#{code}</notextile>"
    end.html_safe
  end

  def pygmentize(text,lexer)
    Rails.logger.warn text.inspect
    Rails.logger.warn lexer.inspect
    pygmentize = IO.popen("pygmentize -f html -l #{lexer}", "w+")
    pygmentize.puts text
    pygmentize.close_write
    result = pygmentize.gets(nil)
    pygmentize.close
    result
  end

  def generate_preview
    if has_link? and self.link_changed?
      filename = Digest::MD5.hexdigest(link)
      cmd = "#{Rails.root}/wkhtmltoimage --load-error-handling ignore --height 768 '#{link}' tmp/#{filename}.png "
      logger.warn `#{cmd} 2>&1`
      file = File.open("#{Rails.root}/tmp/#{filename}.png")
      self.preview = file
    end
  rescue
    logger.warn "Could not generate preview!"
  end

  def has_link?
    self.link.present?
  end

  def domain
    URI.parse(self.link).host.gsub("www.","") rescue self.link
  end


  def self.initialize_from_tumblr(params)
    Note.new(:link => params["u"], :description => params["s"], :title => params["t"])
  end

end
