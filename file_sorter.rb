# Checks directory, creates new folders and sorts files in the current directory.
class FileSorter

  attr_writer :work_directory
  attr_writer :folders

  def initialize
    @work_directory = ''
    @dir_content = []
    @folders = {}
  end

  def go_to_work_directory
    Dir.chdir @work_directory
  end

  def read_folder_content
    @dir_content = Dir.entries @work_directory
  end

  def create_folders
    @folders.each_key do |folder|
      folder = folder.to_s
      next if @dir_content.include? folder
      Dir.mkdir folder
    end
  end

  def move_file_to_folder
    @dir_content.each do |item|
      if (File.file? item) && (File.exist? item)
        file_extension = File.extname item
      
        @folders.each_key do |folder|
          next if !@folders[folder].include?(file_extension) 
          FileUtils.mv item, "#{@work_directory}" + "/" + "#{folder.to_s}"
        end
      end
    end
  end
  
end