class UsersController < ApplicationController
	before_action :set_user, only:[:edit]
  def new
  	@user=User.new
  end

  def create
  	@user=User.new(user_params)
  	respond_to do |format|
  		if @user.save
  			format.html { redirect_to :back, notice: 'User was successfully created.' }
  			#format.html{redirect_to user_path, notice: 'Signup'}
  			format.json { render action: 'show', status: :created, location: @user }
  		
  		else
  			render "new"
  		end
  	end
  end
  def login
  	@user=User.all
  end
  def show
  end
  def user_params
  	params.require(:user).permit(:emial,:password)
end
def set_user
	@user=User.find(params[:id])
end

end
