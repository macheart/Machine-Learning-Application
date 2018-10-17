%% Includes 21 pairs of k-means (n=2,3,4,5,or 6) assessments. 
% Output includes silhouette plots per K=n cluster (and mean value 
% calculation per k=n) and a final plot of k=2 cluster with centroiud
% included

%% K-means clustering of dataset3.csv using available K-means script
% SBP vs. DBP
data = readtable('dataset3.csv');
X1 = table2array(data(:,5)); % collect column SBP inforamtion
X2 = table2array(data(:,6)); % collect column DBP information
X = [X1, X2]; % set those 2 columns into a new data frame
%X( ~any(X,2), : ) = [];  % remove rows with zeroes
%X( :, ~any(X,1) ) = [];  % remove columns with zeroes
%X(any(X==0,2),:) = []; % remove rows with atleast 1 zero, reduces matrix by 4 more samples
size(X) % 50 x 2

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


% Calculate silhouette coefficients
s = silhouette(X,km,'cityblock')
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
figure(1);
subplot(3,1,1)
silhouette(X,km,'cityblock')  % calculate silhouette plot
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

% Data Visualization @ K=2
figure(3);
subplot(3,1,1) % Data visualization for k=2
opts = statset('Display','final');
[idx,C] = kmeans(X,2,'Distance','cityblock',...
    'Replicates',5,'Options',opts);
plot(X(idx==1,1),X(idx==1,2),'r.','MarkerSize',12);
hold on;
plot(X(idx==2,1),X(idx==2,2),'b.','MarkerSize',12);
plot(C(:,1),C(:,2),'kx','MarkerSize',15,'LineWidth',3);
legend('Cluster 1', 'Cluster 2', 'Centroids','Location','NW');
title('Cluster assigments and centroids');
hold off;

%% K-means clustering of dataset3.csv using available K-means script
% SBP vs. Hb
data = readtable('dataset3.csv');
X1 = table2array(data(:,5)); % collect column SBP inforamtion
X2 = table2array(data(:,7)); % collect column DBP information
X = [X1, X2]; % set those 2 columns into a new data frame
%X( ~any(X,2), : ) = [];  % remove rows with zeroes
%X( :, ~any(X,1) ) = [];  % remove columns with zeroes
%X(any(X==0,2),:) = []; % remove rows with atleast 1 zero, reduces matrix by 4 more samples
size(X) % 50 x 2

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


% Calculate silhouette coefficients
s = silhouette(X,km,'cityblock')
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
figure(1);
subplot(3,1,1)
silhouette(X,km,'cityblock')  % calculate silhouette plot
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

% Data Visualization @ K=2
figure(3);
subplot(3,1,1) % Data visualization for k=2
opts = statset('Display','final');
[idx,C] = kmeans(X,2,'Distance','cityblock',...
    'Replicates',5,'Options',opts);
plot(X(idx==1,1),X(idx==1,2),'r.','MarkerSize',12);
hold on;
plot(X(idx==2,1),X(idx==2,2),'b.','MarkerSize',12);
plot(C(:,1),C(:,2),'kx','MarkerSize',15,'LineWidth',3);
legend('Cluster 1', 'Cluster 2', 'Centroids','Location','NW');
title('Cluster assigments and centroids');
hold off;
%% K-means clustering of dataset3.csv using available K-means script
% SBP vs. WBC
data = readtable('dataset3.csv');
X1 = table2array(data(:,5)); % collect column SBP inforamtion
X2 = table2array(data(:,8)); % collect column DBP information
X = [X1, X2]; % set those 2 columns into a new data frame
%X( ~any(X,2), : ) = [];  % remove rows with zeroes
%X( :, ~any(X,1) ) = [];  % remove columns with zeroes
%X(any(X==0,2),:) = []; % remove rows with atleast 1 zero, reduces matrix by 4 more samples
size(X) % 50 x 2

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


% Calculate silhouette coefficients
s = silhouette(X,km,'cityblock')
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
figure(1);
subplot(3,1,1)
silhouette(X,km,'cityblock')  % calculate silhouette plot
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

% Data Visualization @ K=2
figure(3);
subplot(3,1,1) % Data visualization for k=2
opts = statset('Display','final');
[idx,C] = kmeans(X,2,'Distance','cityblock',...
    'Replicates',5,'Options',opts);
plot(X(idx==1,1),X(idx==1,2),'r.','MarkerSize',12);
hold on;
plot(X(idx==2,1),X(idx==2,2),'b.','MarkerSize',12);
plot(C(:,1),C(:,2),'kx','MarkerSize',15,'LineWidth',3);
legend('Cluster 1', 'Cluster 2', 'Centroids','Location','NW');
title('Cluster assigments and centroids');
hold off;

%% K-means clustering of dataset3.csv using available K-means script
% SBP vs. Platelet
data = readtable('dataset3.csv');
X1 = table2array(data(:,5)); % collect column SBP inforamtion
X2 = table2array(data(:,9)); % collect column DBP information
X = [X1, X2]; % set those 2 columns into a new data frame
%X( ~any(X,2), : ) = [];  % remove rows with zeroes
%X( :, ~any(X,1) ) = [];  % remove columns with zeroes
%X(any(X==0,2),:) = []; % remove rows with atleast 1 zero, reduces matrix by 4 more samples
size(X) % 50 x 2

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


% Calculate silhouette coefficients
s = silhouette(X,km,'cityblock')
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
figure(1);
subplot(3,1,1)
silhouette(X,km,'cityblock')  % calculate silhouette plot
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

% Data Visualization @ K=2
figure(3);
subplot(3,1,1) % Data visualization for k=2
opts = statset('Display','final');
[idx,C] = kmeans(X,2,'Distance','cityblock',...
    'Replicates',5,'Options',opts);
plot(X(idx==1,1),X(idx==1,2),'r.','MarkerSize',12);
hold on;
plot(X(idx==2,1),X(idx==2,2),'b.','MarkerSize',12);
plot(C(:,1),C(:,2),'kx','MarkerSize',15,'LineWidth',3);
legend('Cluster 1', 'Cluster 2', 'Centroids','Location','NW');
title('Cluster assigments and centroids');
hold off;

%% K-means clustering of dataset3.csv using available K-means script
% SBP vs. Creatinine
data = readtable('dataset3.csv');
X1 = table2array(data(:,5)); % collect column SBP inforamtion
X2 = table2array(data(:,11)); % collect column DBP information
X = [X1, X2]; % set those 2 columns into a new data frame
%X( ~any(X,2), : ) = [];  % remove rows with zeroes
%X( :, ~any(X,1) ) = [];  % remove columns with zeroes
%X(any(X==0,2),:) = []; % remove rows with atleast 1 zero, reduces matrix by 4 more samples
size(X) % 50 x 2

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


% Calculate silhouette coefficients
s = silhouette(X,km,'cityblock')
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
figure(1);
subplot(3,1,1)
silhouette(X,km,'cityblock')  % calculate silhouette plot
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

% Data Visualization @ K=2
figure(3);
subplot(3,1,1) % Data visualization for k=2
opts = statset('Display','final');
[idx,C] = kmeans(X,2,'Distance','cityblock',...
    'Replicates',5,'Options',opts);
plot(X(idx==1,1),X(idx==1,2),'r.','MarkerSize',12);
hold on;
plot(X(idx==2,1),X(idx==2,2),'b.','MarkerSize',12);
plot(C(:,1),C(:,2),'kx','MarkerSize',15,'LineWidth',3);
legend('Cluster 1', 'Cluster 2', 'Centroids','Location','NW');
title('Cluster assigments and centroids');
hold off;

%% K-means clustering of dataset3.csv using available K-means script
% SBP vs. BUN
data = readtable('dataset3.csv');
X1 = table2array(data(:,5)); % collect column SBP inforamtion
X2 = table2array(data(:,10)); % collect column DBP information
X = [X1, X2]; % set those 2 columns into a new data frame
%X( ~any(X,2), : ) = [];  % remove rows with zeroes
%X( :, ~any(X,1) ) = [];  % remove columns with zeroes
%X(any(X==0,2),:) = []; % remove rows with atleast 1 zero, reduces matrix by 4 more samples
size(X) % 50 x 2

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


% Calculate silhouette coefficients
s = silhouette(X,km,'cityblock')
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
figure(1);
subplot(3,1,1)
silhouette(X,km,'cityblock')  % calculate silhouette plot
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

% Data Visualization @ K=2
figure(3);
subplot(3,1,1) % Data visualization for k=2
opts = statset('Display','final');
[idx,C] = kmeans(X,2,'Distance','cityblock',...
    'Replicates',5,'Options',opts);
plot(X(idx==1,1),X(idx==1,2),'r.','MarkerSize',12);
hold on;
plot(X(idx==2,1),X(idx==2,2),'b.','MarkerSize',12);
plot(C(:,1),C(:,2),'kx','MarkerSize',15,'LineWidth',3);
legend('Cluster 1', 'Cluster 2', 'Centroids','Location','NW');
title('Cluster assigments and centroids');
hold off;

%% K-means clustering of dataset3.csv using available K-means script
% DBP vs. Hb
data = readtable('dataset3.csv');
X1 = table2array(data(:,6)); % collect column SBP inforamtion
X2 = table2array(data(:,7)); % collect column DBP information
X = [X1, X2]; % set those 2 columns into a new data frame
%X( ~any(X,2), : ) = [];  % remove rows with zeroes
%X( :, ~any(X,1) ) = [];  % remove columns with zeroes
%X(any(X==0,2),:) = []; % remove rows with atleast 1 zero, reduces matrix by 4 more samples
size(X) % 50 x 2

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


% Calculate silhouette coefficients
s = silhouette(X,km,'cityblock')
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
figure(1);
subplot(3,1,1)
silhouette(X,km,'cityblock')  % calculate silhouette plot
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

% Data Visualization @ K=2
figure(3);
subplot(3,1,1) % Data visualization for k=2
opts = statset('Display','final');
[idx,C] = kmeans(X,2,'Distance','cityblock',...
    'Replicates',5,'Options',opts);
plot(X(idx==1,1),X(idx==1,2),'r.','MarkerSize',12);
hold on;
plot(X(idx==2,1),X(idx==2,2),'b.','MarkerSize',12);
plot(C(:,1),C(:,2),'kx','MarkerSize',15,'LineWidth',3);
legend('Cluster 1', 'Cluster 2', 'Centroids','Location','NW');
title('Cluster assigments and centroids');
hold off;

%% K-means clustering of dataset3.csv using available K-means script
% DBP vs. WBC
data = readtable('dataset3.csv');
X1 = table2array(data(:,6)); % collect column SBP inforamtion
X2 = table2array(data(:,8)); % collect column DBP information
X = [X1, X2]; % set those 2 columns into a new data frame
%X( ~any(X,2), : ) = [];  % remove rows with zeroes
%X( :, ~any(X,1) ) = [];  % remove columns with zeroes
%X(any(X==0,2),:) = []; % remove rows with atleast 1 zero, reduces matrix by 4 more samples
size(X) % 50 x 2

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


% Calculate silhouette coefficients
s = silhouette(X,km,'cityblock')
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
figure(1);
subplot(3,1,1)
silhouette(X,km,'cityblock')  % calculate silhouette plot
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

% Data Visualization @ K=2
figure(3);
subplot(3,1,1) % Data visualization for k=2
opts = statset('Display','final');
[idx,C] = kmeans(X,2,'Distance','cityblock',...
    'Replicates',5,'Options',opts);
plot(X(idx==1,1),X(idx==1,2),'r.','MarkerSize',12);
hold on;
plot(X(idx==2,1),X(idx==2,2),'b.','MarkerSize',12);
plot(C(:,1),C(:,2),'kx','MarkerSize',15,'LineWidth',3);
legend('Cluster 1', 'Cluster 2', 'Centroids','Location','NW');
title('Cluster assigments and centroids');
hold off;



%% K-means clustering of dataset3.csv using available K-means script
% DBP vs. Platelet
data = readtable('dataset3.csv');
X1 = table2array(data(:,6)); % collect column SBP inforamtion
X2 = table2array(data(:,9)); % collect column DBP information
X = [X1, X2]; % set those 2 columns into a new data frame
%X( ~any(X,2), : ) = [];  % remove rows with zeroes
%X( :, ~any(X,1) ) = [];  % remove columns with zeroes
%X(any(X==0,2),:) = []; % remove rows with atleast 1 zero, reduces matrix by 4 more samples
size(X) % 50 x 2

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


% Calculate silhouette coefficients
s = silhouette(X,km,'cityblock')
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
figure(1);
subplot(3,1,1)
silhouette(X,km,'cityblock')  % calculate silhouette plot
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

% Data Visualization @ K=2
figure(3);
subplot(3,1,1) % Data visualization for k=2
opts = statset('Display','final');
[idx,C] = kmeans(X,2,'Distance','cityblock',...
    'Replicates',5,'Options',opts);
plot(X(idx==1,1),X(idx==1,2),'r.','MarkerSize',12);
hold on;
plot(X(idx==2,1),X(idx==2,2),'b.','MarkerSize',12);
plot(C(:,1),C(:,2),'kx','MarkerSize',15,'LineWidth',3);
legend('Cluster 1', 'Cluster 2', 'Centroids','Location','NW');
title('Cluster assigments and centroids');
hold off;



%% K-means clustering of dataset3.csv using available K-means script
% DBP vs. Creatine
data = readtable('dataset3.csv');
X1 = table2array(data(:,6)); % collect column SBP inforamtion
X2 = table2array(data(:,11)); % collect column DBP information
X = [X1, X2]; % set those 2 columns into a new data frame
%X( ~any(X,2), : ) = [];  % remove rows with zeroes
%X( :, ~any(X,1) ) = [];  % remove columns with zeroes
%X(any(X==0,2),:) = []; % remove rows with atleast 1 zero, reduces matrix by 4 more samples
size(X) % 50 x 2

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


% Calculate silhouette coefficients
s = silhouette(X,km,'cityblock')
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
figure(1);
subplot(3,1,1)
silhouette(X,km,'cityblock')  % calculate silhouette plot
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

% Data Visualization @ K=2
figure(3);
subplot(3,1,1) % Data visualization for k=2
opts = statset('Display','final');
[idx,C] = kmeans(X,2,'Distance','cityblock',...
    'Replicates',5,'Options',opts);
plot(X(idx==1,1),X(idx==1,2),'r.','MarkerSize',12);
hold on;
plot(X(idx==2,1),X(idx==2,2),'b.','MarkerSize',12);
plot(C(:,1),C(:,2),'kx','MarkerSize',15,'LineWidth',3);
legend('Cluster 1', 'Cluster 2', 'Centroids','Location','NW');
title('Cluster assigments and centroids');
hold off;

%% K-means clustering of dataset3.csv using available K-means script
% DBP vs. BUN
data = readtable('dataset3.csv');
X1 = table2array(data(:,6)); % collect column SBP inforamtion
X2 = table2array(data(:,10)); % collect column DBP information
X = [X1, X2]; % set those 2 columns into a new data frame
%X( ~any(X,2), : ) = [];  % remove rows with zeroes
%X( :, ~any(X,1) ) = [];  % remove columns with zeroes
%X(any(X==0,2),:) = []; % remove rows with atleast 1 zero, reduces matrix by 4 more samples
size(X) % 50 x 2

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


% Calculate silhouette coefficients
s = silhouette(X,km,'cityblock')
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
figure(1);
subplot(3,1,1)
silhouette(X,km,'cityblock')  % calculate silhouette plot
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

% Data Visualization @ K=2
figure(3);
subplot(3,1,1) % Data visualization for k=2
opts = statset('Display','final');
[idx,C] = kmeans(X,2,'Distance','cityblock',...
    'Replicates',5,'Options',opts);
plot(X(idx==1,1),X(idx==1,2),'r.','MarkerSize',12);
hold on;
plot(X(idx==2,1),X(idx==2,2),'b.','MarkerSize',12);
plot(C(:,1),C(:,2),'kx','MarkerSize',15,'LineWidth',3);
legend('Cluster 1', 'Cluster 2', 'Centroids','Location','NW');
title('Cluster assigments and centroids');
hold off;


%% K-means clustering of dataset3.csv using available K-means script
% Hb vs. WBC
data = readtable('dataset3.csv');
X1 = table2array(data(:,7)); % collect column SBP inforamtion
X2 = table2array(data(:,8)); % collect column DBP information
X = [X1, X2]; % set those 2 columns into a new data frame
%X( ~any(X,2), : ) = [];  % remove rows with zeroes
%X( :, ~any(X,1) ) = [];  % remove columns with zeroes
%X(any(X==0,2),:) = []; % remove rows with atleast 1 zero, reduces matrix by 4 more samples
size(X) % 50 x 2

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


% Calculate silhouette coefficients
s = silhouette(X,km,'cityblock')
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
figure(1);
subplot(3,1,1)
silhouette(X,km,'cityblock')  % calculate silhouette plot
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

% Data Visualization @ K=2
figure(3);
subplot(3,1,1) % Data visualization for k=2
opts = statset('Display','final');
[idx,C] = kmeans(X,2,'Distance','cityblock',...
    'Replicates',5,'Options',opts);
plot(X(idx==1,1),X(idx==1,2),'r.','MarkerSize',12);
hold on;
plot(X(idx==2,1),X(idx==2,2),'b.','MarkerSize',12);
plot(C(:,1),C(:,2),'kx','MarkerSize',15,'LineWidth',3);
legend('Cluster 1', 'Cluster 2', 'Centroids','Location','NW');
title('Cluster assigments and centroids');
hold off;

%% K-means clustering of dataset3.csv using available K-means script
% Hb vs. Platelet
data = readtable('dataset3.csv');
X1 = table2array(data(:,7)); % collect column SBP inforamtion
X2 = table2array(data(:,9)); % collect column DBP information
X = [X1, X2]; % set those 2 columns into a new data frame
%X( ~any(X,2), : ) = [];  % remove rows with zeroes
%X( :, ~any(X,1) ) = [];  % remove columns with zeroes
%X(any(X==0,2),:) = []; % remove rows with atleast 1 zero, reduces matrix by 4 more samples
size(X) % 50 x 2

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


% Calculate silhouette coefficients
s = silhouette(X,km,'cityblock')
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
figure(1);
subplot(3,1,1)
silhouette(X,km,'cityblock')  % calculate silhouette plot
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

% Data Visualization @ K=2
figure(3);
subplot(3,1,1) % Data visualization for k=2
opts = statset('Display','final');
[idx,C] = kmeans(X,2,'Distance','cityblock',...
    'Replicates',5,'Options',opts);
plot(X(idx==1,1),X(idx==1,2),'r.','MarkerSize',12);
hold on;
plot(X(idx==2,1),X(idx==2,2),'b.','MarkerSize',12);
plot(C(:,1),C(:,2),'kx','MarkerSize',15,'LineWidth',3);
legend('Cluster 1', 'Cluster 2', 'Centroids','Location','NW');
title('Cluster assigments and centroids');
hold off;



%% K-means clustering of dataset3.csv using available K-means script
% Hb vs. Creatinine
data = readtable('dataset3.csv');
X1 = table2array(data(:,7)); % collect column SBP inforamtion
X2 = table2array(data(:,11)); % collect column DBP information
X = [X1, X2]; % set those 2 columns into a new data frame
%X( ~any(X,2), : ) = [];  % remove rows with zeroes
%X( :, ~any(X,1) ) = [];  % remove columns with zeroes
%X(any(X==0,2),:) = []; % remove rows with atleast 1 zero, reduces matrix by 4 more samples
size(X) % 50 x 2

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


% Calculate silhouette coefficients
s = silhouette(X,km,'cityblock')
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
figure(1);
subplot(3,1,1)
silhouette(X,km,'cityblock')  % calculate silhouette plot
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

% Data Visualization @ K=2
figure(3);
subplot(3,1,1) % Data visualization for k=2
opts = statset('Display','final');
[idx,C] = kmeans(X,2,'Distance','cityblock',...
    'Replicates',5,'Options',opts);
plot(X(idx==1,1),X(idx==1,2),'r.','MarkerSize',12);
hold on;
plot(X(idx==2,1),X(idx==2,2),'b.','MarkerSize',12);
plot(C(:,1),C(:,2),'kx','MarkerSize',15,'LineWidth',3);
legend('Cluster 1', 'Cluster 2', 'Centroids','Location','NW');
title('Cluster assigments and centroids');
hold off;

%% K-means clustering of dataset3.csv using available K-means script
% Hb vs. BUN
data = readtable('dataset3.csv');
X1 = table2array(data(:,7)); % collect column SBP inforamtion
X2 = table2array(data(:,10)); % collect column DBP information
X = [X1, X2]; % set those 2 columns into a new data frame
%X( ~any(X,2), : ) = [];  % remove rows with zeroes
%X( :, ~any(X,1) ) = [];  % remove columns with zeroes
%X(any(X==0,2),:) = []; % remove rows with atleast 1 zero, reduces matrix by 4 more samples
size(X) % 50 x 2

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


% Calculate silhouette coefficients
s = silhouette(X,km,'cityblock')
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
figure(1);
subplot(3,1,1)
silhouette(X,km,'cityblock')  % calculate silhouette plot
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

% Data Visualization @ K=2
figure(3);
subplot(3,1,1) % Data visualization for k=2
opts = statset('Display','final');
[idx,C] = kmeans(X,2,'Distance','cityblock',...
    'Replicates',5,'Options',opts);
plot(X(idx==1,1),X(idx==1,2),'r.','MarkerSize',12);
hold on;
plot(X(idx==2,1),X(idx==2,2),'b.','MarkerSize',12);
plot(C(:,1),C(:,2),'kx','MarkerSize',15,'LineWidth',3);
legend('Cluster 1', 'Cluster 2', 'Centroids','Location','NW');
title('Cluster assigments and centroids');
hold off;


%% K-means clustering of dataset3.csv using available K-means script
% WBC vs. Platelet
data = readtable('dataset3.csv');
X1 = table2array(data(:,8)); % collect column SBP inforamtion
X2 = table2array(data(:,9)); % collect column DBP information
X = [X1, X2]; % set those 2 columns into a new data frame
%X( ~any(X,2), : ) = [];  % remove rows with zeroes
%X( :, ~any(X,1) ) = [];  % remove columns with zeroes
%X(any(X==0,2),:) = []; % remove rows with atleast 1 zero, reduces matrix by 4 more samples
size(X) % 50 x 2

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


% Calculate silhouette coefficients
s = silhouette(X,km,'cityblock')
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
figure(1);
subplot(3,1,1)
silhouette(X,km,'cityblock')  % calculate silhouette plot
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

% Data Visualization @ K=2
figure(3);
subplot(3,1,1) % Data visualization for k=2
opts = statset('Display','final');
[idx,C] = kmeans(X,2,'Distance','cityblock',...
    'Replicates',5,'Options',opts);
plot(X(idx==1,1),X(idx==1,2),'r.','MarkerSize',12);
hold on;
plot(X(idx==2,1),X(idx==2,2),'b.','MarkerSize',12);
plot(C(:,1),C(:,2),'kx','MarkerSize',15,'LineWidth',3);
legend('Cluster 1', 'Cluster 2', 'Centroids','Location','NW');
title('Cluster assigments and centroids');
hold off;



%% K-means clustering of dataset3.csv using available K-means script
% WBC vs. Creatinine
data = readtable('dataset3.csv');
X1 = table2array(data(:,8)); % collect column SBP inforamtion
X2 = table2array(data(:,11)); % collect column DBP information
X = [X1, X2]; % set those 2 columns into a new data frame
%X( ~any(X,2), : ) = [];  % remove rows with zeroes
%X( :, ~any(X,1) ) = [];  % remove columns with zeroes
%X(any(X==0,2),:) = []; % remove rows with atleast 1 zero, reduces matrix by 4 more samples
size(X) % 50 x 2

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


% Calculate silhouette coefficients
s = silhouette(X,km,'cityblock')
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
figure(1);
subplot(3,1,1)
silhouette(X,km,'cityblock')  % calculate silhouette plot
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

% Data Visualization @ K=2
figure(3);
subplot(3,1,1) % Data visualization for k=2
opts = statset('Display','final');
[idx,C] = kmeans(X,2,'Distance','cityblock',...
    'Replicates',5,'Options',opts);
plot(X(idx==1,1),X(idx==1,2),'r.','MarkerSize',12);
hold on;
plot(X(idx==2,1),X(idx==2,2),'b.','MarkerSize',12);
plot(C(:,1),C(:,2),'kx','MarkerSize',15,'LineWidth',3);
legend('Cluster 1', 'Cluster 2', 'Centroids','Location','NW');
title('Cluster assigments and centroids');
hold off;

%% K-means clustering of dataset3.csv using available K-means script
% WBC vs. BUN
data = readtable('dataset3.csv');
X1 = table2array(data(:,8)); % collect column SBP inforamtion
X2 = table2array(data(:,10)); % collect column DBP information
X = [X1, X2]; % set those 2 columns into a new data frame
%X( ~any(X,2), : ) = [];  % remove rows with zeroes
%X( :, ~any(X,1) ) = [];  % remove columns with zeroes
%X(any(X==0,2),:) = []; % remove rows with atleast 1 zero, reduces matrix by 4 more samples
size(X) % 50 x 2

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


% Calculate silhouette coefficients
s = silhouette(X,km,'cityblock')
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
figure(1);
subplot(3,1,1)
silhouette(X,km,'cityblock')  % calculate silhouette plot
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

% Data Visualization @ K=2
figure(3);
subplot(3,1,1) % Data visualization for k=2
opts = statset('Display','final');
[idx,C] = kmeans(X,2,'Distance','cityblock',...
    'Replicates',5,'Options',opts);
plot(X(idx==1,1),X(idx==1,2),'r.','MarkerSize',12);
hold on;
plot(X(idx==2,1),X(idx==2,2),'b.','MarkerSize',12);
plot(C(:,1),C(:,2),'kx','MarkerSize',15,'LineWidth',3);
legend('Cluster 1', 'Cluster 2', 'Centroids','Location','NW');
title('Cluster assigments and centroids');
hold off;
%% K-means clustering of dataset3.csv using available K-means script
% Platelet vs. Creatinine
data = readtable('dataset3.csv');
X1 = table2array(data(:,9)); % collect column SBP inforamtion
X2 = table2array(data(:,11)); % collect column DBP information
X = [X1, X2]; % set those 2 columns into a new data frame
%X( ~any(X,2), : ) = [];  % remove rows with zeroes
%X( :, ~any(X,1) ) = [];  % remove columns with zeroes
%X(any(X==0,2),:) = []; % remove rows with atleast 1 zero, reduces matrix by 4 more samples
size(X) % 50 x 2

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


% Calculate silhouette coefficients
s = silhouette(X,km,'cityblock')
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
figure(1);
subplot(3,1,1)
silhouette(X,km,'cityblock')  % calculate silhouette plot
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

% Data Visualization @ K=2
figure(3);
subplot(3,1,1) % Data visualization for k=2
opts = statset('Display','final');
[idx,C] = kmeans(X,2,'Distance','cityblock',...
    'Replicates',5,'Options',opts);
plot(X(idx==1,1),X(idx==1,2),'r.','MarkerSize',12);
hold on;
plot(X(idx==2,1),X(idx==2,2),'b.','MarkerSize',12);
plot(C(:,1),C(:,2),'kx','MarkerSize',15,'LineWidth',3);
legend('Cluster 1', 'Cluster 2', 'Centroids','Location','NW');
title('Cluster assigments and centroids');
hold off;


%% K-means clustering of dataset3.csv using available K-means script
% Platelet vs. BUN
data = readtable('dataset3.csv');
X1 = table2array(data(:,9)); % collect column SBP inforamtion
X2 = table2array(data(:,10)); % collect column DBP information
X = [X1, X2]; % set those 2 columns into a new data frame
%X( ~any(X,2), : ) = [];  % remove rows with zeroes
%X( :, ~any(X,1) ) = [];  % remove columns with zeroes
%X(any(X==0,2),:) = []; % remove rows with atleast 1 zero, reduces matrix by 4 more samples
size(X) % 50 x 2

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


% Calculate silhouette coefficients
s = silhouette(X,km,'cityblock')
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
figure(1);
subplot(3,1,1)
silhouette(X,km,'cityblock')  % calculate silhouette plot
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

% Data Visualization @ K=2
figure(3);
subplot(3,1,1) % Data visualization for k=2
opts = statset('Display','final');
[idx,C] = kmeans(X,2,'Distance','cityblock',...
    'Replicates',5,'Options',opts);
plot(X(idx==1,1),X(idx==1,2),'r.','MarkerSize',12);
hold on;
plot(X(idx==2,1),X(idx==2,2),'b.','MarkerSize',12);
plot(C(:,1),C(:,2),'kx','MarkerSize',15,'LineWidth',3);
legend('Cluster 1', 'Cluster 2', 'Centroids','Location','NW');
title('Cluster assigments and centroids');
hold off;

%% K-means clustering of dataset3.csv using available K-means script
% Creatinine vs. BUN
data = readtable('dataset3.csv');
X1 = table2array(data(:,11)); % collect column SBP inforamtion
X2 = table2array(data(:,10)); % collect column DBP information
X = [X1, X2]; % set those 2 columns into a new data frame
%X( ~any(X,2), : ) = [];  % remove rows with zeroes
%X( :, ~any(X,1) ) = [];  % remove columns with zeroes
%X(any(X==0,2),:) = []; % remove rows with atleast 1 zero, reduces matrix by 4 more samples
size(X) % 50 x 2

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


% Calculate silhouette coefficients
s = silhouette(X,km,'cityblock')
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
figure(1);
subplot(3,1,1)
silhouette(X,km,'cityblock')  % calculate silhouette plot
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

% Data Visualization @ K=2
figure(3);
subplot(3,1,1) % Data visualization for k=2
opts = statset('Display','final');
[idx,C] = kmeans(X,2,'Distance','cityblock',...
    'Replicates',5,'Options',opts);
plot(X(idx==1,1),X(idx==1,2),'r.','MarkerSize',12);
hold on;
plot(X(idx==2,1),X(idx==2,2),'b.','MarkerSize',12);
plot(C(:,1),C(:,2),'kx','MarkerSize',15,'LineWidth',3);
legend('Cluster 1', 'Cluster 2', 'Centroids','Location','NW');
title('Cluster assigments and centroids');
hold off;

%%
