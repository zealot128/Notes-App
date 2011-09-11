module PagesHelper
  def gemfile_credits
    File.read("#{Rails.root}/Gemfile").split("\n").select{|i| i.match /^\s*gem/}.map{|i| i.split(" ")[1].gsub("'","").gsub('"',"").gsub(",","")}.sort_by{|i| i.downcase}.join(", ")
  end
end
