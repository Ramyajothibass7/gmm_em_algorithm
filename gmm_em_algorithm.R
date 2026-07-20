# Generate Synthetic Dataset

set.seed(123)

# Number of observations
n <- 20000

# Cluster 1 (10,000 points)
x1 <- rnorm(n/2, mean = 3, sd = 1)
y1 <- rnorm(n/2, mean = 4, sd = 1)

# Cluster 2 (10,000 points)
x2 <- rnorm(n/2, mean = 8, sd = 1)
y2 <- rnorm(n/2, mean = 9, sd = 1)

# Combine the clusters
X1 <- c(x1, x2)
X2 <- c(y1, y2)

# Create dataset
data <- data.frame(X1, X2)

# Save as CSV
write.csv(data, "synthetic_data.csv", row.names = FALSE)

# Display first 6 rows
head(data)

# Display total observations
nrow(data)

# Scatter Plot
plot(data$X1, data$X2,
     col = "blue",
     pch = 16,
     cex = 0.5,
     main = "Synthetic Dataset",
     xlab = "X1",
     ylab = "X2")

K <- 2

n <- nrow(data)

d <- ncol(data)

pi_k <- c(0.5,0.5)

means <- matrix(c(1,2,
                  9,10),
                nrow=K,
                byrow=TRUE)

cov1 <- diag(2)

cov2 <- diag(2)

covariances <- list(cov1,cov2)

print(pi_k)

print(means)

print(covariances)


gaussian_pdf <- function(x,mean,cov){

det_cov <- det(cov)

inv_cov <- solve(cov)

diff <- as.matrix(x)-matrix(mean,nrow=nrow(x),ncol=2,byrow=TRUE)

expo <- rowSums((diff%*%inv_cov)*diff)

density <- exp(-0.5*expo)/sqrt((2*pi)^2*det_cov)

return(density)

}


prob1 <- gaussian_pdf(data,
                      means[1,],
                      covariances[[1]])

prob2 <- gaussian_pdf(data,
                      means[2,],
                      covariances[[2]])


gamma1 <- pi_k[1]*prob1

gamma2 <- pi_k[2]*prob2

sum_gamma <- gamma1+gamma2

gamma1 <- gamma1/sum_gamma

gamma2 <- gamma2/sum_gamma

responsibility <- cbind(gamma1,gamma2)

head(responsibility)


head(rowSums(responsibility))

Nk <- colSums(responsibility)

pi_k <- Nk/n

print(pi_k)

mean1 <- colSums(data*gamma1)/Nk[1]

mean2 <- colSums(data*gamma2)/Nk[2]

means <- rbind(mean1,mean2)

print(means)

cov_update <- function(x,mean,gamma){

diff <- as.matrix(x)-matrix(mean,nrow=nrow(x),2,byrow=TRUE)

cov <- t(diff)%*%(diff*gamma)/sum(gamma)

return(cov)

}

covariances[[1]] <- cov_update(data,means[1,],gamma1)

covariances[[2]] <- cov_update(data,means[2,],gamma2)

print(covariances)

prob1 <- gaussian_pdf(data,
                      means[1,],
                      covariances[[1]])

prob2 <- gaussian_pdf(data,
                      means[2,],
                      covariances[[2]])

logLik <- sum(log(pi_k[1]*prob1+
                  pi_k[2]*prob2))

print(logLik)

log_history <- c()

for(iter in 1:20){

prob1 <- gaussian_pdf(data,
                      means[1,],
                      covariances[[1]])

prob2 <- gaussian_pdf(data,
                      means[2,],
                      covariances[[2]])

gamma1 <- pi_k[1]*prob1

gamma2 <- pi_k[2]*prob2

sum_gamma <- gamma1+gamma2

gamma1 <- gamma1/sum_gamma

gamma2 <- gamma2/sum_gamma

responsibility <- cbind(gamma1,gamma2)

Nk <- colSums(responsibility)

pi_k <- Nk/n

means[1,] <- colSums(data*gamma1)/Nk[1]

means[2,] <- colSums(data*gamma2)/Nk[2]

covariances[[1]] <- cov_update(data,
                               means[1,],
                               gamma1)

covariances[[2]] <- cov_update(data,
                               means[2,],
                               gamma2)

prob1 <- gaussian_pdf(data,
                      means[1,],
                      covariances[[1]])

prob2 <- gaussian_pdf(data,
                      means[2,],
                      covariances[[2]])

ll <- sum(log(pi_k[1]*prob1+
              pi_k[2]*prob2))

log_history <- c(log_history,ll)

cat("Iteration:",iter,
    " LogLik:",ll,"\n")

}

cluster <- apply(responsibility,1,which.max)

table(cluster)

png("Output/final_clusters.png")

plot(data$X1,
     data$X2,
     col=cluster,
     pch=19,
     cex=0.3,
     main="Final Clusters")

dev.off()

png("Output/log_likelihood.png")

plot(log_history,
     type="b",
     pch=19,
     col="red",
     xlab="Iteration",
     ylab="Log Likelihood",
     main="EM Convergence")

dev.off()

write.csv(data, "synthetic_data.csv", row.names = FALSE)