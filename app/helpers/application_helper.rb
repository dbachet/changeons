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

  def my_links_link_content
    "#{t('.my_links')} <i class='icon-external-link'></i>".html_safe
  end

  def profile_link_content
    "#{t('.profile')} <i class='icon-wrench'></i>".html_safe
  end

  def logout_link_content
    "#{t('.sign_out')} <i class='icon-off'></i>".html_safe
  end
end
