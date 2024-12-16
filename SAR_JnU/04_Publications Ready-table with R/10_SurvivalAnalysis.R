# Ref: https://www.danieldsjoberg.com/gtsummary/reference/tbl_survfit.html?q=surviva#null
library(gtsummary)
library(gt)
library(survival)

# Pass single survfit() object
tbl_survfit(
  survfit(Surv(ttdeath, death) ~ trt, trial),
  times = c(12, 24),
  label_header = "**{time} Month**"
)

# Pass a data frame
tbl_survfit(
  trial,
  y = "Surv(ttdeath, death)",
  include = c(trt, grade),
  probs = 0.5,
  label_header = "**Median Survival**"
)

# Pass a list of survfit() objects
list(survfit(Surv(ttdeath, death) ~ 1, trial),
     survfit(Surv(ttdeath, death) ~ trt, trial)) |>
  tbl_survfit(times = c(12, 24))

# Adding a competing event for death (cancer vs other causes)
set.seed(1123)
library(dplyr, warn.conflicts = FALSE, quietly = TRUE)
trial2 <- trial |>
  dplyr::mutate(
    death_cr =
      dplyr::case_when(
        death == 0 ~ "censor",
        runif(n()) < 0.5 ~ "death from cancer",
        TRUE ~ "death other causes"
      ) |>
      factor()
  )

survfit(Surv(ttdeath, death_cr) ~ grade, data = trial2) |>
  tbl_survfit(times = c(12, 24), label = "Tumor Grade")



