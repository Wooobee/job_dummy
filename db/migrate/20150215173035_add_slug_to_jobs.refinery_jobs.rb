# This migration comes from refinery_jobs (originally 20140929182859)
class AddSlugToJobs < ActiveRecord::Migration
  def change
    add_column Refinery::Jobs::Job.table_name, :slug, :string
    add_index Refinery::Jobs::Job.table_name, :slug
  end
end