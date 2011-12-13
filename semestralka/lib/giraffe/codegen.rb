module Giraffe

    class Codegen 

        def generate(bytecode, file)

            File.open(file, "wb") do
                |f|
                counter = 0;
                for byte in bytecode do
                    f.write(byte.value.chr)
                    counter += 1
                end
            end

        end
    end
end
