
I frequently find myself comparing issues in the legal system with issues in the law.  To a large extent, statutory law -- the laws written down by your congressional representatives -- faces many of the same issues code does.  It needs to be clear, it must do what the drafters intend for it to do, and it must be concise.

What follows are a few thoughts, informed by the last two years.  I expect to write more about the intersection of programming and the law in the coming months.

### Clear

Programing languages need to be free from ambiguity.  Good legislation also needs to be free from any ambiguity.  Fortunately for programmers, programming languages have [specifications](http://perl6.org/specification/) and test suites which ensure any compiler or interpreter should produce the same output given a common input.  Unfortunately, spoken languages were built over thousands of years, and have a variety of nuanced phrases which make defining meaning difficult.

The language of the law has gone through a variety of transformations over the years.  Notably, the recent shift in the past thirty-or-so years of preferring writing devoid of legalese.

There are a few systems lawyers employ to make their writing as clear as possible.  Definitions sections make the interpretation of statutes and contracts easier by clarifying or narrowing the definitions of words.  We also use 'canons of construction' to interpret ambiguous language.

These systems tend to assist in creating unambiguous language, but they have their limits.  What good, for example, is a canon of construction if the drafter was unaware of the canon.  While these canons attempt to replicate the common usage of the English language, they tend to represent a subset of the English language.  For example, the 'presumption of consistent usage & meaningful variation' may be at odds with a writer who uses multiple synonymous nouns to refer to one concept with the intent to keep the reader interested (rather than differentiate the nouns.)

### Intentional

While clarity is something programming excels at over legal drafting, both programers and drafters must face the problem of ensuring their intentions are manifested in their writings.

Here, legislators may have a leg up on coding.  The Judiciary, when faced with an ambiguous word or phrase, may consult the legislative history of a given law.  The ambiguity may be clarified by looking at the purpose of the law.  However, this piece of statutory interpretation -- looking at the non-binding history of a law --  has its proponents and opponents.  The opponents tend to have an idealistic view about the ability for language to be unambiguous.  The proponents have the ability to rewrite or write-in judge made law, with the potential of circumventing the American tripartite system of governance.

Programmers, knowing that there will only be a machine analyzing their code, must ensure their code does what it is intended to do.  The testing methodologies incorporated into the workflows of many programmers lives could be an interesting point of comparison to the current drafting process in Congress.

### Concise

This is the biggie, and it's what prompted me to write down some of these thoughts tonight.  I was listening to a professor shrug off the broad granting of power Congress gives to administrative agencies.  Agencies are formed through statutes granting them the power to perform a variety of governmental actions.  They're formed for a variety of reasons, but they can only do what the congress enables them to do within the statute.  Be it laziness, uncertainty, or future-proofing the statutes, agencies tend to be granted a great deal of power -- almost always more than is absolutely necessary to run that agency.  There is academic interest in the problems with broad grants of power, but no sign of real change.

Reflecting on my own coding hobby, I too tend to grant too much permission.  Be it in literall chmod permissions, excessive global variables, or the modularity of my code, I write in a far too broad fashion.  I suspect the college trained programmers in the audience are more likely to be concise than I, but I suspect (and have seen in tons of open source code) many educated individuals code like I do.  Here, there is another area where programmers and lawyers could learn together.

The need for concise language goes beyond issues of scope, as well -- speed, efficiency, and clarity can be both helped and harmed by the correct use of concise language in both realms.  But that, as they say, is a story for another day.
