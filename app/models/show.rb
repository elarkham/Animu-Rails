class Show < ActiveRecord::Base
    has_many :episodes, dependent: :destroy
    #default_scope{ order("name") }
end
