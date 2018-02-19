class RegisteredPdf < Prawn::Document

  def initialize(event)
    super()
    @event = event
    document_header
    document_body
  end

  def document_header
    text "#{@event.title}", size: 30, style: :bold, :align => :center
    move_down 10
    text "#{@event.date}", size: 15, style: :bold, :align => :center
    move_down 10
    text "$#{@event.price}", size: 15, style: :bold, :align => :center
    move_down 20
  end

  def document_body
    i = 0
    @event.customers.each do |p|
    i += 1
    text "(#{i})", :align => :center, style: :bold
    text "<u>Name</u>", :align => :center, :inline_format => true, style: :bold
    text "#{p.first_name} #{p.last_name}", :align => :center
    move_down 20
    text "<u>Address</u>", :align => :center, :inline_format => true, style: :bold
    text "#{p.address1}", :align => :center
    move_down 20
    text "<u>Telephone</u>", :align => :left, :inline_format => true, style: :bold
    text "#{p.telephone}", :align => :left
    move_up 30
    text "<u>City</u>", :align => :center, :inline_format => true, style: :bold
    text "#{p.city}", :align => :center
    move_up 30
    text "<u>State</u>", :align => :right, :inline_format => true, style: :bold
    text "#{p.state}", :align => :right
    move_down 20
    text "<u>Zip</u>", :align => :left, :inline_format => true, style: :bold
    text "#{p.zip}", :align => :left
    move_up 30
    text "<u>Church</u>", :align => :center, :inline_format => true, style: :bold
    text "#{p.church}", :align => :center
    move_up 30
    text "<u>Gender</u>", :align => :right, :inline_format => true, style: :bold
    text "#{p.gender}", :align => :right
    move_down 20
    text "<u>Emerg. contact name</u>", :align => :left, :inline_format => true, style: :bold
    text "#{p.first_name2} #{p.last_name2}", :align => :left
    move_up 30
    text "<u>Emerg. contact #</u>", :align => :right, :inline_format => true, style: :bold
    text "#{p.telephone2}", :align => :right
    move_down 20
    text "<u>Emerg. contact relationship</u>", :align => :center, :inline_format => true, style: :bold
    text "#{p.relationship}", :align => :center
      if i >= 2
        move_down 100
      else
        move_down 30
      end
    end
  end

end
