class MembersController < ApplicationController
  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)

    if @member.save
      session[:member_id] = @member.id
      redirect_to root_path, notice: 'Account created successfully!'
    else
      render :new
    end
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to member_path(current_member.id)
    else
      render('edit')
    end
  end

  private

  def member_params
    params.require(:member).permit(:username, :email, :password, :password_confirmation)
  end
end
