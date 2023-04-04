class MembershipController < ApplicationController
  def index
    #should add a position and order by that
    @memberships = Membership.order(:position)
  end

  def show
    @membership = Membership.find(params[:id])
  end

  def new
    @membership = Membership.new
  end

  def create
    @membership = Membership.new(membership_params)
    
    if @membership.save
      redirect_to(memberships_path)
    else
      render('new')
    end
  end

  def edit
    @membership = Membership.find(params[:id])
  end

  def update
    @membership = Membership.find(params[:id])
    if @membership.update(membership_params)
      redirect_to(memberships_path)
    else
      render('edit')
    end
  end

  def delete
    @membership = Membership.find(params[:id])
  end

  def destroy
    @membership = Membership.find(params[:id])
    @membership.destroy
    redirect_to(memberships_path)
  end
  private
  
  def membership_params
    params.require(:membership).permit(:name)
  end
end
