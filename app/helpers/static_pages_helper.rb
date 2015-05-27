module StaticPagesHelper
  def randomId
    @shows = Show.includes(:episodes).where( random: "episodic" )
    @episodes = []
    @shows.each do |show|
        show.episodes.each do |e|
            @episodes << e
        end
    end
    return @episodes.sample
  end
end
