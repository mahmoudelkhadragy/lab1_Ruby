class Complex_Num
    @@add = 0
    @@multiplies = 0
    @@bulk_add = 0
    @@bulk_multiply = 0
    attr_accessor :real, :imag
    def initialize(real, imag)
        @real = real
        @imag = imag
    end

    def print
        # puts @real.to_s + "+" + @imag.to_s + "i"
        puts "#{@real}+#{@imag}i"
    end

    def +(obj) 
        @@add += 1
        real = @real + obj.real
        imag = @imag + obj.imag
        return Complex_Num.new(real, imag)
    end

    def *(obj) 
        @@multiplies += 1
        real = (@real * obj.real) - (@imag * obj.imag)
        imag = (@real * obj.imag) + (@imag * obj.real)
        return Complex_Num.new(real, imag)
    end

    def self.bulk_add(arr)
        @@bulk_add += 1
        real = 0
        imag = 0

        arr.each do |comp|
            real += comp.real
            imag += comp.imag
        end

        return Complex_Num.new(real, imag)
    end

    def self.bulk_multiply(arr)

        @@bulk_multiply +=1
        complex = arr.first
        
        arr.drop(1).each do |comp|
             complex = complex * comp
        end

        return complex
    end

    def self.get_status
        puts "How many adds : #{@@add} \nHow many multiplies : #{@@multiplies} \nHow many bulk_adds : #{@@bulk_add} \nHow many bulk_multiply : #{@@bulk_multiply} "
    end

end

comp1 = Complex_Num.new(1,1)
comp2 = Complex_Num.new(1,2)
comp3 = Complex_Num.new(1,3)

comps_add = Complex_Num.bulk_add([comp1,comp2])
comps_multiply = Complex_Num.bulk_multiply([comp1,comp2,comp3])

comps_add.print
comps_multiply.print

# Complex_Num.get_status


