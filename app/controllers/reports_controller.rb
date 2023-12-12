class ReportsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @report = Report.new()
  end

  def create
    @report = Report.new(params.require(:report).permit(:member_id, :bike_id, :description))
    @report.update(member_id: current_member.id)
    @report.update(date: DateTime.now)
    if @report.save
      redirect_to member_path(current_member.id)
    else
      render('new')
    end
  end

  def edit
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])
    if @report.update(params.require(:report).permit(:member_id, :bike_id, :description))
      redirect_to member_path(current_member.id)
    else
      render('new')
    end
  end
end
