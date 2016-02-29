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
  
  
  private
  
  def wiki_params
    params.require(:wiki).permit(:title, :body)
  end
  
end
