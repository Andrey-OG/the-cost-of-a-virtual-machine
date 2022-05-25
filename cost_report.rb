require_relative "cost_sum"

class CostReport
  def self.report(n, type="max")
    if type == "max"
      CostSum::DATA.map { |id, cost| { id: id, cost: cost } }
        .sort_by { |line| line[:cost] }
        .last(n)
        .reverse
    else
      CostSum::DATA.map { |id, cost| { id: id, cost: cost } }
        .sort_by { |line| line[:cost] }
        .first(n)
    end
  end
end
