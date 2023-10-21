

setwd("C:\\Users\\Keter\\OneDrive - ITG\\EDCTP\\PhD\\lca\\Vukuzazi\\revised analysis\\vb_sim_analysis\\CC_NN\\Results_CC_NN")


rm(list = ls())


require("R2jags")
require("runjags")
require(coda)




#LCA


cc1 = readRDS("vb.sim1.CC.res1_25.RData")
cc2 = readRDS("vb.sim1.CC.res26_50.RData")
cc3 = readRDS("vb.sim1.CC.res51_75.RData")
cc4 = readRDS("vb.sim1.CC.res76_100.RData")





print(cc1[1], intervals = c(0.5, 0.025, 0.975))
print(cc2[1], intervals = c(0.5, 0.025, 0.975))
print(cc3[1], intervals = c(0.5, 0.025, 0.975))
print(cc4[1], intervals = c(0.5, 0.025, 0.975))



cc = c(cc1, cc2, cc3, cc4)
cc.l = sapply(cc,coda::as.mcmc)

cc.r=combine.MCMC(
  mcmc.objects = cc.l
)

cc.s = summary(cc.r)
round( cc.s$quantiles[,c(3,1,5)],3)










#LCA




naive1 = readRDS("vb.sim1.NN.res1_25.RData")
naive2 = readRDS("vb.sim1.NN.res26_50.RData")
naive3 = readRDS("vb.sim1.NN.res51_75.RData")
naive4 = readRDS("vb.sim1.NN.res76_100.RData")





print(naive1[1], intervals = c(0.5, 0.025, 0.975))
print(naive2[1], intervals = c(0.5, 0.025, 0.975))
print(naive3[1], intervals = c(0.5, 0.025, 0.975))
print(naive4[1], intervals = c(0.5, 0.025, 0.975))



naive = c(naive1, naive2, naive3, naive4)
naive.l = sapply(naive,coda::as.mcmc)

naive.r=combine.MCMC(
  mcmc.objects = naive.l
)

naive.s = summary(naive.r)

round( naive.s$quantiles[,c(3,1,5)],3)














