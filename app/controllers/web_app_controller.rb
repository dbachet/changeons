class WebAppController < ApplicationController
  respond_to :html

  def index
    render text: '', layout: 'application'
  end
end
