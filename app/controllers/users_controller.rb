class UsersController < ApplicationController
  before_action :require_root_HR, only: [:index, :show, :new, :create, :destroy, :retied]
  before_action :require_current_user, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update, :destroy, :retired]

  def index
    @q=User.all.ransack(params[:q])
    @users = @q.result(distinct: true).recent.page(params[:page]).per(10)

    @users_all=User.all.recent
    respond_to do |format|
      format.html
      format.csv { send_data @users_all.generate_csv, filename: "users-#{Time.zone.now.strftime('%Y%m%d%S')}.csv"}
    end

    @confirmation=false
  end

  def show
  end

  def new
    @user=User.new
  end

  def edit
  end

  def create
    @user=User.new(user_params)
    if @user.save
      redirect_to users_path, notice: "ユーザ「#{@user.name}」を登録しました。"
    else
      flash[:alert]= 'Save error!'
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "ユーザ「#{@user.name}」を更新しました。"
    else
      flash[:alert]= 'Save error!'
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: "ユーザ「#{@user.name}」を削除しました。"
  end

  def retired
    @user.retired=true
    @user.save
    redirect_to users_path, notice: "ユーザ「#{@user.name}」を退職者に登録しました。"
  end

  private
    def user_params
      params.require(:user).permit(User.column_names.map{|c| c.to_sym} + %i(image))
    end

    def set_user
      if current_user.HR || current_user.root
        @user=User.find(params[:id])
      else
        @user = current_user
      end
    end

    def require_current_user
      unless current_user.HR || current_user.root
        unless current_user.id==params[:id].to_i
          flash[:notice]="権限がありません。"
          redirect_to user_path(current_user)
        end
      end
    end

    def require_root_HR
      unless (current_user.root || current_user.HR)
        redirect_to portal_path
      end
    end

end
