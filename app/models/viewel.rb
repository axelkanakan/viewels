class Viewel < ActiveRecord::Base
  
  belongs_to :user
  attr_accessible :body, :private, :avatar, :title

  acts_as_followable
  
 
  
  auto_html_for :body do
    html_escape
    image
    youtube(:width => 560, :height => 315)
    vimeo(:width => 560, :height => 315)
    worldstar(:width => 560, :height => 315)
    instagram(:width => 560, :height => 315)
    dailymotion(:width => 560, :height => 315)
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end

end
