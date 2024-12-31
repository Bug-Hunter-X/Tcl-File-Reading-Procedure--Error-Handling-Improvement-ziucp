proc read_file {filename} { 
    set fileId [open $filename r]
    if {$fileId == -1} { 
        return -1
    }
    set content [read $fileId]
    if {[string length $content] == 0 && [gets $fileId] == -1} { 
        close $fileId
        return -2
    }
    close $fileId
    return $content
}

set filename "my_file.txt"
set file_content [read_file $filename]
if {$file_content == -1} { 
    puts "Error opening file"
} elseif {$file_content == -2} { 
    puts "Error reading file"
} else { 
    puts "File content:\n$file_content"
}

#Improved error handling checks if the read operation was successful.  Returns -2 if read fails after opening successfully.