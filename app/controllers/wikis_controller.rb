class WikisController < ApplicationController
  
  def new
    @wiki = Wiki.new
  end
  
  def create
    @wiki = Wiki.new(wiki_params)
    
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
    
    if @wiki.save
      redirect_to @wiki, notice: "Wiki Updated"
    else
      flash[:error] = "Error updating wiki"
    end
  end

  
  private
  
  def wiki_params
    params.require(:wiki).permit(:title, :body)
  end
  
end
