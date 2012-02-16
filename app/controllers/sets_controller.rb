class SetsController < ApplicationController

def index
    @sets = Set.all
    @set = Set.new

  end
def show

    @set = Set.find(params[:id])

end
 def new
    @set = Set.new

  end

def create
    @set = Set.new(params[:set])
if @set.save
      redirect_to sets_url, :notice => "Successfully created set."
    else
      render :new
    end
  end
 def edit
    @set = Set.find(params[:id])
if !params[:get].nil?
 render :layout=>false
end
  end

  def update
    @set = Set.find(params[:id])
if @set.update_attributes(params[:set])
      redirect_to sets_url, :notice => "Successfully updated set."
    else
      render :edit
    end
  end
def destroy
  @set = Set.find(params[:id])
@set.destroy
  redirect_to sets_url, :notice => "Successfully destroyed set."
end
def parse_save_from_excel
    test_file = params[:excel_file]
    file = FileUploader.new
    if file.store!(test_file)
      book = Spreadsheet.open "#{file.store_path}"
      sheet1 = book.worksheet 0

       @set  = []
      @errors = Hash.new
      @counter = 0

      sheet1.each 1 do |row|
        @counter+=1
        p = Set.new

         p.name = row[0]
        unless Set.find_by_name(p.name)
          if p.valid?
            p.save
          else
            @errors["#{@counter+1}"] = p.errors
          end
        end
      end
      file.remove!
      if @errors.empty?
        redirect_to set, notice: 'All Dummy data were successfully uploaded.'
      else
        redirect_to set, notice: 'There were some errors in your upload'
      end

    else
      redirect_to set, notice: 'Dummy datum could not be successfully uploaded.'
    end
  end
def integrated_view
  @sets = Set.all
      @set = Set.new
render :layout=>'scaffold'

end
end
