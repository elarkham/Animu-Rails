class StaticPagesController < ApplicationController
  def home
  end

  def current_season
    @shows = Show.where( status: "current_season"  )
  end

  def archive
    @shows = Show.where( status: "archive"  )
  end
end
