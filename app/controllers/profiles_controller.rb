class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_profile, only:[:edit,:show,:update,:destroy]
  
  def show

  end

  
  def new
    return redirect_to edit_profile_path(current_user.profile) if current_user.profile.present?
    @profile = Profile.new
  end

  def edit
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    if @profile.save
      redirect_to posts_path, notice:'プロフィールを作成しました。'
    else
      render :new
    end
  end

  def update
    if @profile.update(profile_params)
      redirect_to posts_path, notice:'プロフィールを更新しました。'
    else
      render :edit
    end
  end

  def destroy
    if @profile.update
      redirect_to posts_path, notice:'プロフィールを削除しました。'
    else
      redirect_to posts_path, alert:'プロフィールを削除できませんでした。'
    end
  end
  
  private
  def find_profile
    @profile = Profile.find(params[:id])
  end
  
  def profile_params
    params.require(:profile).permit(
      :name,:age,:occupation,:experience,:image
      )
  end

end
