class MembershipAssignmentController < ApplicationController
    def show
        @membershipassignment = MembershipAssignment.find(params[:id])
        @membership = @membershipassignment.membership
        @member = @membershipassignment.member
      end
    
      def new
        @membership = Membership.find(00006)
        @memberships = Membership.order(:position)
        @membershipassignment = MembershipAssignment.new
      end
    
      def create
        @membershipassignment = MembershipAssignment.new(membershipassignment_params)
        if @membershipassignment.save
          membership = Membership.find(@membershipassignment.membership_id)
          redirect_to(user_path)
          #redirect_to(pages_success_path)
        else
          @membershipassignment.get_membership
          render('new')
        end
      end
      
      def return
      end
    
      def index
      end
    
      def confirm
      end
    
      private 
    
      def membershipassignment_params 
        params.require(:membershipassignment).permit(:user_id, :membership_id)
      end
    
    end
    
