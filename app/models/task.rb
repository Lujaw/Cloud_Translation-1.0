class Task < ActiveRecord::Base
  belongs_to :work
  belongs_to :worker

end
