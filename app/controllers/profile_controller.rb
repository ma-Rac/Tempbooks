class ProfileController < ApplicationController
  before_action :authenticate_user!
  before_action :load_profile, only: [:show, :edit,  :update, :destroy]

  def new
    @profile = Profile.new
    @profile.user_id = current_user.id
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user

    if @profile.save
      redirect_to action: :show, notice: "Success!!1"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to action: :show, notice: "Success!!1"
    else
      render :edit
    end
  end

  def destroy
    if @profile.destroy
      redirect_to root_path, notice: "Sad to see you leave :("
    else
      redirect_to action: :show, notice: "Could not..."
    end
  end

  private

    def load_profile
      @profile = current_user.profile
      return @profile if @profile.present?

      redirect_to user_new_profile_path, notice: "Please create a profile first"
    end

    def profile_params
      params.require(:profile).permit(:avatar, :name, :description)
    end
end
