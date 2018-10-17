%% Testing the k-means algorithm on 50 x 7 dataset

%% Tidy the file and create your subsets
data = readtable('dataset3.csv'); % read the file
Y = table2array(data(:,5:12)); % 50 x 8 (all needed)
Z = table2array(data(:,12)); % 50 x 1 (egfr only)

%% Create the new column with 0s and 1s
new_col = [] % empty matrix
for v = 1:length(Z) % Loops through each letter in the sequence
    if (Z(v) < 15 | Z(v) == 15); % if value at row # is either value...
        new_col(v) = 1 % assign it a 1
    else
        new_col(v) = 0 % otherwise, a 0
    end
end
new_col = new_col.' % change the matrix orientation,make it vertical
P = [Y,new_col] % add the new column to the subset dataset COMPLETE 

% Make your labels
labs = reshape(P(:,end),[1,50]) % make the array 1 row with 50 inputs
labs = num2cell(labs) % convert to an array for using as labels later



%% Determine the Correct Number of Clusters for the larger dataset
% start at K=2 since k=2 seems best
idx2 = kmeans(Y,2, 'Distance','cityblock','Display','iter');
% Go to K=3 since to show its not good idea
idx3 = kmeans(Y,3, 'Distance','cityblock','Display','iter');
% Go to K=4 since to show its not good idea
idx4 = kmeans(Y,4, 'Distance','cityblock','Display','iter');

% Outputs sihouette plots (not relevant here)
figure(1);
subplot(3,1,1)
silhouette(Y,idx2,'cityblock'); % k=2
title 'Whole Dataset @ k=2'
subplot(3,1,2)
silhouette(Y,idx3,'cityblock'); % k=3
title 'Whole Dataset @ k=3'
subplot(3,1,3)
silhouette(Y,idx4,'cityblock'); % k=4
title 'Whole Dataset @ k=4'

% Get quantitative! Calculate mean of silhouette values of calculated 
%clusters2 = mean(silh2)
%clusters3 = mean(silh3)
%clusters4 = mean(silh4)

% Sort the mean silhouette coefficient for each cluster 
%to_sort=[clusters2 clusters3 clusters4]
%[sd,r]=sort(to_sort,'descend')
%sd % sorted data cluster (tells you what index in to_sort has rank of 1,2,3,4,5, or 6
%r % the corresponding indices ranked 1 to 5



% Perform iterations of kmeans() @ k=2, 3, or 4
% Notice, total sum of distances goes down as k increases WHY
[idx2,cent2,sumdist] = kmeans(Y,2,'Distance','cityblock','Display','final','Replicates',10); % k=2
[idx3,cent3,sumdist] = kmeans(Y,3,'Distance','cityblock','Display','final','Replicates',10); % k=3
[idx4,cent4,sumdist] = kmeans(Y,4,'Distance','cityblock','Display','final','Replicates',10); % k=4

% Data Visualization @ K=2 w/ input ones and zeroes
figure(2);
subplot(3,1,1) % Data visualization for k=2

opts = statset('Display','final');
[idx2,C] = kmeans(Y,2,'Distance','cityblock','Replicates',5,'Options',opts);

plot(Y(idx2==1,1),Y(idx2==1,2),'r.','MarkerSize',12);
hold on;
plot(Y(idx2==2,1),Y(idx2==2,2),'b.','MarkerSize',12);
%hold on;
%plot(X(idx5==3,1),X(idx5==3,2),'g.','MarkerSize',12);
%hold on;
%plot(X(idx5==4,1),X(idx5==4,2),'c.','MarkerSize',12);
%hold on;
%plot(X(idx5==5,1),X(idx5==5,2),'m.','MarkerSize',12);
legend('Cluster 1', 'Cluster 2','Location','NW');
title('Whole Data Cluster assigment and centroids');
text(Y(:,1),Y(:,2),labs) % Plot SBP vs. DBP To start
hold off;


%% K-means clustering of dataset3.csv using available K-means script
% Testing the algorithm on subset of data
% SBP vs. DBP
data = readtable('dataset3.csv');
X1 = table2array(data(:,5)); % collect column SBP inforamtion
X2 = table2array(data(:,6)); % collect column DBP information
X = [X1, X2]; % set those 2 columns into a new data frame

% Perform k-means clustering @ k=2
[idx, C] = kmeans (X, 2, 'Distance', 'cityblock');
km = kmeans(X,2)
% Perform k-means clustering @ k=3
[idx3, C] = kmeans (X, 3, 'Distance', 'cityblock');
km3 = kmeans(X,3)
% Perform k-means clustering @ k=4
[idx4, C] = kmeans (X, 4, 'Distance', 'cityblock');
km4 = kmeans(X,4)
% Perform k-means clustering @ k=5
[idx5, C] = kmeans (X, 5, 'Distance', 'cityblock');
km5 = kmeans(X,5)
% Perform k-means clustering @ k=6
[idx6, C] = kmeans (X, 6, 'Distance', 'cityblock');
km6 = kmeans(X,6)


% Calculate silhouette coefficients @ each k=n and store them as variable vectors
s = silhouette(X,km,'cityblock') % keep the distance measurment consistent
s3 = silhouette(X,km3,'cityblock')
s4 = silhouette(X,km4,'cityblock')
s5 = silhouette(X,km5,'cityblock')
s6 = silhouette(X,km6,'cityblock')

compareS = [mean(s),mean(s3),mean(s4),mean(s5),mean(s6)]
% Sort the mean silhouette coefficient for each cluster 
[sd,r]=sort(compareS,'descend')
sd % sorted data cluster 2 wins!
r % the corresponding indices ranked 1 to 5


% Plot Silhouette outputs
figure(1); % each fiure only holds 3 stacked plots
subplot(3,1,1)
silhouette(X,km,'cityblock')   % calculate silhouette plot
title 'Subset Dataset @ k=2'
subplot(3,1,2)
silhouette(X,km3,'cityblock')   % calculate silhouette plot
title 'Subset Dataset @ k=3'
subplot(3,1,3)
silhouette(X,km4,'cityblock')   % calculate silhouette plot
title 'Subset Dataset @ k=4'

figure(2);
subplot(3,1,1)
silhouette(X,km5,'cityblock')
title 'Subset Dataset @ k=5'
subplot(3,1,2)
silhouette(X,km6,'cityblock')
title 'Subset Dataset @ k=6'



% Data Visualization @ K=2 w/ input ones and zeroes
figure(3);
subplot(3,1,1) % Data visualization for k=2

opts = statset('Display','final');
[idx2,C] = kmeans(X,2,'Distance','cityblock','Replicates',5,'Options',opts);

plot(X(idx2==1,1),X(idx2==1,2),'r.','MarkerSize',12);
hold on;
plot(X(idx2==2,1),X(idx2==2,2),'b.','MarkerSize',12);
%hold on;
%plot(X(idx5==3,1),X(idx5==3,2),'g.','MarkerSize',12);
%hold on;
%plot(X(idx5==4,1),X(idx5==4,2),'c.','MarkerSize',12);
%hold on;
%plot(X(idx5==5,1),X(idx5==5,2),'m.','MarkerSize',12);
legend('Cluster 1', 'Cluster 2', 'Cluster 3','Cluster 4','Cluster 5','Location','NW');
title('SBP vs. DBP Cluster assigments and centroids');
text(X(:,1),X(:,2),labs)
hold off;

%%
