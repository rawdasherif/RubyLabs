
class ComplexNumber
    @@count = {:sum_one =>0, sum_arr: 0,"mul_one"=>0,"mul_arr"=>0}
    attr_accessor :real ,:imag

        def initialize(real, imag)
            @real = real
            @imag = imag
        end

        def +(cn1)
            @@count["sum_one"]= @@count["sum_one"]+1  
            ComplexNumber.new(@real + cn1.real,
                           @imag + cn1.imag)   
        end
        
        def *(cn1)
            @@count["mul_one"]=  @@count["mul_one"]+1   
            ComplexNumber.new((@real * cn1.real-@imag * cn1.imag),(@real * cn1.imag+cn1.real*@imag) )                               
        end  
        
       def self.sum (array)
        @@count["sum_arr"]= @@count["sum_arr"]+1  
       cns=ComplexNumber.new(0,0)
       array.each do |element|
         cns = cns + element
        end 
        return cns
       end

       def self.mul (array)
        @@count["mul_arr"]= @@count["mul_arr"]+1 
        cns=ComplexNumber.new(1,0)
        array.each do |element|
          cns = cns * element
         end
         return cns
       end
 
        def to_s
            return "#{@real} + #{@imag}i"
        end

        def self.variable
            @@count
        end
    
end     

cn1=ComplexNumber.new(3,2)
cn2=ComplexNumber.new(1,7) 
cn3=ComplexNumber.new(1,1) 
 puts "add:"
 puts cn1+cn2

 puts "add:"
 puts cn2+cn3

 puts "mul:"
 puts cn1*cn2

sum=ComplexNumber.sum([cn1,cn2])
puts "sum  of array is :#{sum}"
mul=ComplexNumber.mul([cn1,cn2])
puts "mul of array is :#{mul}"

puts "-----------------"
 puts "number of sum is : #{ComplexNumber.variable["sum_one"]}"
 puts "number of mul is : #{ComplexNumber.variable["mul_one"]}"
 puts "number of arrays of sum is :#{ComplexNumber.variable["sum_arr"]}"
 puts "number of arrays od mul is :#{ComplexNumber.variable["mul_arr"]}"


