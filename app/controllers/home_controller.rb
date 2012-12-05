class HomeController < ApplicationController
  def index
	  @skip_footer = true;
		@skip_header = true;
  end
end
