# Vancouver Graffiti Analysis Pipeline
# author: Kangbo Lu, Mengyuan Zhu, Mitchie Zhao, Siqi Zhou
# date: 2020-12-3

all: data/dataset.csv

# download data
output_file_path: required_script_file and input_file_here
    python src/download_data.py --url="https://opendata.vancouver.ca/explore/dataset/graffiti/download/?format=csv&timezone=Asia/Shanghai&lang=en&use_labels_for_header=true&csv_separator=%3B" --output_path="./data/dataset.csv"

## create eda report
#output_file_path: required_script_file and input_file_here
#    Rscript -e "rmarkdown::render('src/eda.Rmd')"

## pre-process data:  required_script_file and input_file_here
#output_file_path: src/pre_process_wisc.r data/raw/wdbc.feather
#    Rscript src/process_data.R --input="data/dataset.csv" --output="data/processed/processed.csv"

## exploratory data analysis: required_script_file and input_file_here
#output_file_path: src/eda_wisc.r data/processed/training.feather
#    Rscript src/eda_graffiti.R --input="data/processed/processed.csv" --output="results/graffiti_eda.png"

## statistic analysis:
#output_file_path: required_script_file and input_file_here
#    Rscript src/analysis.R --input="data/processed/processed.csv" --output="results/analysis.png"
## render report
#output_file_path: required_script_file and input_file_here
#    Rscript -e "rmarkdown::render('doc/report.Rmd', output_format = 'github_document')"

clean: 
    rm -rf  data/dataset.csv
