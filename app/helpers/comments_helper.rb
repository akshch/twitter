module CommentsHelper
  def date(comment)
    comment.created_at.strftime('%d %h, %Y')
  end

  def comment_btn_feed(tweet)
    if current_user.present? && tweet.user != current_user && tweet.comments.blank?
      link_to tweet, class: "level-item" do
  			raw("<span class='icon'><i class='far fa-comment' aria-hidden='true' ></i></span>")
  	  end
    elsif current_user.present? && tweet.comments.present?
      link_to tweet, class: "level-item" do
  		  raw("<span class='icon'><i class='fas fa-comment' aria-hidden='true' ></i></span>")
  		end
    else
      link_to login_path do
        raw("<span class='icon'><i class='far fa-comment' aria-hidden='true' ></i></span>")
        end 
    end
  end
end
