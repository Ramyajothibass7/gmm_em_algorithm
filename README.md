Gaussian Mixture Model using Expectation-Maximization (EM) Algorithm
Project Objective
The objective of this project is to implement the Gaussian Mixture Model (GMM) using the Expectation-Maximization (EM) Algorithm from scratch in Base R. The project demonstrates how GMM performs probabilistic clustering by assigning each observation a probability of belonging to each cluster. The implementation is completed without using any external machine learning or clustering libraries.
________________________________________
Software Used
•	R
•	Base R
•	R GUI / RStudio
•	Git
•	GitHub
________________________________________
Dataset
A synthetic dataset containing 20,000 observations was generated using Base R.
Features:
•	X1
•	X2
The dataset contains two Gaussian clusters and is saved as:
synthetic_data.csv
________________________________________
Steps to Run the Program
1.	Open gmm_em_algorithm.R in R GUI or RStudio.
2.	Run the complete program.
3.	The synthetic dataset is generated and saved as synthetic_data.csv.
4.	The EM Algorithm initializes the model parameters.
5.	The Gaussian Density Function is calculated.
6.	The Expectation (E-Step) computes the responsibility matrix.
7.	The Maximization (M-Step) updates the model parameters.
8.	The algorithm repeats until convergence or 20 iterations.
9.	The following output plots are generated inside the Output folder:
o	dataset.png
o	final_clusters.png
o	log_likelihood.png
________________________________________
Project Folder Structure
GMM-EM-Algorithm-Week1/
│
├── README.md
├── gmm_em_algorithm.R
├── synthetic_data.csv
├── Week1_Report.pdf
│
└── Output/
    ├── dataset.png
    ├── final_clusters.png
    └── log_likelihood.png
________________________________________
Output Screenshots
1.	Synthetic Dataset
•	Scatter plot of the generated Gaussian clusters.
<img width="726" height="720" alt="Screenshot 2026-07-20 083925" src="https://github.com/user-attachments/assets/858b8b28-7327-4d46-a247-f4ad4f2961a2" />

 
3. Final Cluster Assignment
•	Scatter plot showing the clusters identified by the EM Algorithm.

<img width="718" height="721" alt="Screenshot 2026-07-20 083910" src="https://github.com/user-attachments/assets/4a394f21-bcdc-4316-a319-951b5b9f53ca" />

 

5. Log-Likelihood Plot
•	Graph showing the Log-Likelihood value for each iteration until convergence.

<img width="720" height="716" alt="Screenshot 2026-07-20 083940" src="https://github.com/user-attachments/assets/44e3e872-bc3d-45c9-b94c-888413cc4195" />

 
________________________________________
Learning Outcomes
After completing this project, I learned to:
•	Understand the concept of unsupervised learning.
•	Differentiate between K-Means and Gaussian Mixture Models.
•	Generate a synthetic dataset using Base R.
•	Implement the Multivariate Gaussian Probability Density Function.
•	Perform the Expectation (E-Step).
•	Perform the Maximization (M-Step).
•	Update mixing coefficients, mean vectors, and covariance matrices.
•	Compute Log-Likelihood values.
•	Check the convergence of the EM Algorithm.
•	Visualize clustering results using Base R.
•	Upload the completed project to GitHub.
________________________________________
Author
Student Name: Ramya J
Course: BCA
Project: Week 1 – Gaussian Mixture Model using EM Algorithm
Language: R (Base R)

