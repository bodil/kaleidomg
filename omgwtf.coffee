$(document).ready ->
    ctx = (document.getElementById "canvas").getContext "2d"

    box = (r, d) ->
        r /= 2
        ctx.beginPath()
        angle = (rad) ->
            ctx.lineTo (r * Math.sin rad + d), (r * Math.cos rad + d)
        angle -((Math.PI / 4) * 3)
        angle -(Math.PI / 4)
        angle Math.PI / 4
        angle (Math.PI / 4) * 3
        ctx.closePath()
        ctx.stroke()
    circle = (x, y, r, amt, tweak) ->
        d = -Math.PI
        ct = 0
        step = (Math.PI * 2) / amt
        while d < Math.PI
            [dx, dy] = [
                x + r * Math.sin d
                y + r * Math.cos d
            ]
            ctx.save()
            ctx.lineWidth = 2
            ctx.strokeStyle = if ct % 2 then "black" else "white"
            ctx.translate dx, dy
            box 20, d + tweak
            ctx.restore()
            d += step
            ct++

    wtf = (tweak) ->
        ctx.save()
        ctx.clearRect 0, 0, 400, 400
        circle 200, 200, 170, 60, tweak
        circle 200, 200, 135, 48, -tweak
        circle 200, 200, 100, 36, tweak
        circle 200, 200, 65, 24, -tweak
        ctx.restore()

    animate = ->
        tweak = 0
        frame = ->
            wtf tweak
            tweak += Math.PI / 30
            if tweak > Math.PI then tweak -= Math.PI * 2
        setInterval frame, 60
    animate()
