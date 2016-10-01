# Arundo R code for project

If you clone this repository onto your computer, it will create a folder with all of the code. I haven't added the data to the code, because they are large files (and may be proprietary). Therefore, to get the code to run, you will need to set up the folder as such:


```
arundo/
    arundo_code/
    figs/
    data/
    .gitignore
    arundo.Rproj
    README.md
```

That means you will need to add in `data` and `figs` folders into the root folder. Then within the data folder, I have mine setup as:

```
data/
    CLASS_sensor_data.csv
    p1_sensor_data.csv
    sensor_data_transposed.csv
```

Where `p1_sensor_data.csv` is the cleaned and transposed column with only 6 columns, `sensor_data_transposed.csv` is the transposed version of the dataset, and `CLASS_sensor_data.csv` contains the original, unaltered version of the data.

You can also run the `arundo_data_read.R` script to create the necessary csvs so long as you have the `CLASS_sensor_data.csv` file in the `data/` folder.




