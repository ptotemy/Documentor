class BlankSectionsController < ApplicationController

def index
    @blank_sections = BlankSection.all
    @blank_section = BlankSection.new

  end
def show

    @blank_section = BlankSection.find(params[:id])

end
 def new
    @blank_section = BlankSection.new

  end

def create
    @blank_section = BlankSection.new(params[:blank_section])
if @blank_section.save
      redirect_to blank_sections_url, :notice => "Successfully created blank section."
    else
      render :new
    end
  end
 def edit
    @blank_section = BlankSection.find(params[:id])
if !params[:get].nil?
 render :layout=>false
end
  end

  def update
    @blank_section = BlankSection.find(params[:id])
if @blank_section.update_attributes(params[:blank_section])
      redirect_to blank_sections_url, :notice => "Successfully updated blank section."
    else
      render :edit
    end
  end
def destroy
  @blank_section = BlankSection.find(params[:id])
@blank_section.destroy
  redirect_to blank_sections_url, :notice => "Successfully destroyed blank section."
end
def parse_save_from_excel
    test_file = params[:excel_file]
    file = FileUploader.new
    if file.store!(test_file)
      book = Spreadsheet.open "#{file.store_path}"
      sheet1 = book.worksheet 0

       @blank_section  = []
      @errors = Hash.new
      @counter = 0

      sheet1.each 1 do |row|
        @counter+=1
        p = BlankSection.new



         p.document_id = row[0]



         p.component_id = row[1]



         p.xpos = row[2]



         p.ypos = row[3]



         p.width = row[4]

         p.height = row[5]
        unless BlankSection.find_by_document_id_and_component_id_and_xpos_and_ypos_and_width_and_height(p.document_id,p.component_id,p.xpos,p.ypos,p.width,p.height)
          if p.valid?
            p.save
          else
            @errors["#{@counter+1}"] = p.errors
          end
        end
      end
      file.remove!
      if @errors.empty?
        redirect_to blank_section, notice: 'All Dummy data were successfully uploaded.'
      else
        redirect_to blank_section, notice: 'There were some errors in your upload'
      end

    else
      redirect_to blank_section, notice: 'Dummy datum could not be successfully uploaded.'
    end
  end
def integrated_view
  @blank_sections = BlankSection.all
      @blank_section = BlankSection.new
render :layout=>'scaffold'

end
end
