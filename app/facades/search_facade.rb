class SearchFacade
  def initialize(state)
    @state = state
  end

  def members
    @_members ||= members_data.map do |member_data|
      Member.new(member_data)
    end
  end

  def members_count
    members_data.count
  end


  private

    def members_data
      @_members_data ||= service.members_by_state(@state)[:results]
    end

    def service
      @_service ||= CongressService.new
    end
end
