=begin
JSRB transpiler v1.0.0 (c) Atharv Gupte (GH: @Pandademic)
----- Begin License
MIT License

Copyright (c) 2021 Pandademic(Atharv Gupte)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
---- End License
Github repo: https://git.io/JD6Xz
=end
$input=ARGV[0]
# File to open 
file = File.open("#$input")
data = file.read.split("\n")

data.each { |line|
    # Main loop
    #-----
    #vars 
    line.gsub!("let", "")
    line.gsub!("var","")
    #semicolon
    line.gsub!(";","")
    #function keyword
    line.gsub!("function", "def ")
    #brackets
    line.gsub!("{", "")
    line.gsub!("}", "end")
    line.gsub!(")","")
    #statements
    line.gsub!("console.log(","puts ")
    # loops
    line.gsub!("if","if ")
}

data.delete("")

data.each { |line|
    line[line.length] = "\n"
}

data = data.join("")
File.open("output.rb", "w") { |f| f.write data }

