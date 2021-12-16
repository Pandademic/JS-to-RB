#transpiler v1.0
$input=ARGV[0]
file = File.open("#$input")
data = file.read.split("\n")

data.each { |line|
    #vars 
    line.gsub!("let", "")
    line.gsub!("var","")
    #function keyword
    line.gsub!("function", "def ")
    #brackets
    line.gsub!("{", "")
    line.gsub!("}", "end")
    line.gsub!(")","")
    #statements
    line.gsub!("return", "")
    line.gsub!("console.log(","puts ")
    # loops
    line.gsub!("if","if ")
}

data.delete("")

data.each { |line|
    line[line.length] = "\n"
}

data = data.join("")
$input_noext=$input.delete(".js")
File.open("#$input_noext.transpiled.rb", "w") { |f| f.write data }

