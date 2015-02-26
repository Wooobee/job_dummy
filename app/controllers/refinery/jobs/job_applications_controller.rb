module Refinery
  module Jobs
    class JobApplicationsController < ::ApplicationController
      include ControllerHelper

      before_filter :find_page
      before_filter :find_job, :only => [:new]

      def new
        @job_application = Refinery::Jobs::JobApplication.new

        present(@page)
      end

      def create
        @job_application = Refinery::Jobs::JobApplication.new(job_application_params)
        @job_id_integer  = Refinery::Jobs::Job.find_by_slug_or_id(params[:job_id])

        if !@job_id_integer.nil?
          @job_application.job_id = @job_id_integer.id
          @job                    = @job_application.job

          if @job_application.save
            
              begin
                JobMailer.notification(@job_application, request).deliver
              rescue
                logger.warn "There was an error delivering on job application notification.\n#{$!}\n"
              end

              if Refinery::Jobs::Setting.send_confirmation?
                begin
                  JobMailer.confirmation(@job_application, request).deliver
                rescue
                  logger.warn "There was an error delivering on job application confirmation:\n#{$!}\n"
                end
              
            end

            redirect_to refinery.jobs_job_job_application_url(@job, @job_application)
          else
            render :action => 'new'
          end
        else
          error_404
        end
      end

      def show
        @job_application = Refinery::Jobs::JobApplication.find(params[:id])
        @job             = @job_application.job

        present(@page)

        respond_to do |format|
          format.html { render :action => 'show' }
          format.xml  { render :xml => @future_student }
        end
      end

      private
        def job_application_params
          params.require(:job_application).permit!
        end
    end
  end
end