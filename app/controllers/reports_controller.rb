class ReportsController < ApplicationController
    def new
        @report = Report.new
    end

    def create

       if report_params= " "
        redirect_to '/reports/empty'
      
      else
        @report = Report.new(report_params)
    
        if @report.save
        
          redirect_to '/reports/success', notice: "Issue reported successfully."
        else
          render :new
        end
      end
    end
    
    private
    
    def report_params
        params.require(:report).permit(:description)
    end

end
