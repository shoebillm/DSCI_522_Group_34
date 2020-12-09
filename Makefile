# Vancouver Graffiti Analysis Pipeline
# author: Kangbo Lu, Mengyuan Zhu, Mitchie Zhao, Siqi Zhou
# date: 2020-12-3

# run all the commands together
# usage: make all
all: data/dataset.csv src/eda.md src/eda.html data/processed/processed.csv results/graffiti_eda.png results/analysis.png data/analysis/estimation.csv data/analysis/analysis_table.csv doc/report.md doc/report.html

# download data
data/dataset.csv: src/download_data.py
	python src/download_data.py --url="https://opendata.vancouver.ca/explore/dataset/graffiti/download/?format=csv&timezone=Asia/Shanghai&lang=en&use_labels_for_header=true&csv_separator=%3B" --output_path="./data/dataset.csv"

# render eda report
src/eda.md src/eda.html: data/dataset.csv src/eda.Rmd
	Rscript -e "rmarkdown::render('src/eda.Rmd')"

# pre-process data:
data/processed/processed.csv: data/dataset.csv src/process_data.R
	Rscript src/process_data.R --input="data/dataset.csv" --output="data/processed/processed.csv"

# exploratory data analysis:
results/graffiti_eda.png: data/processed/processed.csv src/eda_graffiti.R
	Rscript src/eda_graffiti.R --input="data/processed/processed.csv" --output="results/graffiti_eda.png"

# statistic analysis:
results/analysis.png data/analysis/estimation.csv data/analysis/analysis_table.csv: data/processed/processed.csv src/analysis.R
	Rscript src/analysis.R --input="data/processed/processed.csv" --output1="results/analysis.png" --output2="data/analysis/estimation.csv" --output3="data/analysis/analysis_table.csv"

# render report:
doc/report.md doc/report.html: data/analysis/estimation.csv data/analysis/analysis_table.csv results/analysis.png doc/report.Rmd
	Rscript -e "rmarkdown::render('doc/report.Rmd', output_format = c('github_document', 'html_document'))"

# remove generated files
# usage: make clean
clean: 
	rm -rf data/dataset.csv data/processed/processed.csv data/analysis/estimation.csv data/analysis/analysis_table.csv
	rm -rf src/eda.md src/eda.html
	rm -rf results/graffiti_eda.png results/analysis.png
	rm -rf doc/report.md doc/report.html