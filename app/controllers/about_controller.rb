class AboutController < ApplicationController

  respond_to :html, :pdf

  layout 'about'

  def index
    @version = params[:version]
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "about-sharp-#{@version}.pdf", :template => "about/index.html.erb", layout: 'about', 
          save_to_file: Rails.root.join('public', "about-sharp-#{@version}.pdf")
      end
    end
  end
end
