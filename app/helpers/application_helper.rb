module ApplicationHelper
  include Pagy::Frontend

  def cellphone(entity)
    return "+244 " + entity.gsub(/(.{3})(?=.)/, '\1 \2') if entity != nil 
  end

  def format_in_3(entity)
    return entity.gsub(/(.{3})(?=.)/, '\1 \2') if entity != nil 
  end
  
  def date(datetime)
    return datetime.strftime("%d %b %Y") unless datetime == nil
  end

  def iban(user)
    return "AO06 " + user.iban.gsub(/(.{4})(?=.)/, '\1 \2') if user.iban != nil
  end
end
