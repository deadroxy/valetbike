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
          puts membership_assignment_confirm_path(:membership_assignment_id => @membershipassignment)
          redirect_to membership_assignment_confirm_path(:membership_assignment_id => @membershipassignment)
          #redirect_to(checkouts_create_path, params: {:id => @membershipassignment.id, :type => 0}, remote: true, action: :post)
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
        @membership_assignment = MembershipAssignment.find(params[:membership_assignment_id])
      end
    
      private 
    
      def membershipassignment_params 
        params.require(:membership_assignment).permit(:user_id, :membership_id)
      end
    
    end
    
