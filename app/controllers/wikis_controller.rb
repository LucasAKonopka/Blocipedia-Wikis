class WikisController < ApplicationController
  
  
  def index
    @wikis = (current_user ? Wiki.not_private(current_user) : Wiki.free)
    authorize @wikis
  end
  
  def show
    @wiki = Wiki.find(params[:id])
  end
  
  def new
    @user = current_user.id
    @wiki = Wiki.new
    authorize @wiki
  end
  
  def create
    @wiki = Wiki.new(wiki_params)
    authorize @wiki
    @wiki.user = current_user
    
    if @wiki.save
      redirect_to @wiki, notice: "Wiki created successfully"
    else
      flash[:error] = "Error creating Wiki"
      render :new
    end
  end
  
  def update
    @wiki = Wiki.find(params[:id])
    @wiki.assign_attributes(wiki_params)
    authorize @wiki
    
    if @wiki.save
      redirect_to @wiki, notice: "Wiki Updated"
    else
      flash[:error] = "Error updating wiki"
    end
  end
  
  def destroy
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    
    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to action: :index
    else
      flash[:error] = "There was an error deleting the Wiki."
      render :show
    end
  end

  
  private
  
  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end
  
end
