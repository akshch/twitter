module ApplicationHelper
  
  def flash_notice
    if flash[:notice]
      raw("<div class='notification is-primary global-notification float-right w-100'>
        <p class='notice'>#{notice}</p>
      </div>")
    end
  end

end
