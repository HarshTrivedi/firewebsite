class AdminContentsController < ApplicationController
	layout 'admin_content_editor_layout'


	def edit_content

		if current_admin_user.nil?
			redirect_to "/admin" and return
		end

		@model_name = params[:model_name].classify rescue nil
		@id = params[:id]
		@attribute = params[:attribute]
		@redirection_link = "http://localhost:3000/content_editor/tab/1/content"
		@content_to_edit = eval("#{@model_name}.find_by_id(#{@id}).#{@attribute} rescue nil")		
		logger.info @content_to_edit
		# render :nothing => true
	end


	def update_content_and_redirect

		if current_admin_user.nil?
			redirect_to "/admin" and return
		end

		model_name = params[:model_name].classify rescue nil
		id = params[:id]
		attribute = params[:attribute]
		updated_content = params[:updated_content]
		redirection_link = params[:redirection_link]
		
		@object_to_update = eval("#{model_name}.find_by_id(#{id}) rescue nil")
		command = "@object_to_update.#{attribute} = updated_content; @object_to_update.save"
		eval command
		
		message = "Updated Successfully !"
		redirect_to redirection_link, :flash => {:success => message}

	end

end
