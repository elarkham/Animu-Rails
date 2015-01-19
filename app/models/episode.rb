class Episode < ActiveRecord::Base
    include VideoProcessor
    belongs_to :show
end
