# Define your methods here.
def string_map!(str,&blk)
    str.each_char.with_index do |ele,i| 
        str[i]=blk.call(str[i])
    end
    str
end

def three?(arr,&blk)
    count=0
    arr.each {|ele|count+=1 if blk.call(ele)}
    count==3
end

def nand_select(arr,prc1,prc2)
    arr.select {|ele| !prc1.call(ele)||!prc2.call(ele)}
end

def hash_of_array_sum(hash)
    all_ele=[]
    hash.each_value {|val| all_ele<<val}
    all_ele.flatten.sum
end

def abbreviate(str)
    arr=str.split(" ")
    arr.each_with_index { |word,i|arr[i]=take_vowel(word)if word.length >4}
    arr.join(" ")
end 

def take_vowel(word)
    new=word.split("")
    word.each_char.with_index {|char,j| new[j]="" if "aeiouAEIOU".include?(char)}
    new.join("")
end

def hash_selector(hash,*arg)
    return hash if arg.length==0
    new={}
    hash.each do |key,val| 
        arg.each do |arg| 
            new[key]=val if arg==key
        end
    end
    new
end