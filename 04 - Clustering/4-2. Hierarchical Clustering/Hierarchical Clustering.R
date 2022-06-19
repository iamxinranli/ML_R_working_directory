#Hierarchical Clustering

#Importing the mall dataset
dataset = read.csv('Mall_Customers.csv')
x = dataset[4:5]

# Using the dendrogram to find the optimal number of clusters
dendrogramm = hclust(dist(x, method = 'euclidean'), method = 'ward.D')
plot(dendrogramm,
     main = paste('Dendrogramm'),
     xlab = 'Customers',
     ylab = 'Euclidean distance')

#Fitting hierarchical clustering to the mall dataset
hc= hclust(dist(x, method = 'euclidean'), method = 'ward.D')
y_hc = cutree(hc, 5)

#Visualising the clusters
library(cluster)
clusplot(x, 
         y_hc,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of clients'),
         xlab = 'Annual Income',
         ylab = 'spending Score')
