**README.md**

# Automated File Viewer with Timer

A Windows batch script designed to automatically open, display, and close files in sequence from a specified directory. Perfect for quick previews, quality checks, or automated presentations.

## 🚀 Features

- **Sequential Processing**: Automatically iterates through all files in a directory
- **Configurable Timing**: Displays each file for a customizable duration (default: 4 seconds)
- **Automatic Cleanup**: Force-closes applications after viewing to prevent resource accumulation
- **File Type Support**: Works with any file type that has a default Windows association
- **Error Handling**: Includes basic validation for directory existence and file accessibility

## 📋 Prerequisites

- Windows operating system
- Default applications associated with the file types you want to view
- Appropriate permissions to execute batch files and terminate processes

## 🛠️ Installation

1. Clone or download the batch file to your desired location
2. Ensure your target files are in a directory named `images` within the script's directory, or modify the `directory` variable to point to your preferred location

## 📝 Usage

1. **Basic Execution**:
   ```cmd
   double-click the batch file or run from command prompt
   ```

2. **Customization Options**:
   - Modify `example_path` variable to change the target directory
   - Adjust the `timeout /t 4` value to change display duration (in seconds)
   - Update taskkill commands to match your specific applications

## ⚙️ Configuration

Edit these variables in the script:

```batch
set "example_path=images"  // Change to your target folder
set "directory=%cd%\%example_path%"  // Full path construction
timeout /t 4  // Change number for different duration
```

## 🔧 Application-Specific Setup

The script requires custom taskkill commands for different file types. Example configurations:

```batch
// Add these within the loop for specific file types
if /i "%%~xf"==".txt" taskkill /im notepad.exe /f >nul 2>&1
if /i "%%~xf"==".jpg" taskkill /im mspaint.exe /f >nul 2>&1
if /i "%%~xf"==".png" taskkill /im mspaint.exe /f >nul 2>&1
if /i "%%~xf"==".pdf" taskkill /im AcroRd32.exe /f >nul 2>&1
if /i "%%~xf"==".docx" taskkill /im WINWORD.EXE /f >nul 2>&1
```

## ⚠️ Important Notes

- **Forceful Termination**: The script uses `taskkill /f` which forcibly closes applications without saving
- **Unsaved Work**: Ensure no important unsaved work is open before running
- **Application Variations**: Different systems may use different applications for the same file types
- **Admin Privileges**: Some applications may require administrator privileges to terminate

## 🎯 Use Cases

- **Quality Control**: Rapid visual inspection of multiple images or documents
- **Content Review**: Quick scanning of file contents in a folder
- **Automated Presentations**: Simple slideshow functionality
- **File Verification**: Checking file integrity and accessibility
- **Batch Processing Prep**: Preview files before running other batch operations

## 🔒 Security Considerations

- Only run scripts from trusted sources
- Review the taskkill commands to ensure they match your system's applications
- The script terminates processes forcefully - use with caution in production environments

## 🤝 Contributing

Feel free to customize the script for your specific needs:
- Add support for more file types
- Implement more graceful application closing
- Add logging capabilities
- Include progress indicators

## 📄 License

This script is provided as-is without warranty. Users are responsible for testing and adapting it to their specific environment needs.

---

**Note**: Always test with sample files before using in production environments. The forceful application termination may cause data loss if used with applications containing unsaved work.