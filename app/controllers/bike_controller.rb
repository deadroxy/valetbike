
class StationsController < ApplicationController
  def edit
    @bike = Bike.find(params[:id])
  end

  def update
  @bike = Bike.find(params[:id])

  respond_to do |format|
    if @bike.update_attributes(params[:post])
      format.html { redirect_to(@bike,
                    :notice => 'Post was successfully updated.') }
      format.xml  { head :ok }
    else
      format.html { render :action => "edit" }
      format.xml  { render :xml => @bike.errors,
                    :status => :unprocessable_entity }
    end
  end
end
end
