### Important notes
Rank-up is a bit of a black sheep as far as utils go. In reality, it functions as a pseudo-context, temporarily hijacking the `processinput` function of the `link` context to show it's own little spiel.

Because this spiel is ostensibly the same for every social link, it is far more generalizable and doesn't require a multitude of different cutscenes files to work. We do use `dofile` on these though so that their scope is reset each time a SL is called.

An important thing to note, is that there are two "sections" to the rank up screen (following P3's example), one covering the screen, showing the arcana card and giving a generic speech, and one being a small interruptive "inline" cutscene showing generic information like which SL rank the player advanced to.

In that sense, the rank up system could be considered a bit of an inline cutscene within an inline cutscene.