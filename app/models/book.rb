class Book < ActiveRecord::Base
  belongs_to :user

  def range(short=true)
    print_string = short ? ('%b %d, %Y') : ('%B %d, %Y')
    [started, ended].compact.map{ |d| d.strftime( print_string ) }.join("<em> to </em>")
  end

  def full_name
    ["<b>#{name}</b>", "<em> #{author} </em>"].compact.join(" by ")
  end
end
