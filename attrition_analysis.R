install.packages("readr")
library(readr)
attrition <- read_csv("attrition_original.csv")
View(attrition_original)

#separating the data set only with people who left

#instaling the tidyverse package to use pipe operator and the filter function to filter data with attrition yes
install.packages("tidyverse")
library(tidyverse)

attrition_yes <- attrition %>% filter(Attrition == "Yes")
View(attrition_yes)



#visualization for attrition vs env satisfaction
hist(attrition_yes$EnvironmentSatisfaction)

library(ggplot2)
attrition_original %>% ggplot(data, aes(fill= Attrition, y= " ", x= EnvironmentSatisfaction)) + 
  geom_bar(position="stack", stat="identity")
ggplot(df, aes(x=attrition_original$EnvironmentSatisfaction)) + geom_histogram(color="coral", fill="lightblue")
geom_label(aes(label = labels),
           position = position_stack(vjust = 0.5),
           show.legend = TRUE) +
  coord_polar(theta = "y")

#visualization for attrition vs Age
hist(attrition_yes$Age)

#visualization for attrition vs DistanceFromHome
hist(attrition_yes$DistanceFromHome)

#visualization for attrition vs JobLevel
hist(attrition_yes$JobLevel)

#visualization for attrition vs job satisfaction
hist(attrition_yes$JobSatisfaction)


#visualization for attrition vs worklifebalance
hist(attrition_yes$WorkLifeBalance)

#visualization for attrition vs performance rating
hist(attrition_yes$PerformanceRating)

#visualization for attrition vs department

ggplot(attrition_yes, aes(x = attrition_yes$Department)) +
       geom_bar(fill = "coral") +
       theme_classic()

ggplot(attrition_original, aes(x=weight)) + geom_histogram()


#visualization for attrition vs gender
ggplot(attrition_yes, aes(x = attrition_yes$Gender)) +
       geom_bar(fill = "coral") +
       theme_classic()

ggplot(attrition_yes, aes(x = attrition_yes$EnvironmentSatisfaction)) +
  geom_bar(fill = "coral") +
  theme_classic()

#we see that the department with most amount of attrition is R&D.
#filtering R&d and checking which job roles have the highest attrition

attrition %>% filter(Department == "Research & Development") %>% count(JobRole)


#percentage of attrition in "Sales Rep" job role
a_sales %>% mutate(percentage = as.integer(JobRole == "Sales Representative") ) %>% summarise(percent = mean(percentage))

#pie chart for attrition data

attrition %>% count(Attrition)
att_var <- factor(c(rep("Yes", 156), rep("No", 431)))
att_table <- table(att_var)
pie(att_table)

attrition_rate <- attrition_original %>% 
  group_by(Attrition) %>% # Variable to be transformed
  count() %>% 
  ungroup() %>% 
  mutate(perc = `n` / sum(`n`)) %>% 
  arrange(perc) %>%
  mutate(labels = scales::percent(perc))

View(attrition_rate)

ggplot(attrition_rate, aes(x = "", y = perc, fill = Attrition)) +
  geom_col() +
  geom_label(aes(label = labels),
             position = position_stack(vjust = 0.5),
             show.legend = FALSE) +
  coord_polar(theta = "y")

df <- data.frame(x = attrition_original$EnvironmentSatisfaction, y = attrition_original$Gender, group = attrition_original$Attrition)

ggplot(df, aes(x = attrition_original$EnvironmentSatisfaction, y = attrition_original$Gender, fill = group)) + 
  geom_bar(stat = "identity")

attrition_yes %>% select(Gender, JobRole, Department) %>%
  group_by(Gender, JobRole, Department) %>%
  summarise(Count = n(), .groups = "drop") %>%
  ungroup() %>%
  arrange(desc(Count)) %>%
  ggplot(aes(x= Gender, y = Count, fill = Department)) +
  geom_col() +
  theme_light() +
  facet_wrap(~ Department, scales = "free") +
  theme(strip.background = element_rect(fill = "darkblue")) +
  theme(strip.text = element_text(colour = "white", face = "bold")) +
  theme(legend.position = "none") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#examining the number of employees who clocked extra hours 
attrition_yes %>% 
  group_by(OverTime) %>% # Variable to be transformed
  count() %>% 
  ungroup() %>% 
  mutate(perc = `n` / sum(`n`)) %>% 
  arrange(perc) %>%
  mutate(labels = scales::percent(perc)) %>%
  ggplot(aes(x = OverTime, y = perc, fill = OverTime)) +
  geom_col()

#density plot to show how attrition reduces with tenure
ggplot(attrition_yes, aes(x=TotalWorkingYears, col=Attrition)) + geom_density()

We can see from the density plot that as work experience increases people think less about leaving the company.

#installing ggcorrplot package
install.packages("ggcorrplot")
library(ggcorrplot)
library(ggplot2)
#creating a correlation matrix of all numeric variables
df <- attrition[, c("Age", "DistanceFromHome", "EnvironmentSatisfaction", "PerformanceRating", "TotalWorkingYears", "JobLevel", "JobSatisfaction", "MonthlyIncome", "PercentSalaryHike", "WorkLifeBalance", "YearsAtCompany", "YearsSinceLastPromotion", "YearsWithCurrManager")]
correlation_matrix <- cor(df) 
View(correlation_matrix)

#grouping employees by department, number of years at the company and with current manager
attrition_yes %>% select(Department, YearsWithCurrManager, YearsAtCompany) %>%
  group_by(Department, YearsWithCurrManager, YearsAtCompany) %>%
  summarise(Count = n(), .groups = "drop") %>%
  arrange(desc(Count))

#we can see a positive correlation between the two variables
attrition_yes %>% select(YearsWithCurrManager, YearsAtCompany) %>%
  group_by(YearsWithCurrManager, YearsAtCompany) %>%
  summarise(Count = n(), .groups = "drop") %>%
  arrange(desc(Count)) %>%
  ggplot(aes(x= YearsWithCurrManager, y= YearsAtCompany)) + geom_point() + 
  geom_smooth(span = 1)

#visualizing the relationship for each department
attrition_yes %>% select(Department, YearsWithCurrManager, YearsAtCompany) %>%
  group_by(Department, YearsWithCurrManager, YearsAtCompany) %>%
  summarise(Count = n(), .groups = "drop") %>%
  arrange(desc(Count)) %>%
  ggplot(aes(x= YearsWithCurrManager, y= YearsAtCompany , color= Department)) + geom_point() + facet_grid(~ Department) + 
  geom_smooth(span = 1)

ggplot(attrition, aes(x=PercentSalaryHike, y=PerformanceRating, color = Attrition)) + geom_smooth(span = 0.5)
#plotting a point plot between total working years and monthly income and grouping it with Job level
ggplot(attrition, aes(x= TotalWorkingYears, y=MonthlyIncome, color = JobLevel)) + geom_point()

#Visualizing distribution of monthly income throughout Job levels
ggplot(attrition, aes(x=MonthlyIncome, y=JobLevel, color = Attrition)) + 
  geom_smooth()

