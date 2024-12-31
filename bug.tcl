proc read_file {filename} { 
    set fileId [open $filename r]
    if {$fileId == -1} { 
        return -1
    }
    set content [read $fileId]
    close $fileId
    return $content
}

set filename "my_file.txt"
set file_content [read_file $filename]
if {$file_content == -1} { 
    puts "Error opening file"
} else { 
    puts "File content:\n$file_content"
}

#The bug is that the proc does not check for errors during the read operation. If there is an error during the read operation, it will return an empty string, which could be mistaken for a file with no content.
#To fix this, the code could check for errors during the read operation. If an error is detected, it should return an error code. The calling code should check the return code to see if there was an error.