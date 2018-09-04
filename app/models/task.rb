class Task < ActiveRecord::Base
  belongs_to :list
  validates :description, :presence => true

  scope(:not_completed, -> do
    where({:done => false})
  end)


  scope(:completed, -> do
    where({:done => true})
  end)
end
