module ApplicationHelper
  def bootstrap_class_for flash_type
    case flash_type
      when :success
        "alert-success"
      when :error
        "alert-error"
      when :alert
        "alert-block"
      when :notice
        "alert-info"
      else
        flash_type.to_s
    end
  end

  def profile_link_content
    %Q{Profile <i class='icon-wrench'></i>}.html_safe
  end

  def logout_link_content
    %Q{Logout <i class='icon-off'></i>}.html_safe
  end
end
