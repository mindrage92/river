extern printd(arg);
extern sleepd(arg);

def fib(x)
  if x < 3 then
    1
  else
    fib(x-1)+fib(x-2);

sleepd(3000);
printd(10);