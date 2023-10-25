library(survival)
library(timeROC)
library(readxl)

setwd()
dat <- read_excel("R_Radiopop_230128.xlsx")

#Cox regressions - LRE univariable
summary(coxph(Surv(dat$`LRE duration (months) from CT`,dat$`LRE FU yes (1) no (0)`) ~ dat$`age at CT`))
summary(coxph(Surv(dat$`LRE duration (months) from CT`,dat$`LRE FU yes (1) no (0)`) ~ dat$`BL-MELD_UNOS_2016`))
summary(coxph(Surv(dat$`LRE duration (months) from CT`,dat$`LRE FU yes (1) no (0)`) ~ dat$`Decompensated_0=BAVENO1_012;1=BAVENO1_345`))
summary(coxph(Surv(dat$`LRE duration (months) from CT`,dat$`LRE FU yes (1) no (0)`) ~ dat$`Alb`))
summary(coxph(Surv(dat$`LRE duration (months) from CT`,dat$`LRE FU yes (1) no (0)`) ~ dat$`CRP`))
summary(coxph(Surv(dat$`LRE duration (months) from CT`,dat$`LRE FU yes (1) no (0)`) ~ dat$`HVPG_grps`))
summary(coxph(Surv(dat$`LRE duration (months) from CT`,dat$`LRE FU yes (1) no (0)`) ~ dat$`RADIOPOP_bin`))

#multivariable MELD
MELD_actual <- coxph(Surv(dat$`LRE duration (months) from CT`,dat$`LRE FU yes (1) no (0)`) ~ dat$`BL-MELD_UNOS_2016` + dat$`Decompensated_0=BAVENO1_012;1=BAVENO1_345` + dat$`Alb` + dat$`CRP` + dat$`HVPG_grps`)
summary(MELD_actual)
-2*MELD_actual$loglik + 2*length(MELD_actual$coef)

MELD_pred <- coxph(Surv(dat$`LRE duration (months) from CT`,dat$`LRE FU yes (1) no (0)`) ~ dat$`BL-MELD_UNOS_2016` + dat$`Decompensated_0=BAVENO1_012;1=BAVENO1_345` + dat$`Alb` + dat$`CRP` + dat$`RADIOPOP_bin`)
summary(MELD_pred)
-2*MELD_pred$loglik + 2*length(MELD_pred$coef)

# AUROCs LRE
AUROC_actualHVPGstrata <- timeROC(dat$`LRE duration (months) from CT`,dat$`LRE FU yes (1) no (0)`,dat$HVPG_grps,
                            other_markers=as.matrix(dat[,c("BL-MELD_UNOS_2016","Decompensated_0=BAVENO1_012;1=BAVENO1_345","Alb","CRP")]), 
                            cause=1, weighting="cox",times=c(12,24,36,48,60),ROC=TRUE,iid=FALSE)
AUROC_actualHVPGstrata

AUROC_predHVPGstrata <- timeROC(dat$`LRE duration (months) from CT`,dat$`LRE FU yes (1) no (0)`,dat$RADIOPOP_bin,
                                  other_markers=as.matrix(dat[,c("BL-MELD_UNOS_2016","Decompensated_0=BAVENO1_012;1=BAVENO1_345","Alb","CRP")]), 
                                  cause=1, weighting="cox",times=c(12,24,36,48,60),ROC=TRUE,iid=FALSE)
AUROC_predHVPGstrata
