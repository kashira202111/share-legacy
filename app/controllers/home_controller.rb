class HomeController < ApplicationController

  def index
    @years = Year.all
  end
  def showSubjectList
  end
  def new
    @year = Year.new
  end
  def create
    @year = Year.new(year_params)
    respond_to do |format|
      if @year.save
        format.html { redirect_to controller:home ,action:"index" , notice: 'Year was created.'}
      else
        format.html { render :newYears}
      end
  end


  private
    def year_params
      params.require(:year).permit(:year)
    end
  end
end
