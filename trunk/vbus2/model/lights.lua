
n_addModel("lights.3ds")

n_setDelay("seq1",1)
n_addCommand("seq1","setVisible","yellow_on",0)
n_addCommand("seq1","setVisible","yellow_off",1)
n_addCommand("seq1","setVisible","red_on",1)
n_addCommand("seq1","setVisible","red_off",0)
n_addCommand("seq1","exec","seq2")

n_setDelay("seq2",5)
n_addCommand("seq2","setVisible","red_on",0)
n_addCommand("seq2","setVisible","red_off",1)
n_addCommand("seq2","setVisible","yellow_on",1)
n_addCommand("seq2","setVisible","yellow_off",0)
n_addCommand("seq2","exec","seq3")

n_setDelay("seq3",1)
n_addCommand("seq3","setVisible","yellow_on",0)
n_addCommand("seq3","setVisible","yellow_off",1)
n_addCommand("seq3","setVisible","green_on",1)
n_addCommand("seq3","setVisible","green_off",0)
n_addCommand("seq3","exec","seq4")

n_setDelay("seq4",5)
n_addCommand("seq4","setVisible","green_on",0)
n_addCommand("seq4","setVisible","green_off",1)
n_addCommand("seq4","setVisible","yellow_on",1)
n_addCommand("seq4","setVisible","yellow_off",0)
n_addCommand("seq4","exec","seq1")



n_addCommand("autostart","exec","seq1")
