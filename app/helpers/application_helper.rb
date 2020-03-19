module ApplicationHelper
  def year_range
    (Date.current.year+1..(Date.current.year+10)).to_a
  end

  def month_names
    Date::MONTHNAMES.compact.each_with_index.map { |name,i| ["#{name}", i+1] }
  end
end
