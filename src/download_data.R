# download data with R placeholder

# takes a URL and a local file path as command line arguments which downloads and writes the file to your laptop
url <- ""
output_file <- "../data/dataset.csv"
download.file(url, output_file)
