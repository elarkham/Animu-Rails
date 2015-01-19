class DbtestController < ApplicationController
  def videos
    @videos = Video.all
  end
end
