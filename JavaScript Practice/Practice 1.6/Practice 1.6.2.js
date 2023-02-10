
let  s = "12";
let  s1 = "226";
let n = s.length;
let n1 = s.length;




function decoding(s,n)
    {
        

        if (n == 0 || n == 1)   return 1;

        if (s[0] == '0')   return 0;
         
        let output = 0;
         
        if (s[n - 1] > '0')
        {
            output = decoding(s, n - 1);
           
        }
    
        if (s[n - 2] == '1' || (s[n - 2] == '2' && s[n - 1] < '7'))
        {
            output += decoding(s, n - 2);
        }
        return output;
    }
    function countWays(digits, n)
    {
        if (n == 0 || (n == 1 && s[0] == '0'))
        {
            return 0;
        }
        return decoding(s, n);
    }
     
   
   console.log(countWays(s1,n1));