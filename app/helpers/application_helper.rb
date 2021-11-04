module ApplicationHelper
	def active_class(path) #https://human-se.github.io/rails-demos-n-deets-2020/demo-bootstrap-navbar/
		if request.path == path # Compares current page to request page
    		return 'active' # For active page styling 
  		else
    		return ''
  		end
	end
end
