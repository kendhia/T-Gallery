class StaticController < ApplicationController
  def about
    @page_title = "About"
  end
  
  def contact
    @page_title = "Contact"
  end

end
