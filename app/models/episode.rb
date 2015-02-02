class Episode < ActiveRecord::Base
    include VideoProcessor
    #default_scope{ order("name") }
    belongs_to :show
    #has_one :show
end
