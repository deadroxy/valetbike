class ReportsController < ApplicationController
    def new
        @report = Report.new
    end

    def create
        @report = Report.new(report_params)
        if @report.description.blank?
          flash[:danger]= "Description can't be blank."
          redirect_to '/reports/empty'
        elsif @report.save
          flash[:success]= "Report submitted successfully."
          redirect_to '/reports/success'
        else
          render :new
        end
    end
    
    private
    
    def report_params
        params.require(:report).permit(:description)
    end

end
