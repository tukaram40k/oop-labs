class Display
    attr_accessor :width, :height, :ppi, :model
    def initialize(w, h, p, m)
        @width = w
        @height = h
        @ppi = p
        @model = m
    end

    def compare_size(m)
        if @width * @height > m.width * m.height
            winner = @model
        else
            winner = m.model
        end
        puts("Comparing size of \"#{@model}\" with \"#{m.model}\".")
        puts("The \"#{winner}\" monitor is bigger.")
    end

    def compare_sharpness(m)
        if @width * @height * @ppi > m.width * m.height * m.ppi
            winner = @model
        else
            winner = m.model
        end
        puts("Comparing sharpness of \"#{@model}\" with \"#{m.model}\".")
        puts("The \"" + winner + "\" monitor is sharper.")
    end

    def compare_with_monitor(m)
        compare_size(m)
        compare_sharpness(m)
        puts(" ")
    end
end