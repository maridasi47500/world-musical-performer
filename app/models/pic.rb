class Pic < ApplicationRecord
def pic=(link)
name=(0...8).map { (65 + rand(26)).chr }.join+".svg"

x=`(cd ./public/uploads && wget "#{link}" -O #{name})`
write_attribute(:pic, name)
end
def pic
read_attribute(:pic)
end
end
