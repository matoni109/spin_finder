module ApplicationHelper

  ## Image methods
  def cloudinary_imgs(key,instance)
    cl_image_tag(key, :height=>250, :width=>350, :fetch_format=>:auto, :crop=>"fill", :class=>"card-i.namg-top img-fluid mx-auto rounded", :alt=>"#{instance.name}")
  end

  def cloudinary_avatar_nav(key)
    cl_image_tag(key, :height=>250, :width=>350, :fetch_format=>:auto, :crop=>"fill", :class=>"avatar dropdown-toggle")
  end

end
# %= image_tag current_user.avatar.key, class: "avatar dropdown-toggle", id: "navbarDropdown", data: { toggle: "dropdown" }, 'aria-haspopup': true, 'aria-expanded': false %>
