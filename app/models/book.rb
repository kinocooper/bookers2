class Book < ApplicationRecord

  belongs_to:user

  validates:title,{presence:true}
  validates:body,{length:{maximum:200},presence:true}


  def get_profile_image(size)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize:size).processed
  end


  # def get_edit_route(x)
  #   if x == current_user.id
  #     edit_user_path(current_user.id)
  #   else
  #     user_path(current_user.id)
  #   end
  # end

end
