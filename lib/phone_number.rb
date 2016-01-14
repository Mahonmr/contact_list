class Phone_Number
  attr_reader(:area_code, :number)
  define_method(:initialize) do |attributes|
    @area_code = attributes.fetch("area_code")
    @number = attributes.fetch("number")
  end
end
