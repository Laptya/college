var
a,s1,s2,s3:array of integer;
var n,i,k,c:integer;
test1,test1_2,test2,test2_2: text;

procedure sort1();
var j,i:integer;
begin
writeln('Изначальный массив:');
for i:=0 to n-1 do
write(a[i],' ');
writeln;
for i:=0 to n-1 do
s1[i]:=0;
for i:=0 to n-1 do
inc(s1[a[i]]);
for i:=0 to n-1 do
for j:=1 to s1[i] do 
begin
write(i,' ');
writeln(test1_2,i);
end;
writeln;
end;

procedure Sort2(left, right: integer);
var
  newLeft, newRight : integer; 
  temp, pivot : integer;
begin
  newLeft := left;
  newRight := right;

  pivot := a[(left + right) div 2];

  repeat
    while a[newLeft] < pivot do
      newLeft := newLeft + 1;

    while a[newRight] > pivot do
      newRight := newRight - 1;

    if newLeft <= newRight then
    begin
      
      temp := a[newLeft];
      a[newLeft] := a[newRight];
      a[newRight] := temp;

      newLeft := newLeft + 1;
      newRight := newRight - 1;
    end;
  until newLeft > newRight;

  
  if left < newRight then
    Sort2(left, newRight);

  
  if newLeft < right then
    Sort2(newLeft, right);
end;

begin
randomize;
assign(test1,'C:\CR5\test1.txt');
assign(test1_2,'C:\CR5\test1_2.txt');
assign(test2_2,'C:\CR5\test2_2.txt');
assign(test2,'C:\CR5\test2.txt');
repeat
writeln('Введите 1 или 2');
writeln('Введите 0 для выхода');
readln(k);
case k of
1: 
begin 
reset(test1);
rewrite(test1_2);
readln(test1,n);
setlength(a,n);
setlength(s1,n);
i:=0;
repeat 
readln(test1,c);
a[i]:=c;
inc(i);
until eof(test1);
sort1();
close(test1);
close(test1_2);
end;
2: 
begin 
reset(test2);
rewrite(test2_2);
readln(test2,n);
setlength(a,n);
i:=0;
repeat 
readln(test2,c);
a[i]:=c;
inc(i);
until eof(test2);
writeln('Изначальный массив:');
for i:=0 to n-1 do
write(a[i],' ');
writeln;
sort2(0,n-1);
writeln('Конечный массив:');
for i:=0 to n-1 do
begin
write(a[i],' ');
writeln(test2_2,a[i]);
end;
writeln;
end;
end;
writeln;
until k=0;
end.
