%% h clustering
% Of sample dataset contained in dataset3.csv
%%
data = readtable('dataset3.csv');
arr = table2array(data);
X = table2array(data(:,5:11)); % collect 7 columns
% Compute pairwise distances
Y = pdist(X);
% Link pair of objects that are close to each other
Z = linkage(Y);

% Create a dendrogram (Graphical representation of the cluster tree)
%dendrogram(Z); 

% Verify clustering
C = cophenet(Z, Y); % measure of performance?

%% Heatmap (Clustergram)
feats ={'SBP','DBP','Hb','WBC','Platelet','BUN','Creatinine'}
clst = clustergram(X, 'Standardize', 'Row'); % includes normalization of 7 things
set(clst,'ColumnLabels',feats) % include labels for each feature included in assessment 

get(clst) % Get information about 
set(clst,'Linkage','complete','Dendrogram',3) %set a threshold criteria
%% 