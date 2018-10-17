%% Assessment of 50 x 7 matrix at different K-means values 
% (n=2,3,4,5, or 6), calculation of silhouette coefficient per n value,
% mean of silhouette value per cluster, silhouette plot(s), etc.

%% Open and clean up the file
data = readtable('dataset3.csv'); % read in the data file
arr = table2array(data); % convert table to an array (matlab functional)
Y = table2array(data(:,5:11)); % 50 x 7 matrix
%Y( ~any(Y,2), : ) = [];  % remove rows with zeroes
%Y( :, ~any(Y,1) ) = [];  % remove columns with zeroes
%Y(any(Y==0,2),:) = []; % remove rows with at least 1 zero, reduces matrix by 4 more samples
size(Y)

X = table2array(data(:,5:6)); % collect column 5 and 6 information
%X( ~any(X,2), : ) = [];  % remove rows with zeroes
%X( :, ~any(X,1) ) = [];  % remove columns with zeroes
size(X) % Get the dimensions of the data file
%% Visualize the sbp vs. dbp graph
figure; % code alone opens up a blank picture file
plot(X(:,1),X(:,2),'k*','MarkerSize',5); % plot the data points with w/ X(:,1) and X(:,2) as X and Y, respectively. Points are black stars (k*) 
title 'SBP vs. DBP';
xlabel 'SBP unit'; 
ylabel 'DBP unit'; 

%% Figure out how many clusters is best to group the whole dataset (7 features)
% Refer to: https://www.mathworks.com/help/stats/k-means-clustering.html#brah7f1-1

% Try running kmeans() @ diff. K values
idx2 = kmeans(Y,2,'Distance','cityblock'); % k=2
idx3 = kmeans(Y,3,'Distance','cityblock'); % k=3
idx4 = kmeans(Y,4,'Distance','cityblock'); % k=4
idx5 = kmeans(Y,5,'Distance','cityblock'); % k=5
idx6 = kmeans(Y,6,'Distance','cityblock'); % k=6

% Plots for each K value inputted into Kmeans() Open up individually
%figure; % BEST
%[silh2,h] = silhouette(Y,idx2,'cityblock');
%h = gca;
%h.Children.EdgeColor = [.8 .8 1];
%xlabel 'Silhouette Value'
%ylabel 'Cluster'

%figure
%[silh3,h] = silhouette(Y,idx3,'cityblock');
%h = gca;
%h.Children.EdgeColor = [.8 .8 1];
%xlabel 'Silhouette Value'
%ylabel 'Cluster'

%figure % some samples have low (<.6 silhouette)
%[silh4,h] = silhouette(Y,idx4,'cityblock');
%h = gca;
%h.Children.EdgeColor = [.8 .8 1];
%xlabel 'Silhouette Value'
%ylabel 'Cluster'

%figure ; % Shows some samples are incorrectly clustered or have silhouette (<0.6)
%[silh5,h] = silhouette(Y,idx5,'cityblock');
%h = gca;
%h.Children.EdgeColor = [.8 .8 1];
%xlabel 'Silhouette Value'
%ylabel 'Cluster'

%figure; % similar to above 
%[silh6,h] = silhouette(Y,idx6,'cityblock');
%h = gca;
%h.Children.EdgeColor = [.8 .8 1];
%xlabel 'Silhouette Value'
%ylabel 'Cluster'

%% Make the plots into one or 2 figures 
figure(1);
subplot(3,1,1)
[silh2,h] = silhouette(Y,idx2,'cityblock'); % k=2
h = gca;
h.Children.EdgeColor = [.8 .8 1];
subplot(3,1,2)
[silh3,h] = silhouette(Y,idx3,'cityblock'); % k=3
h = gca;
h.Children.EdgeColor = [.8 .8 1];
subplot(3,1,3)
[silh4,h] = silhouette(Y,idx4,'cityblock'); % k=4
h = gca;
h.Children.EdgeColor = [.8 .8 1];
% try and add more plots to the stack
figure(2)
subplot(4,1,1)
[silh5,h] = silhouette(Y,idx5,'cityblock'); % k=5
h = gca;
h.Children.EdgeColor = [.8 .8 1];
subplot(4,1,2)
[silh6,h] = silhouette(Y,idx6,'cityblock'); % k=6
h = gca;
h.Children.EdgeColor = [.8 .8 1];
%% Determine the Correct Number of Clusters 
% start at K=2 since k=2 seems best
idx2 = kmeans(Y,2, 'Distance','cityblock','Display','iter');
% Go to K=3 since to show its not good idea
idx3 = kmeans(Y,3, 'Distance','cityblock','Display','iter');
% Go to K=4 since to show its not good idea
idx4 = kmeans(Y,4, 'Distance','cityblock','Display','iter');


% Data Visualize
figure(1);
subplot(3,1,1) % Figure for when k=2
[silh2,h] = silhouette(Y,idx2,'cityblock');
h = gca;
h.Children.EdgeColor = [.8 .8 1];
xlabel 'Silhouette Value'
ylabel 'Cluster'
title 'Complete Dataset @ K=2'

subplot(3,1,2)% figure for when k=3
[silh3,h] = silhouette(Y,idx3,'cityblock');
h = gca;
h.Children.EdgeColor = [.8 .8 1];
xlabel 'Silhouette Value'
ylabel 'Cluster'
title 'Complete Dataset @ K=3'

subplot(3,1,3)% figure for when k=4
[silh4,h] = silhouette(Y,idx4,'cityblock');
h = gca;
h.Children.EdgeColor = [.8 .8 1];
xlabel 'Silhouette Value'
ylabel 'Cluster'
title 'Complete Dataset @ K=4'

% Get quantitative! Calculate mean of silhouette values of calculated 
clusters2 = mean(silh2)
clusters3 = mean(silh3)
clusters4 = mean(silh4)
clusters5 = mean(silh5)
clusters6 = mean(silh6)

% Sort the mean silhouette coefficient for each cluster 
to_sort=[clusters2 clusters3 clusters4 clusters5 clusters6]
[sd,r]=sort(to_sort,'descend')
sd % sorted data cluster (tells you what index in to_sort has rank of 1,2,3,4,5, or 6
r % the corresponding indices ranked 1 to 5


% Perform iterations of kmeans() @ k=2, 3, or 4
% Notice, total sum of distances goes down as k increases WHY
[idx2,cent2,sumdist] = kmeans(Y,2,'Distance','cityblock','Display','final','Replicates',10); % k=2
[idx3,cent3,sumdist] = kmeans(Y,3,'Distance','cityblock','Display','final','Replicates',10); % k=3
[idx4,cent4,sumdist] = kmeans(Y,4,'Distance','cityblock','Display','final','Replicates',10); % k=4

%% Alternate method for k-means clustering en masse
% refer to: https://www.mathworks.com/help/stats/kmeans.html
% Assume it's best to cluster two variables at a time as oppose to the whole dataset

%%
