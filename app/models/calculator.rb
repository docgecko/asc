class Calculator
  include Mongoid::Document
  field :salary, :type => Float, :default => 0.000
  field :employee, :type => Integer, :default => 0
  field :sick_days, :type => Float, :default => 0.000
  field :revenue, :type => Float, :default => 0.000
  field :sick_days_reduction, :type => Float, :default => 0.000
  
  attr_accessible :salary, :employee, :sick_days, :revenue, :sick_days_reduction
  attr_writer :current_step
  
  validates_presence_of :salary, :if => lambda { |c| c.current_step == 'employee' }, :message => '"must not be blank"'
  validates_presence_of :employee, :if => lambda { |c| c.current_step == 'employee' }, :message => '"must not be blank"'
  validates_presence_of :sick_days, :if => lambda { |c| c.current_step == 'absence' }, :message => '"must not be blank"'
    
  validates_numericality_of :salary, :greater_than => 0, :if => lambda { |c| c.current_step == 'employee' }, :message => '"must be greater than 0"'
  validates_numericality_of :employee, :greater_than => 0, :if => lambda { |c| c.current_step == 'employee' }, :message => '"must be greater than 0"'
  validates_numericality_of :sick_days, :greater_than => 0, :if => lambda { |c| c.current_step == 'absence' }, :message => '"must be greater than 0"'
  
  validates_format_of :salary, :with => /[-+]?([0-9]*\.[0-9]+|[0-9]+)/, :message => '"must be a number"'
  validates_numericality_of :employee, :only_integer => true, :message => '"must be a whole number"'
  validates_format_of :sick_days, :with => /[-+]?([0-9]*\.[0-9]+|[0-9]+)/, :message => '"must be a number"'
    
  def current_step
    @current_step || steps.first
  end
  
  def average_salary
    salary.to_f.nan? or employee.to_f.nan? or (sick_days.to_f / employee.to_f).nan? ? "" : sprintf( "%.02f" , (salary.to_f / employee.to_f))
  end
  
  def average_sick_days
    (sick_days.to_f / employee.to_f).nan? ? "" : sprintf( "%.02f" , (sick_days.to_f / employee.to_f))
  end
  
  def revenue_employee
    (revenue.to_f / employee.to_f).nan? ? "" : sprintf( "%.02f" , (revenue.to_f / employee.to_f))
  end
  
  def total_salary_sick_days
    sprintf( "%.02f" , (salary.to_f / employee.to_f * sick_days.to_f / 260))
  end
  
  def employee_salary_sick_days
    sprintf( "%.02f" , (salary.to_f / employee.to_f * sick_days.to_f / 260 / employee.to_f))
  end
  
  def new_sick_days
    sick_days.to_f == 0.0 ? "" : sprintf( "%.02f" , (sick_days.to_f / employee - sick_days_reduction.to_f))
  end
  
  def total_losses
    revenue.to_f + total_salary_sick_days.to_f
  end
  
  def total_savings
    sprintf( "%.02f", (total_losses.to_f * (sick_days_reduction.to_f * employee.to_f) / sick_days.to_f))
  end
  
  def employee_savings
    sprintf( "%.02f", (total_savings.to_f / employee.to_f))
  end
  
  def steps
    %w[employee absence production summary]    
  end
  
  def next_step
    self.current_step = steps[steps.index(current_step)+1]
  end

  def previous_step
    self.current_step = steps[steps.index(current_step)-1]
  end
  
  def first_step?
    current_step == steps.first
  end

  def last_step?
    current_step == steps.last
  end
end
