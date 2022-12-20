# Define your methods here. 
def first_letter_vowel_count(str)
    arr=str.split(" ")
    count=0
    arr.each {|ele|count+=1 if "aeiouAEIOU".include?(ele[0])}
    count
end

def count_true(arr,prc)
    count=0
    arr.each {|ele|count+=1 if prc.call(ele)}
    count
end

def procformation(arr,prc1,prc2,prc3)
    new=[]
    arr.each do |ele|
        new<<prc2.call(ele) if prc1.call(ele)
        new<<prc3.call(ele) if !prc1.call(ele)
    end
    new
end

def array_of_array_sum(arr)
    fla=arr.flatten
    fla.inject{|num1,num2| num1+num2}
end

def selective_reverse(str)
    arr=str.split(" ")
    arr.each_with_index {|ele,i| arr[i]=arr[i].reverse if seleted_word(ele)}
    arr.join(" ")
end

def seleted_word(word)
    return false if "aeiouAEIOU".include?(word[0])||"aeiouAEIOU".include?(word[-1])
    true
end

def hash_missing_keys(hash,*arr)
    new_arr=[]
    arr.each do |ele| 
        in_key=false
        hash.each_key {|key|in_key=true if key==ele}
        new_arr<<ele if in_key==false
    end
    new_arr
end
