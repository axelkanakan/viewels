class Viewel < ActiveRecord::Base
  
  belongs_to :user
  attr_accessible :body

  auto_html_for :body do
    html_escape
    image
    youtube(:width => 400, :height => 400)
    vimeo(:width => 400, :height => 400)
    worldstar(:width => 400, :height => 400)
    instagram(:width => 400, :height => 400)
    dailymotion(:width => 400, :height => 400)
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end

end
