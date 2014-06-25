class UsersController < ApplicationController
	#before_action , only:[:show]
  def new
  	@user=User.new
  end

  def create
  	@user=User.new(user_params)
  	respond_to do |format|
  		if @user.save
  			format.html { redirect_to @user, notice: 'User was successfully created.' }
  			#format.html{redirect_to user_path, notice: 'Signup'}
  			format.json { render action: 'show', status: :created, location: @user }
  		
  		else
  			render "new"
  		end
  	end
  end
  def login
    @user = User.new
  end
  def show
  end
  def user_params
  	params.require(:user).permit(:email,:password)
end
def set_user
	@user=User.find(params[:id])
end
def failed
  end
def athentication
  @user=User.find_by_email(params[:user][:email])
  #puts "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",@user[:password].inspect
  if @user && @user.password==params[:user][:password]
      redirect_to users_sucessful_path
      else
      redirect_to users_failed_path
  end
end
  def sucessfull
  end

end
