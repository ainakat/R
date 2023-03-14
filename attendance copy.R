
data <- read.csv("/Users/aina/Desktop/attendance.csv", skip = 1) #load data

data <- data %>% 
  select(Student.Name, Class.Date)



count <- as.data.frame(table(data$Student.Name))
dates <- as.data.frame(table(data$Class.Date))

absentees <- count %>%
  filter(Freq < 10)

absentees$absences <- 10 - absentees$Freq

updated <- read.csv("/Users/aina/Desktop/attendanceupdated.csv") #load data


updated <- updated %>% 
  select(Student.Name, Class.Date,Attendance)

count2 <- as.data.frame(table(updated$Attendance, updated$Student.Name))
dates <- as.data.frame(table(updated$Class.Date))

updated$presence <- 0
if (updated$Attendance == "present") {
  updated$presence <- 1}

presences <- aggregate(updated$Attendance, by=list(student=updated$Student.Name), FUN=sum)    #sum capacity (bed count) by county age 


