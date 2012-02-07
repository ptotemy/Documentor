class Upload < ActiveRecord::Base
  has_attached_file :xls


  def self.create_users(upload_id)
    require "spreadsheet"

    @upload=Upload.find(upload_id)
    @path=@upload.xls.path
    book = Spreadsheet.open @path
    sheet1 = book.worksheet 0

    sheet1.each 1 do |row|

      if User.find_by_email(row[4].to_s).nil?

        @user=User.new
        @user.password=row[1]
        @user.password_confirmation=row[1]
        @user.email=row[0].to_s
        @user.department_id=@upload.department_id
        @user.save!


      end
    end
  end
end


