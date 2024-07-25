**Assign each data to variables**

- activities (6 rows, 2 columns): list of activities performed when the corresponding measurements were taken and its codes (labels)
- subject_test (2947 rows, 1 column): contains test data of 9/30 volunteer test subjects being observed
- x_test (2947 rows, 561 columns): contains recorded features test data
- y_test (2947 rows, 1 columns): contains test data of activities’code labels
- subject_train (7352 rows, 1 column): contains train data of 21/30 volunteer subjects being observed
- x_train (7352 rows, 561 columns): contains recorded features train data
- y_train (7352 rows, 1 columns): contains train data of activities’code labels
- X (10299 rows, 561 columns): merging x_train and x_test using rbind() func.
- y (10299 rows, 1 column): merging y_train and y_test using rbind() func.
- sub (10299 rows, 1 column): merging subject_train and subject_test using rbind() func.
- df (10299 rows, 563 columns): merging sub, X, y using cbind() func.
- df_mean_std (10299 rows, 88 coluns): subset df, selecting columns: subject, code, all mean and std measurements.
- res_df (180 rows, 88 columns): summarizing df_mean_std taking of each variable for each activity and subject.
