class Plan
  include Mongoid::Document
  include Mongoid::Timestamps

  field :date, :type => Date
  field :actual_plan, :type => String
  field :report_plan, :type => String
end
