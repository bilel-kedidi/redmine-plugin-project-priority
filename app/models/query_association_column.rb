class QueryAssociationColumn < QueryColumn
  def initialize(name, options)
    super(name, options)
    
    @association = options[:association]
    @field = options[:field]
    
    # TODO not sure if this is necessary (or functional)
    def value(object)
      (object.send @association).send @field
    end
    
    # TODO set self.groupable = association.column
  end
  
  def name
    "#{@association}.#{@field}"
  end
end