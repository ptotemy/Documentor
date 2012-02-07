class DocumentsController < ApplicationController

  def index
    @documents = Document.all
    @document = Document.new

  end

  def show

    @document = Document.find(params[:id])

  end

  def new
    @document = Document.new

  end

  def create
    @document = Document.new(params[:document])
    if @document.save
      redirect_to document_integrated_view_path, :notice => "Successfully created document."
    else
      render :new
    end
  end

  def edit
    @document = Document.find(params[:id])
    if !params[:get].nil?
      render :layout=>false
    end
  end

  def update
    @document = Document.find(params[:id])
    if @document.update_attributes(params[:document])
      redirect_to document_integrated_view_path, :notice => "Successfully updated document."
    else
      render :edit
    end
  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    redirect_to document_integrated_view_path, :notice => "Successfully destroyed document."
  end

  def parse_save_from_excel
    test_file = params[:excel_file]
    file = FileUploader.new
    if file.store!(test_file)
      book = Spreadsheet.open "#{file.store_path}"
      sheet1 = book.worksheet 0

      @document = []
      @errors = Hash.new
      @counter = 0

      sheet1.each 1 do |row|
        @counter+=1
        p = Document.new


        p.name = row[0]

        p.blank_form_file_name = row[1]
        unless Document.find_by_name_and_blank_form_file_name(p.name, p.blank_form_file_name)
          if p.valid?
            p.save
          else
            @errors["#{@counter+1}"] = p.errors
          end
        end
      end
      file.remove!
      if @errors.empty?
        redirect_to document, notice: 'All Dummy data were successfully uploaded.'
      else
        redirect_to document, notice: 'There were some errors in your upload'
      end

    else
      redirect_to document, notice: 'Dummy datum could not be successfully uploaded.'
    end
  end

  def integrated_view
    @documents = Document.all
    @document = Document.new
    render :layout=>'scaffold'

  end

  def document_customize_view
    @document=Document.find(params[:document_id])
    @components=Component.all
    @blank_sections = @document.blank_sections
    @blank_section=BlankSection.new


  end

  def structure_form

    @blank_section_count=params[:count].to_i

    @document = Document.find(params[:doc_id].to_i)
    @existing_blank_sections = @document.blank_sections
    @existing_blank_sections.each do |section|
      section.destroy
    end

    @blank_section_count.times do |i|

      @blank_section = BlankSection.new
      @blank_section.document_id=@document.id
      @blank_section.component_id=params[:fields][i][:comp_id].to_i
      @blank_section.xpos=params[:fields][i][:xpos].to_i
      @blank_section.ypos=params[:fields][i][:ypos].to_i
      @blank_section.height=params[:fields][i][:height].to_i
      @blank_section.width=params[:fields][i][:width].to_i
      @blank_section.save

    end

    render :text=>"Ok", :notice => 'Blank Section #{i} was successfully created.'
  end
end
