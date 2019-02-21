class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    puts "testing:"
    puts user_params
    puts user.email
    user.save!
    puts user.errors.full_messages

    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name,:last_name, :email, :password, :password_confirmation)
  end

end
