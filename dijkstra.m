%��Դ���·���㷨��dijkstra
%ʹ�ã��ɽ���޸�Ȩͼ�ĸ������յ����·�����⣬�޷������Ȩͼ
%ʱ�临�Ӷȣ�O��n^2��
%������A-n*n���󣬵�һ�зֱ�����һ���㵽��������ľ��룬�ڽӵ����Ϊ��Ӧ��Ȩ�أ����ڽӵ����Ϊinf
%     sn-��ʼ��
%     en-��ֹ��
function[distance, path] = dijkstra(A,sn,en)

n = length(A);
D = A(sn,:);
vi = ones(1,n);
vi(sn) = 0;
parent = zeros(1,n);

%������̾���
for i = 1:n-1
    temp = zeros(1,n);
    count = 0;
    %��һ��ѭ��������box3
    for j = 1:n
        if(vi(j))
            temp = [temp(1: count) D(j)];
        else
            temp = [temp(1: count) inf];
        end
        count = count + 1;
    end
    %�ҳ�box3����С��
    [~, index] = min(temp);
    %������һ����ٲ���Ƚ�
    vi(index) = 0;
    %�ڶ���ѭ����relaxation���Ƚ���һ�ֺ���һ�ֵľ����С��ϵ
    for k = 1:n
        if A(index,k) + D(index) < D(k)
            D(k) = A(index, k) + D(index);
            parent(k) = index;
        end
    end
end
distance = D(en)

%�����·��
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
