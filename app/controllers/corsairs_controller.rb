class CorsairsController < ApplicationController
  def new
    @corsair = Corsair.new()
  end

  def create
    @corsair = Corsair.new(user_params)
    if @corsair.save
      flash[:success] = "Bienvenue sur notre site trop bien!"
      redirect_to corsairs_path
    else
      render "new"
    end
  end

  def user_params
    params.require(:corsair).permit(:first_name, :age)
  end

  def update
  end

  def edit
    @corsair = Corsair.find(params[:id])
  end

  def destroy
    @corsair = Corsair.find(params[:id])
    @corsair = @corsair.destroy
    flash[:success] = "Corsair supprimé !"
    redirect_to corsairs_url
  end

  def index
    @corsairs = Corsair.all
  end

  def show
    @corsair = Corsair.find(params[:id])
  end
end
