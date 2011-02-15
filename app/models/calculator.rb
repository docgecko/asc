class Calculator
  include Mongoid::Document
  field :salary, :type => Float, :default => 0.000
  field :employee, :type => Integer, :default => 0
  field :sick_days, :type => Float, :default => 0.000
  field :revenue, :type => Float, :default => 0.000
  
  attr_accessible :salary, :employee, :sick_days, :revenue
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
    (salary / employee).infinite? or (salary / employee).nan? ? "" : sprintf( "%.02f" , (salary / employee))
  end
  
  def average_sick_days
    (sick_days / employee).nan? ? "" : sprintf( "%.02f" , (sick_days / employee))
  end
  
  def revenue_employee
    (revenue / employee).nan? ? "" : sprintf( "%.02f" , (revenue / employee))
  end
  
  def steps
    %w[employee absence production result]    
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
