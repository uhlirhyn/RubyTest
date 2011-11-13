
# Tree              consume             forward
# ----------------------------------------------------------
# assignTree        
#


module Message

    # Tento modul ma za ukol spravovat prenaseni zprav
    # mezi uzly stromu - kazdy uzel stromu ma totiz 
    # pri volani podstromu moznost obdrzet mimo navratove
    # hodnoty i tzv. message - jde o takove veci jako kdyz
    # se vola "exit" nebo "return" - tam se proposila 
    # hodnota take, ale cil je o vice vrstev vis.
    #
    # Napriklad kdyz mam funkci a v jejim tele je cykl
    # a v cyklu je podminka, tak paklize v tele podminky
    # je "return", tak je potreba prerusit jak provadeni
    # podminky, tak cyklu, tak funkce - prave tento 
    # mechanizmus ma na starost Message.

    # Ohodnoceni zprav
    # ----------------
    # 
    # V zasade tu jsou dva typy zprav:
    #
    # Zpravy, ktere jsou urceny primo tomuto uzlu,
    # tedy takove zpravy, ktere uzel primo zpracuje
    # a rodicovsky uzel jiz dostane pouze vystupni 
    # hodnotu - teto akci odpovida chovani
    # 
    #   :msgConsume
    # 
    # Zpravy, ktere zpusobi preruseni provadeni tela
    # uzlu, ale sam na tyto zpravy neumi reagovat,
    # protoze nejsou pro nej urceny, takze je preposila 
    # rodicovskemu uzlu - to je chovani
    #
    #   :msgForward
    # 

    # Samotne provadeni tela uzlu pak sestava z 3 casti:
    #
    # #1 Start part
    # -------------     
    #   -   kod ktery se musi provest pri startu
    #
    # #2 Listen part
    # -------------- 
    #   -   kod ve kterem se odchytavaji zpravy a jehoz
    #       provadeni je ovlivneno zminovanym chovanim
    #
    # #3 End part
    # -----------
    #   -   kod ktery se musi provest bez ohledu na to
    #       jake chovani odpovida prijate zprave
    #

    # Vstupem je
    #
    # - start part
    # - end part
    # - list dvojic zprava-chovani
    #
    # Vystup je
    #
    # - returnValue
    # - msg

    # Demo
    #
    # MessageListener(

end
