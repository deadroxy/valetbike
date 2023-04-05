class MainController < ApplicationController
  def index
  end
  def tutorial
    render(tutorial.html.erb)

  end
  def help
  end
end