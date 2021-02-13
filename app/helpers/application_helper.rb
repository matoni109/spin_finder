module ApplicationHelper

  ## Image methods bikes on index page with map
  def cloudinary_imgs(key,instance)
    cl_image_tag(key, :height=>250, :width=>350, :fetch_format=>:auto, :crop=>"fill", :class=>"card-i.namg-top img-fluid mx-auto rounded", :alt=>"#{instance.name}")
  end

  ### on bikes show page
     def cloudinary_imgs_cara(key,instance)
    cl_image_tag(key, :quality=>"auto", :fetch_format=>:auto, :crop=>"fit", :class=>"d-block mx-auto img-fluid rounded", :alt=>"#{instance.name}")
    end

  def cloudinary_avatar_nav(key)
    cl_image_tag(key, :height=>250, :width=>350, :fetch_format=>:auto, :crop=>"crop", :class=>"avatar dropdown-toggle")
  end

  def cloudinary_avatar_profile(key)
    cl_image_tag(key,  :fetch_format=>:auto, :class=>"avatar")
  end

end
# %= image_tag current_user.avatar.key, class: "avatar dropdown-toggle", id: "navbarDropdown", data: { toggle: "dropdown" }, 'aria-haspopup': true, 'aria-expanded': false %>
