require 'nokogiri'

class Job
	attr_accessor :job_number, :prio, :jb_name, :jb_owner, :state, :start_time, :queue_name, :slots
	def initialize(job)
		@job_number = job.at_xpath("//JB_job_number").content
		@prio = job.at_xpath("//JAT_prio").content
		@jb_name = job.at_xpath("//JB_name").content
		@jb_owner = job.at_xpath("//JB_owner").content
		@state = job.at_xpath("//state").content
		@start_time = job.at_xpath("//JAT_start_time").content
		@queue_name = job.at_xpath("//queue_name").content
		@slots = job.at_xpath("//slots").content
	end
end


xml = Nokogiri::XML(File.open("test.xml"))

jobs = []


xml.xpath("//job_list").each do |job|
	puts job.at_xpath("//JB_job_number").content
	jobs << Job.new(job)
end

puts "#{jobs.length}"

# def get_running_jobs(xml)
# 	running_jobs = []
# 	xml.xpath("//job_list").each do |job|
# 		running_jobs << job if job.attribute("state") == "running"
# 	end
# 	running_jobs
# end

# # puts get_running_jobs(xml)

# def get_all_jobs(xml)
# 	xml.xpath("//job_list").each do |job|
# 		puts job.attribute("state")
# 		puts job.at_xpath("//JB_job_number").content
# 	end
# end
# get_all_jobs(xml)
