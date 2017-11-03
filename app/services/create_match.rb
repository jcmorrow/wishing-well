class CreateMatch
  def initialize(match:)
    @match = match
  end

  def perform
    @match.validate
    if valid?
      @match.save
      SimulateMatch.perform_later(match: @match)
    end
  end

  def success?
    valid? && @match.persisted?
  end

  private

  def valid?
    errors.empty?
  end

  def errors
    @match.errors
  end
end
