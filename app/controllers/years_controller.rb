class YearsController < ApplicationController

  def index
    @years = Year.all
  end

  def showSubjectList
      @year = Year.find(params[:id])
      @subjects = @year.subjects
  end
  
  def new
    @year = Year.new
  end

  def create
    @year = Year.new(year_params)
    respond_to do |format|
      if @year.save
        format.html { redirect_to years_path, notice: 'Year was successfuly created.'}
      else
        format.html { render :new}
      end
    end
  end


  private
    def year_params
      params.require(:year).permit(:year)
    end
end
