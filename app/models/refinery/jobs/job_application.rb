require 'refinery/core/base_model'
require 'filters_spam'

module Refinery
  module Jobs
    class JobApplication < Refinery::Core::BaseModel
      self.table_name = 'refinery_job_applications'

      dragonfly_accessor :resume, :app => :refinery_jobs

      belongs_to :job, :class_name => "Refinery::Jobs::Job", :foreign_key => "job_id"

      validates_presence_of :name, :phone, :email, :cover_letter
      validates :email, format: {
        with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      }, length: { maximum: 255 }
      validates             :resume, :presence => true
      validates_with Refinery::Jobs::Validators::FileSizeValidator

      def self.latest(number = 5)
        limit(number).order('created_at DESC')
      end
    end
  end
end