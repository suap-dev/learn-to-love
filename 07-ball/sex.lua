function love.load()
    width  = 1920
    height = 1080
    love.window.setMode(width, height, {fullscreen = true, msaa=16})
    wymiary_okna =
        "wymiary okna: "
        .. width
        .. "x"
        .. height

    linia = {        
        0,      2*height/3,
        width,  2*height/3
    }
    
    promien = height/8 

    srodek_kola = {
        width/2,
        linia[2] - promien
    }

    -- poczatek i koniec naszego łuku
    -- względem całego koła
    luk = {
        math.pi/2,              -- na samym dole koła
        math.pi/2 + math.pi/8   -- kawalek dalej
    }

    -- predkosc_ruchu = 2
    predkosc_ruchu = promien / 30
    zmiana_predkosci_ruchu = 0.1
    zmiana_rozmiaru = promien/20    -- updateowane przed każdą klatką

    instrukcja = [[
Instrukcja:
 a - lewo
 d - prawo
 w - zwieksz kulke
 s - zmniejsz kulke
 r - przyspiesz
 f - zwolnij
 q - wyjscie
]]
end

function love.update()
    zmiana_rozmiaru = promien/30
    if love.keyboard.isDown("a") then
        srodek_kola[1] = srodek_kola[1] - predkosc_ruchu
        luk[1] = luk[1] - predkosc_ruchu/promien
        luk[2] = luk[2] - predkosc_ruchu/promien
    end
    if love.keyboard.isDown("d") then
        srodek_kola[1] = srodek_kola[1] + predkosc_ruchu
        luk[1] = luk[1] + predkosc_ruchu/promien
        luk[2] = luk[2] + predkosc_ruchu/promien
    end
    if love.keyboard.isDown("w") then
        promien = promien + zmiana_rozmiaru
        srodek_kola[2] = srodek_kola[2] - zmiana_rozmiaru
    end
    if love.keyboard.isDown("s") and promien > 1 then
        promien = promien - zmiana_rozmiaru
        srodek_kola[2] = srodek_kola[2] + zmiana_rozmiaru
    end
    if love.keyboard.isDown("r") and predkosc_ruchu < (width / 50) then
        predkosc_ruchu = predkosc_ruchu + zmiana_predkosci_ruchu
    end
    if love.keyboard.isDown("f") and predkosc_ruchu > zmiana_predkosci_ruchu then
        predkosc_ruchu = predkosc_ruchu - zmiana_predkosci_ruchu
    end
    if love.keyboard.isDown("q") then
        love.event.quit()
    end
end

function love.draw()
    love.graphics.print(wymiary_okna, 10, 10)
    love.graphics.print("predkosc ruchu: " .. predkosc_ruchu, 10, 25 )
    love.graphics.print(instrukcja, 10, 50)
    
    love.graphics.line(linia)
    love.graphics.circle(
        "line", srodek_kola[1], srodek_kola[2], promien
    )
    love.graphics.arc(
        "line", srodek_kola[1], srodek_kola[2], promien,
        luk[1], luk[2]
    )
end