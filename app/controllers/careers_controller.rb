class CareersController < ApplicationController
  before_action :set_career, only: [:edit, :update, :destroy]

  def index
    if current_user.root == true or current_user.HR == true
      @user = User.all.where(retired: false, root: false).pluck(:id)
      @q = Career.all.where(user_id: @user).ransack(params[:q])
    elsif current_user.admin == true
      @user = User.all.where(retired: false, admin: false, HR: false, root: false).pluck(:id)
      @user << current_user.id
      @q = Career.all.where(user_id: @user).ransack(params[:q])
    else
      @q=current_user.careers.ransack(params[:q])
    end
    @careers = @q.result(distinct: true).recent.page(params[:page]).per(10)

    respond_to do |format|
      format.html
      format.csv { send_data @careers.generate_csv, filename: "careers-#{Time.zone.now.strftime('%Y%m%d%S')}.csv"}
    end

    @fiscal_year=fiscal_year
  end

  def show
    if current_user.root == true or current_user.HR == true or current_user.admin == true
      @career=Career.find(params[:id])
    else
      @career = current_user.careers.find(params[:id])
    end
  end

  def new
    @career = Career.new
  end

  def edit
  end

  def create
    @career = current_user.careers.new(career_params)

    if @career.save
      redirect_to @career, notice: "キャリアプランを登録しました。"
    else
      flash[:alert]= 'Save error!'
      render :new
    end
  end

  def update
    if @career.update(career_params)
      redirect_to careers_path, notice: "キャリアプランを更新しました。"
    else
      flash[:alert]= 'Save error!'
      render :edit
    end
  end

  def destroy
    @career.destroy
    redirect_to careers_path, notice: "キャリアプランをを削除しました。"
  end

  private

  def career_params
    params.require(:career).permit(Career.column_names.map{|c| c.to_sym})
  end

  def set_career
    if current_user.root == true
      @career=Career.find(params[:id])
    else
      @career = current_user.careers.find(params[:id])
    end
  end
end
