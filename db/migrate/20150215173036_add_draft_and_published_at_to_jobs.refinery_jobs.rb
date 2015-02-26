# This migration comes from refinery_jobs (originally 20140929185232)
class AddDraftAndPublishedAtToJobs < ActiveRecord::Migration
  def change
    add_column Refinery::Jobs::Job.table_name, :draft, :boolean
    add_column Refinery::Jobs::Job.table_name, :published_at, :datetime
  end
end
