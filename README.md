Better-Than-tit-for-tat
=======================

A small piece of matlab code that aims at reproducing the results of Nowak and Sigmund's Nature 1993 paper [A strategy of win-stay, lose-shift that outperforms tit-for-tat in the Prisoner's Dilemma game](http://abel.math.harvard.edu/archive/153_fall_04/Additional_reading_material/A_strategy_of_winstay_loseshift_that_out_performs_titfortat_in_the_Prisoners_Dilemma_game.pdf.pdf).

The surprising result is that a simple strategy called Pavlov (due to the work of Ivan Pavlov on [classical conditioning](http://en.wikipedia.org/wiki/Classical_conditioning)), fares better population-wise than tit-for-tat, whose success in Axelrod's Tournaments received widespread attention.

The code reproduces the main figure of the paper, which shows Pavlov outperforming tit-for-tat in the long run. The figure that is reproduced is

![Prisoner's Dilemma with pop size of 100](http://jltmtz.github.io/assets/images/pop100.png)

Which shows the dominance of Pavlov for long periods of time.

## The Blog Post

I wrote a [blog post](http://jltmtz.github.io/game%20theory/2014/09/03/better-than-tit-for-that/) analyzing the paper.  The 2 main contributions of the paper, which end up evolving a strategy that outperforms tit-for-tat reside in

* Noting that in the real world it is very hard to follow a deterministic strategy. Therefore, it makes more sense to represent strategies as probabilities
* Demonstrating that it is possible to efficiently simulate large populations and iterations of the Prisoner's Dilemma under these conditions

But of course, check the blog to see the details.
