%单源最短路径算法：dijkstra
%使用：可解决无负权图的给定起终点最短路径问题，无法解决负权图
%时间复杂度：O（n^2）
%参数：A-n*n矩阵，第一行分别代表第一个点到其他各点的距离，邻接点距离为对应的权重，非邻接点距离为inf
%     sn-起始点
%     en-终止点
function[distance, path] = dijkstra(A,sn,en)

n = length(A);
D = A(sn,:);
vi = ones(1,n);
vi(sn) = 0;
parent = zeros(1,n);

%计算最短距离
for i = 1:n-1
    temp = zeros(1,n);
    count = 0;
    %第一个循环：生成box3
    for j = 1:n
        if(vi(j))
            temp = [temp(1: count) D(j)];
        else
            temp = [temp(1: count) inf];
        end
        count = count + 1;
    end
    %找出box3中最小项
    [~, index] = min(temp);
    %划掉这一项，不再参与比较
    vi(index) = 0;
    %第二个循环：relaxation，比较这一轮和上一轮的距离大小关系
    for k = 1:n
        if A(index,k) + D(index) < D(k)
            D(k) = A(index, k) + D(index);
            parent(k) = index;
        end
    end
end
distance = D(en)

%求最短路径
path = [];
t = en; path(1) = t; count = 1;
while t~=sn && t>0
    p = parent(t);
    path = [p path(1:count)];
    t = p;
    count = count + 1;
end
path(1) = sn;
path = path(1:count)
