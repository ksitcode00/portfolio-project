# Synthetic public data generator for the Heat Wave / NCD portfolio project.
# This file does not use or recreate participant-level study records.

set.seed(20260614)

out_dir <- "data"
if (!dir.exists(out_dir)) {
  dir.create(out_dir, recursive = TRUE)
}

n_participants <- 660
ids <- sprintf("SYN%04d", seq_len(n_participants))

participant <- data.frame(
  ID = ids,
  age_group = sample(c("18-59", "60+"), n_participants, replace = TRUE,
                     prob = c(0.81, 0.19)),
  gender = sample(c("Female", "Male"), n_participants, replace = TRUE,
                  prob = c(0.66, 0.34)),
  family_size_group = sample(c("1-2", "3-5", "6-8", "9+"), n_participants,
                             replace = TRUE, prob = c(0.22, 0.38, 0.29, 0.11)),
  monthly_income_group = sample(c("less than 100 JD", "100 - 200 JD",
                                  "200 JD or more"), n_participants,
                                replace = TRUE, prob = c(0.54, 0.38, 0.08)),
  household_area_group = sample(c("less than 60", "60 or more"), n_participants,
                                replace = TRUE, prob = c(0.63, 0.37)),
  HTN_prior = rbinom(n_participants, 1, 0.20),
  Asthma_prior = rbinom(n_participants, 1, 0.10),
  Thyroid_prior = rbinom(n_participants, 1, 0.15),
  CVDs_prior = rbinom(n_participants, 1, 0.06),
  participant_risk = rnorm(n_participants, mean = 0, sd = 0.55)
)

phases <- data.frame(
  phase = factor(c("T1", "T2", "T3"), levels = c("T1", "T2", "T3")),
  phase_num = 0:2,
  heatwave_max_c = c(43, 37, 35),
  event_window = c("June to July 2024", "July to August 2024",
                   "August to September 2024")
)

panel <- merge(participant, phases, by = NULL)
panel <- panel[order(panel$ID, panel$phase), ]

logit <- function(x) 1 / (1 + exp(-x))

phase_effect_heat <- c(T1 = 0.00, T2 = -0.75, T3 = -0.88)
phase_effect_dust <- c(T1 = 0.00, T2 = -0.55, T3 = -0.64)

panel$heatwave_prob <- logit(
  0.35 +
    phase_effect_heat[as.character(panel$phase)] +
    0.42 * panel$Asthma_prior +
    0.26 * panel$HTN_prior +
    0.20 * panel$CVDs_prior +
    0.18 * (panel$gender == "Female") +
    0.13 * (panel$family_size_group %in% c("6-8", "9+")) +
    panel$participant_risk
)

panel$duststorm_prob <- logit(
  0.20 +
    phase_effect_dust[as.character(panel$phase)] +
    0.58 * panel$Asthma_prior +
    0.22 * (panel$gender == "Female") +
    0.12 * (panel$monthly_income_group == "200 JD or more") +
    0.65 * panel$participant_risk
)

panel$heatwave_affected <- rbinom(nrow(panel), 1, panel$heatwave_prob)
panel$duststorm_affected <- rbinom(nrow(panel), 1, panel$duststorm_prob)

panel$dyspnea <- rbinom(
  nrow(panel), 1,
  logit(-1.15 + 0.95 * panel$heatwave_affected + 0.78 * panel$duststorm_affected +
          0.72 * panel$Asthma_prior)
)
panel$fatigue <- rbinom(
  nrow(panel), 1,
  logit(-1.05 + 1.00 * panel$heatwave_affected +
          0.25 * (panel$family_size_group %in% c("6-8", "9+")))
)
panel$headache <- rbinom(nrow(panel), 1, logit(-1.55 + 0.65 * panel$heatwave_affected))
panel$sweating <- rbinom(nrow(panel), 1, logit(-1.75 + 0.85 * panel$heatwave_affected))
panel$allergy <- rbinom(
  nrow(panel), 1,
  logit(-1.30 + 0.90 * panel$duststorm_affected + 0.40 * panel$Asthma_prior)
)
panel$hypertension_symptom <- rbinom(
  nrow(panel), 1,
  logit(-1.80 + 0.65 * panel$heatwave_affected + 0.60 * panel$HTN_prior)
)

severity_signal <- panel$dyspnea + panel$fatigue + panel$headache +
  panel$sweating + panel$allergy + panel$hypertension_symptom
panel$symptom_severity_score <- pmin(3, severity_signal)

make_symptom_text <- function(i) {
  symptoms <- c(
    if (panel$dyspnea[i] == 1) "dyspnea",
    if (panel$fatigue[i] == 1) "fatigue",
    if (panel$headache[i] == 1) "headache",
    if (panel$sweating[i] == 1) "sweating",
    if (panel$allergy[i] == 1) "allergy",
    if (panel$hypertension_symptom[i] == 1) "hypertension"
  )
  if (length(symptoms) == 0) {
    return("")
  }
  paste(symptoms, collapse = ", ")
}

panel$symptom_text <- vapply(seq_len(nrow(panel)), make_symptom_text, character(1))

public_cols <- c(
  "ID", "phase", "phase_num", "event_window", "heatwave_max_c",
  "age_group", "gender", "family_size_group", "monthly_income_group",
  "household_area_group", "HTN_prior", "Asthma_prior", "Thyroid_prior",
  "CVDs_prior", "heatwave_affected", "duststorm_affected",
  "dyspnea", "fatigue", "headache", "sweating", "allergy",
  "hypertension_symptom", "symptom_severity_score", "symptom_text"
)

write.csv(panel[public_cols],
          file = file.path(out_dir, "synthetic_ncd_heatwave_panel.csv"),
          row.names = FALSE)

message("Wrote data/synthetic_ncd_heatwave_panel.csv")
