module OrganizationHelper
  private

  def find_org
    @org = Organization.find(params[:organization_id] || params[:id])

    if @org && current_user.organization_ids.include?(@org.id)
      return true
    end

    redirect_back notice: I18n.t('messages.not_found')
  end
end