datalink = "https://datacenter.taichung.gov.tw/swagger/OpenData/fe8bc3b8-571f-493a-baf6-77cbc8ebfce2"
dataSet <- readr::read_csv(datalink)

dplyr::glimpse(dataSet)
# 哪個區域受傷最多
dataSet$區 |> 
  table() |>
  sort(decreasing = TRUE)

# 最常發生事故的位置
dataSet$事故位置 |>
  table() |>
  sort(decreasing = T)

# 當事者區分
dataSet$`當事者區分(類別)` |>
  table() |>
  sort(decreasing = T)

#主要肇因
dataSet$主要肇因 |>
  table() |>
  sort(decreasing = T)

#飲酒情形
dataSet$飲酒情形 |>
  table() |>
  sort(decreasing = T)

dataSet$飲酒情形 <-
  factor(
    dataSet$飲酒情形
  )

levels(dataSet$飲酒情形)
list(
  有 = list_summary_frequency[["飲酒情形"]][1:5]
  無 = list_summary_frequency[["飲酒情形"]][-c(1:5)]
)

#事故類型及型態
dataSet$事故類型及型態 |>
  table() |>
  sort(decreasing = T)

## 頻率統計 ----

### 應用function ----
summarise_frequency <- function(vect){
  # summarise frequency of each category in vect(or) input
  vect |>
    table() |>
    sort(decreasing = T)
}

dataSet$區 |>
  summarise_frequency()
dataSet$事故類別 |>
  summarise_frequency()

### 應用迴圈 ----
chosenColumns <-
  c("區",
    "事故位置", "當事者區分(類別)", "主要肇因",
    "飲酒情形", "事故類型及型態")
list_summary_frequency <-
  vector("list", length(chosenColumns))
names(list_summary_frequency) <- chosenColumns
for(.x in chosenColumns){
  list_summary_frequency[[.x]] <-
    summarise_frequency(dataSet[[.x]])
}
View(list_summary_frequency)

names(list_summary_frequency$事故位置)[1:5] <- c("交叉路口內", "一般車道", "交叉口附近",
                                             "慢車道", "快車道")

names(list_summary_frequency$`當事者區分(類別)`)[1:5] <- c("自用小客車", "普通重型機車",
                                                    "自用小貨車", "計程車", "租賃車") 

names(list_summary_frequency$主要肇因)[1:5] <- c("其他不當駕車行為", "未保持行車安全距離",
                                             "恍神、緊張、心不在焉分心駕駛", "倒車未依規定",
                                             "起步時未注意安全") 

names(list_summary_frequency$事故類型及型態)[1:5] <- c("其他", "追撞", "側撞", "同向擦撞",
                                                "路口交叉撞")
