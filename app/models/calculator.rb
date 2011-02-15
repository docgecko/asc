class Calculator
  include Mongoid::Document
  field :salary, :type => Float, :default => 0.000
  field :employee, :type => Integer, :default => 0
  field :sick_days, :type => Float, :default => 0.000
  field :revenue, :type => Float, :default => 0.000
  
  attr_accessible :salary, :employee, :sick_days, :revenue
  
  validates_presence_of :salary, :if => lambda { |c| c.current_step == 'employee' }, :message => '"must not be blank"'
  validates_presence_of :employee, :if => lambda { |c| c.current_step == 'employee' }, :message => '"must not be blank"'
  validates_presence_of :sick_days, :if => lambda { |c| c.current_step == 'absence' }, :message => '"must not be blank"'
    
  validates_numericality_of :salary, :greater_than => 0, :if => lambda { |c| c.current_step == 'employee' }, :message => '"must be greater than 0"'
  validates_numericality_of :employee, :greater_than => 0, :if => lambda { |c| c.current_step == 'employee' }, :message => '"must be greater than 0"'
  validates_numericality_of :sick_days, :greater_than => 0, :if => lambda { |c| c.current_step == 'absence' }, :message => '"must be greater than 0"'
  
  validates_format_of :salary, :with => /[-+]?([0-9]*\.[0-9]+|[0-9]+)/, :message => '"must be a number"'
  validates_numericality_of :employee, :only_integer => true, :message => '"must be a whole number"'
  validates_format_of :sick_days, :with => /[-+]?([0-9]*\.[0-9]+|[0-9]+)/, :message => '"must be a number"'
  
  attr_accessible :salary, :employee, :sick_days
  attr_writer :current_step
  
  def current_step
    @current_step || steps.first
  end
  
  def average_salary
    (salary / employee).to_f
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
