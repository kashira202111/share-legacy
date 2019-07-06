class SubjectsController < ApplicationController

    def new
        @year = Year.find(params[:id])
        @subject = Subject.new
    end
    def create
        @subject = Subject.new(subject_params)

        respond_to do |format|
            if @subject.save
                format.html { redirect_to controller: 'years', action: 'showSubjectList', id: @subject.year_id, notice: 'Subject was successfully created!' }
                format.json { render :show, status: :created, location: @subject}
            else
                format.html { render :new }
                format.json { render json: @subject.errors, status: :unprocessable_entity }
            end
        end
    end

    private
        def subject_params
            params.require(:subject).permit(:year_id, :subject_name, :teacher_name)
        end

end
