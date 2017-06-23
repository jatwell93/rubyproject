module ApplicationHelper
  
  
    # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "FitnessLabs (A & K LABS)"
    return page_title.empty? ?  base_title :  page_title + " | " + base_title
  end

  def user?(user)
    user.nil? ? false : true
  end
  
  def owner_check(owner)
    current_user.id == owner
  end

  def call_gravatar(user)
    # Wrapper for the gravatar_for in application_helper
    if user?(user)
      render partial: 'shared/gravatar_section', locals: {user: user}
    else
      return "Nothing to see here"
    end
  end
  
  def gravatar_for(user, options = { size: 80})
    if !user.nil?
      gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
      size = options[:size]
      gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
      image_tag(gravatar_url, alt: user.first_name, class: "gravatar")
    else
      "Gravatar User is nil!"
    end
  end
 
  def active_page(active_page)
    @active == active_page ? "active" : ""
  end
    
  def devise_error_messages!
    return '' if resource.errors.empty?
    messages = resource.errors.full_messages.map {
      |msg| content_tag(:li, msg)}.join
    html = <<-HTML
      <div class="alert alert-error alert-danger">
      <a href='#' class='close' data-dismiss="alert"> &#215;</a>
      <%= content_tag :div , msg if msg.is_a(String) %>
      </div>
      HTML
    html.html_safe
  end

end


