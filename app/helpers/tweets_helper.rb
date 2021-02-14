module TweetsHelper

  def retweet_btn_feed(tweet)
    if current_user.present? && tweet.user != current_user
      link_to retweet_path(tweet), remote: true, data: { method: 'post' } do
        raw("<span class='icon'><i class='far fa-retweet-alt'></i></span>")
      end
    elsif current_user.present? && tweet.user.id == current_user.id
      link_to "javascript:void(0)", :onclick => 'alert("You cannot retweet your own tweet!")' do
        raw("<span class='icon'><i class='fas fa-retweet-alt'></i></span>")
      end
    else
      link_to login_path do
        raw("<span class='icon'><i class='fas fa-retweet-alt'></i></span>")
      end
    end
  end
end