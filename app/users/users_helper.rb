module UsersHelper

  def user_names
    user_names = @users.map(&:name).join(', ')
    user_names.present? ? user_names : "no users yet"
  end

end
