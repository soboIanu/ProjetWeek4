class CorsairsController < ApplicationController
  def new
    @corsair = Corsair.new()
  end

  def create
    @corsair = Corsair.new(corsair_params)
    if @corsair.save
      flash[:success] = "Bienvenue sur notre site trop bien!"
      redirect_to corsairs_path
    else
      flash[:failure] = "Allo t'as rien écrit"
      redirect_to new_corsair_path
    end
  end

  def corsair_params
    params.require(:corsair).permit(:first_name, :age, :bio, :likeness, :slack_handle, :github_handle)
  end

  def update
    @corsair = Corsair.find(params[:id])
    @corsair.update(corsair_params)

    redirect_to corsairs_url(@corsair)
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
