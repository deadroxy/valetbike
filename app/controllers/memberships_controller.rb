# Controller for membership passes
class MembershipsController < ApplicationController

  #Shows new membership based on the parameters of the chosen membership
  def new
    @membership = Membership.new(
      membershipName: params[:membershipName],
      membershipPrice: params[:membershipPrice],
      membershipTime: params[:membershipTime],
      membershipRidesNum: params[:membershipRidesNum])


  end

  #Creates a new membership based on the parameters of the chosen membership
  def create
    @membership = Membership.create(
      membershipName: params[:membershipName],
      membershipPrice: params[:membershipPrice],
      membershipTime: params[:membershipTime],
      membershipRidesNum: params[:membershipRidesNum])
  end

  def show
  end

  #Action for the index page that shows membership descriptions
  def index
  end

  def monthlyMembership
    @monthlyMembership = Membership.new("Monthly Membership", "$20", "1 Month", "Unlimited")
  end
  helper_method :monthlyMembership
end
