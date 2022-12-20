class Funnel
  def initialize(capacity: 3, leaking_rate: 1)
    @capacity = capacity
    @leaking_rate = leaking_rate
    @left_quota = capacity
    @leaking_ts = Time.now
  end

  def wartering(quota)
    leaking
    if @left_quota >= quota
      @left_quota -= quota
      true
    end
    false
  end

  private

  def leaking
    now_ts = Time.now
    delta_ts = now - @leaking_ts
    leaking_quota = leaking_rate * delta_ts
    return if leaking_quota < 1

    @left_quota += leaking_quota
    @leaking_ts = now_ts
    @left_quota = @capacity if @left_quota > @capacity
  end
end
