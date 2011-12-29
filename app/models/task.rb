class Task < ActiveRecord::Base
  belongs_to :work
  belongs_to :worker

def self.search(search)
  if search
    where(:status =>"Untranslated" )
  else
   scoped
  end
end

end
