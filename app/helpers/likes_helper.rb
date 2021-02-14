module LikesHelper

  def like_btn_feed(tweet)
    if current_user.present? && current_user.likes?(tweet)
      link_to likes_path(tweet), class: "level-item", remote: true, data: { method: 'post' } do
  			raw("<span class='icon'><i class='fas fa-heart' aria-hidden='true' ></i></span>")
  	  end
    elsif current_user.present? && !current_user.likes?(tweet)
      link_to likes_path(tweet), class: "level-item", remote: true, data: { method: 'post' } do
  		raw("<span class='icon'><i class='far fa-heart' aria-hidden='true' ></i></span>")
  		end
    else
      link_to login_path do
        raw("<span class='icon'><i class='far fa-heart' aria-hidden='true' ></i></span>")
        end 
    end
  end
end
