require_relative 'libraries.rb'

work_directory = 'D:/Downloads'

# Key - name of folder, value - array of file extensions.
folders = {
  Pictures:  %w[.jpg .jpeg .gif .png],
  Archives:  %w[.zip .rar],
  Audio:     %w[.mp3],
  Programs:  %w[.exe .msi .bat .jar],
  Images:    %w[.iso],
  Video:     %w[.mkv .mp4 .avi],
  Torrents:  %w[.torrent],
  Documents: %w[.docx .doc .txt .pdf]
}

file_sorter = FileSorter.new()
file_sorter.work_directory = work_directory
file_sorter.folders = folders

file_sorter.go_to_work_directory
file_sorter.read_folder_content
file_sorter.create_folders
file_sorter.move_file_to_folder