class Task < ApplicationRecord
	belongs_to :list
	validates_presence_of :name
	validates_uniqueness_of :name

	def self.to_list(task)
		new_list = List.new
		new_list.list_id = task.list_id
		new_list.name = task.name
		new_list.description = task.description
		new_list.status = 'Not started'
		task.destroy
		new_list
	end

end
