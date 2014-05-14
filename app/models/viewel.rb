class Viewel < ActiveRecord::Base
  
  belongs_to :user
  attr_accessible :body, :private

  acts_as_followable
  
  def self.viewable_by(user)
    user.viewels.merge(user.followed_viewels)
  end
  
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
