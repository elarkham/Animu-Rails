class StaticPagesController < ApplicationController
  include StaticPagesHelper
  def home
    #Shows I added
    @newShows = Show.all.order("created_at DESC").limit(20)

    #This Seasons Episodes
    @shows = Show.includes(:episodes).where( status: "current_season" )
    @episodes = []
    @shows.each do |show|
        show.episodes.each do |episode|
            @episodes << episode
        end
    end
    @episodes.sort! { |a,b|  DateTime.parse(b[:created_at].to_s) <=> DateTime.parse(a[:created_at].to_s) }
    @episodes=@episodes.slice(0..19)
  end

  def current_season
    @shows = Show.where( status: "current_season"  ).order("name")
  end

  def series
    @shows = Show.where( status: "archive"  ).order("name")
  end

  def ova
    @shows = Show.where( status: "ova"  ).order("name")
  end

  def movies
    @shows = Show.where( status: "movie"  ).order("name")
  end

  def random
    #randomId defined in helper class
    @random = randomId
    redirect_to controller: 'episodes', action: "show", id: @random.id
  end
end
