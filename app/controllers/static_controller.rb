class StaticController < ApplicationController

	caches_page :company, :help

  def company
  end

  def help
  end

end
