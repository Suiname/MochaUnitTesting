function Fibonacci() {
  this.fibonacci = function(n) {
      if(n <= 2) {
          return 1;
      } else {
          return this.fibonacci(n - 1) + this.fibonacci(n - 2);
      }
  };
}

function FibNumber(number){
  var f = new Fibonacci()
  return f.fibonacci(number);
}

module.exports = FibNumber;
