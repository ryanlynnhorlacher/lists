class List < ApplicationRecord
	has_many :tasks, dependent: :destroy
	has_many :lists, dependent: :destroy
	validates_presence_of :name

	@@bread_crumbs = []

	def search_name(name)
		List.where(name: name)
	end

	def search_status(status)
		List.where(status: status)
	end

	def self.set_bread_crumbs(id)
		if @@bread_crumbs.include?(id)
			index = @@bread_crumbs.find_index(id)
			for i in 0..@@bread_crumbs.length - (index)
				@@bread_crumbs.delete_at(index + i)
			end
		end
		@@bread_crumbs << (id)
	end

	def self.bread_crumbs
		@@bread_crumbs
	end

	def self.reset_bread_crumbs
		@@bread_crumbs = []
	end

end

# 1, 2,  3,  4, 5, 6, 7 = Count
# 0, 1, '2', 3, 4, 5, 6 = Index

