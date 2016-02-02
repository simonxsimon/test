class SectionsController < ApplicationController
   layout "admin"
  def index
    @sections = Section.sorted
  end

  def show
    @page = Section.find(params[:id])
  end

  def new
    @page = Section.new({:name => "Default"})
  end

  def create
    @section = Section.new(pare_params)
    if @section.save
      flash[:notice] ="Section created sucessuflly"
      redirect_to(:action=> 'index')
    else
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice] = "section updated sucessfully."
      redirect_to(:action => 'show', :id => @section.id)
    else
      render('edit')

    end
  end
  

  def delete
    @section = Section.find(params[:id])

  end

  def destroy
    section = Section.find(params[:id]).destroy
    flash[:notice] ="section destroyed successfully."
    redirect_to(:action => 'index')
  end

  private
    def section_params
      params.require(:section).permit(:page_id, :name,:position,:visible, :content_type, :content)
    end
end