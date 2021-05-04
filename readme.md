# Differential Equation for Ecologists 

## Exponential Growth, Logistic Growth, and Lotka-Volterra

#### Taom Sakal, EEMB 120, 2020



Here we'll review what differential equations are along with some common ones in population biology. If you haven't already I recommend watching [this 3B1B video](https://www.youtube.com/watch?v=p_di4Zn4wz4&list=PLZHQObOWTQDNPOjrT6KVlfJuKtYTftqH6&ab_channel=3Blue1Brown) alongside reading this; differential equations are better explained with animation than with text and pictures. 



*Note: This is a first draft. Let me know if you spot any mistakes or if any sections are confusing. I'll be updating these notes as I receive feedback. Equations aren't displaying properly on the [online version](https://taomsakal.github.io/Differential-Equations-for-Ecologists/) right now, but Gauchospace has a pdf version with working equations under week 6. (Though that version won't have animations!)*



## Exponential growth and rules of change

Differential equations describe how nature changes over time. They write out the "rules of the game.''

An example: say we place two hundred bacteria on a empty world. Let's say that bacteria are immortal and will replicate on average once per day. How many bacteria will there be after ten days? A hundred days? A thousand?

This is nothing more than a thought experiment, but it is a thought experiment that we can describe with a **differential equation**. Such an equation tells us, in detail, the rules by which some quantity changes. For our bacteria it looks like below.

<img src="images\exp growth words.png" alt="exp growth words" style="zoom:67%;" />

If we want to be fancy we can write this out in mathematical notation.

![exp growth differential](images\exp growth differential.png)

Same equation and same meaning. We've just given everything shorter names. The variable <img src="https://render.githubusercontent.com/render/math?math=N"> is the total number of bacteria, and <img src="https://render.githubusercontent.com/render/math?math=\frac{dN}{dt}"> is the new bacteria per day. The <img src="https://render.githubusercontent.com/render/math?math=t"> represents our unit of time, which is one day. 

We see that the per-captia rate of growth (the green term) is one. This is because in our world when each bacteria divides we get two daughter cells -- a grand total of one bacteria more than what we started with. 

This single equation describes the rules of our world. Like clockwork each moment this world changes according to this rule, and only this rule. You can almost think of these as the laws of physics for our imaginary world of only bacteria. 

Well, there is one other rule: the **initial condition**. At the beginning of time for this world we plopped two hundred bacteria down.

Now that we have the initial condition and the rules of change we can predict the entire future of our world. Back in the day you'd have to do all the calculations by hand, but now we can plug the differential equation and initial condition into the computer and it will do the hard work for us. Ask the computer to make a graph of how the population size grows and you'll get something like below.

<img src="images\exp growth graph basic.png" alt="image-20201112210021774" style="zoom:80%;" />

The only thing that changes in this world -- and the only thing we keep track of -- is the number of bacteria <img src="https://render.githubusercontent.com/render/math?math=N">. This is what we call a **state variable**. This graph tells us the value of <img src="https://render.githubusercontent.com/render/math?math=N"> at each point in time. You could almost think of this graph as showing the entire course of this world's history.

The per capita rate of growth is a constant and never changes, so we call it a **parameter**. *While the world is running* parameters never change. Now, we could of restarted the world and said that when bacteria reproduce they split into not two daughter cells, but *three*. Then the per-capita rate of new bacteria per day is two instead of one. We could re-run the world with this number instead and get a graph where the population size quickly grows off the chart.

<img src="images\exp growth r equal 2.png" alt="image-20201112210107495" style="zoom:80%;" />

Well, what happens if bacteria split into four? Or what if they only make on average half a new bacteria a day? What if each bacteria die on average once a day? With only the computer we'd have to restart the world and rerun the equations for each of these to see what happens.

The great strength of modern mathematics is that we can study all of these possibilities at once with one weird trick: call the per-capita birth rate <img src="https://render.githubusercontent.com/render/math?math=b">. Now <img src="https://render.githubusercontent.com/render/math?math=b"> can take any value we want, anything between infinity and negative infinity. Now we can write down the exponential growth equation we saw in class.

![exp growth differential births](images\exp growth differential births.png)

We can also allow the initial number of bacteria to vary. This is usually denoted by <img src="https://render.githubusercontent.com/render/math?math=N(0)=N_0">. In differential equations <img src="https://render.githubusercontent.com/render/math?math=N(t)"> is shorthand for "the number of bacteria at time <img src="https://render.githubusercontent.com/render/math?math=t">." So <img src="https://render.githubusercontent.com/render/math?math=N(0)"> is the number of bacteria at time zero. (In differential equations the convention is to say that time starts at zero). We set <img src="https://render.githubusercontent.com/render/math?math=N(0)"> equal to <img src="https://render.githubusercontent.com/render/math?math=N_0">, which is just a parameter like <img src="https://render.githubusercontent.com/render/math?math=b"> which we can replace whatever number we want. The full system, complete with initial conditions, is now written below.

<img src="images\exp growth differential with initial.png" alt="exp growth differential with initial" style="zoom:67%;" />

This equation represents not just one world of bacteria, but *all* possible worlds. Well, at least all possible world with the simple rules of change we've written down. By changing the values of <img src="https://render.githubusercontent.com/render/math?math=r"> and <img src="https://render.githubusercontent.com/render/math?math=N_0"> we can choose any rate of change and initial condition we want. (Though for <img src="https://render.githubusercontent.com/render/math?math=N_0"> negative values don't make biological sense.)    

Note that people usually just write down the differential equation. They'll describe the initial conditions in the text but they won't write it next to the differential equation like we did. For the rest of this text I'm going to follow this and only write out the differential equation. But remember in the back of your mind that each differential equation has a initial condition associated with it.

Below is an animation showing how the graph changes as we tweak the parameter values. 

![exponential growth only births](images\exponential growth only births.gif)

Congratulations. You've just made your first differential equation. It's a sophisticated thought experiment. We've created an imaginary world inspired by our own, laid out the rules of change for the world, and set up some starting conditions. Then we let the world move forward in time, changing according to our rules. It's a **model** of our world. Not near the complexity of the real thing, but perhaps it can tell us something about our reality.

Creating these equations is a creative act. It should feel a little like designing a simulation, or worldbuilding for a novel, or -- for the megalomaniacs among you -- playing God. "In the beginning God created the heavens and the earth... And God said 'Let there be <img src="https://render.githubusercontent.com/render/math?math=N_0"> bacteria.'"

### Death

In our imaginary world bacteria never grow old and never die. They just live and make babies. That's a bit boring -- what's life without danger and mortality? So let's put the fear of death in our bacteria. Let us say that, along with being born, bacteria has a per-capita death rate of <img src="https://render.githubusercontent.com/render/math?math=\mu">. (In class we called this <img src="https://render.githubusercontent.com/render/math?math=d">, but I'm using <img src="https://render.githubusercontent.com/render/math?math=\mu"> so you don't get the death rate confused with the <img src="https://render.githubusercontent.com/render/math?math=d">'s in <img src="https://render.githubusercontent.com/render/math?math=\frac{dN}{dt}"> which mean something different.) The average number of bacteria that die each day is then <img src="https://render.githubusercontent.com/render/math?math=dN">. 

Each day we then have <img src="https://render.githubusercontent.com/render/math?math=bN"> bacteria added and <img src="https://render.githubusercontent.com/render/math?math=\mu%20N"> bacteria taken away. We can then write our differential equation as

![exp growth with death](images\exp growth with death.png)

If we distribute the <img src="https://render.githubusercontent.com/render/math?math=N"> out this becomes 

![exp growth with death simple](images\exp growth with death simple.png)

Now the <img src="https://render.githubusercontent.com/render/math?math=(b-\mu)"> term gives us the net per-capita rate of change. If the birth rate <img src="https://render.githubusercontent.com/render/math?math=b"> is higher than the death rate <img src="https://render.githubusercontent.com/render/math?math=\mu"> then this term is positive and the rate of change of the population <img src="https://render.githubusercontent.com/render/math?math=\frac{dN}{dt}"> is positive, meaning the population grows. On the other hand, If <img src="https://render.githubusercontent.com/render/math?math=\mu"> is higher than <img src="https://render.githubusercontent.com/render/math?math=b"> then <img src="https://render.githubusercontent.com/render/math?math=\frac{dN}{dt}"> is negative the population shrinks. Finally, if births and deaths exactly cancel each other out then <img src="https://render.githubusercontent.com/render/math?math=(b-\mu)"> is zero and <img src="https://render.githubusercontent.com/render/math?math=\frac{dN}{dt}"> becomes zero. Then the population size neither increases or decreases, but stays the same.

Instead of writing out <img src="https://render.githubusercontent.com/render/math?math=(b-\mu)"> ecologists will just call this entire term the effective rate of growth <img src="https://render.githubusercontent.com/render/math?math=r">. This parameter sums up the effects of births and deaths together. 

![exp growth with r](images\exp growth with r.png)

Conveniently this equation looks exactly like our <img src="https://render.githubusercontent.com/render/math?math=\frac{dN}{dt}=bN"> equation, except now instead of <img src="https://render.githubusercontent.com/render/math?math=b"> we have <img src="https://render.githubusercontent.com/render/math?math=r">. When we run this world it acts exactly the same as our previous one. The only difference is our interpretation of what the parameter values mean: net per-capita growth rate instead of per-capita rate of births. (This also means that negative values of the parameter now make biological sense.)

![exp growth negative r](images\exp growth negative r.gif)

This form of the equation, with both births and deaths wrapped up in this <img src="https://render.githubusercontent.com/render/math?math=r"> term, is what biologists are talking about when they talk about a model of **exponential growth**.

### Analytic Solutions

All is well and good, but we still haven't answered are original question: how many bacteria are there after ten days? A hundred? Ten thousand? We could ask the computer, tell it to calculate out the course of the world for however many days and spit back the number of bacteria. This is fine for ten days or even a hundred. But my computer at least can't calculate a thousand days. It takes too long and the numbers get too big.

If the differential equations are simple enough we can write down an **analytic solution**. This is a formula that we can plug numbers in and get out an answer, no computer needed.

If you wave your hand and do some black magic math you can derive that the analytic solution for the exponential growth equation. We won't cover how to do that math because this isn't a math class, but if you did do the math you'd get the equation below. 

<img src="https://render.githubusercontent.com/render/math?math=N(t)=N_0e^{rt}">

Note that this is *not* a differential equation: it doesn't describe any rules of change. Instead it gives an answer. Remember, normally we'd if we wanted to know how many bacteria we get after ten days we would have to calculate out the entire history of our bacteria-world up to day ten. But with an analytic solution we can just plug in our values.  

Let's try this. We originally said we started with <img src="https://render.githubusercontent.com/render/math?math=N_0=200"> bacteria and that bacteria had a growth rate of <img src="https://render.githubusercontent.com/render/math?math=r=1">. Time is measured in days, so we want to figure out what the population at time <img src="https://render.githubusercontent.com/render/math?math=t=10"> is. Then the equation is just

<img src="https://render.githubusercontent.com/render/math?math=N(10)=200e^{1\cdot%2010}">

which comes out to be about 4,405,293 bacteria. We can also calculate one thousand days 

<img src="https://render.githubusercontent.com/render/math?math=N(100)=200e^{1\cdot%20100}">

which is 5,376,234,283,632,271,337,692,923,858,589,087,101,253,320,704 bacteria. If we go up to one thousand days 

<img src="https://render.githubusercontent.com/render/math?math=N(1000)=200e^{1\cdot%201000}">

we get that there are around <img src="https://render.githubusercontent.com/render/math?math=3.94\times%2010^{436}"> bacteria. For reference there are around <img src="https://render.githubusercontent.com/render/math?math=10^{82}"> atoms in the universe. Such is the power of exponential growth.

## Logistic Growth

In our previous examples we let bacteria grow exponentially. In a hundred days we had more bacteria than stars in the sky. In a thousand days we had more bacteria than atoms in the universe. And this is for a small starting population size and a low division rate of once a day. 

Because our universe is not covered in bacteria by now we can safely say something in our model is wrong. Well, not wrong -- the model is just a thought experiment after all. But this thought experiment differs from reality in some way.

A little thought and you will see that the problem is that a bacterial population cannot always grow at one rate. Eventually they will run out of space, or run out of food, or start fighting and eating each other. As more bacteria appear we might expect each bacteria to grow slower and be more likely to die. That is to say, as the number of bacteria <img src="https://render.githubusercontent.com/render/math?math=N"> increases the per-capita growth rate <img src="https://render.githubusercontent.com/render/math?math=r"> decreases.

Let's make a new world then, one where <img src="https://render.githubusercontent.com/render/math?math=r"> decreases as <img src="https://render.githubusercontent.com/render/math?math=N"> increases. Exactly how should <img src="https://render.githubusercontent.com/render/math?math=r"> decrease? Well, let's make things easy on ourselves and say it decreases linearly. In that case once <img src="https://render.githubusercontent.com/render/math?math=N"> gets big enough <img src="https://render.githubusercontent.com/render/math?math=r"> will become zero and the population will stop growing. We might name the population size which does this <img src="https://render.githubusercontent.com/render/math?math=K"> and call it the *carrying capacity*. We might also say that the largest per-capita reproductive rate we can have is <img src="https://render.githubusercontent.com/render/math?math=r_{max}">. Bacteria only grow around this speed when the population size is very small. The values <img src="https://render.githubusercontent.com/render/math?math=r_{max}"> and <img src="https://render.githubusercontent.com/render/math?math=K"> are just parameters, like <img src="https://render.githubusercontent.com/render/math?math=r"> was in the exponential growth model. We can decide on actual values of these before running our world.

A nice function that will do all this for us is shown below. The vertical axis here is the effective per-capita growth rate, or the current per-captia growth rate taking into account the current population size. The vertical axis is *not* the population size.

![Logistic rate of growth](images\Logistic rate of growth.png)

As we wanted, the per-capita growth rate decreases linearly as <img src="https://render.githubusercontent.com/render/math?math=N"> increases. Now we can take our equation for exponential growth and replace the previous static <img src="https://render.githubusercontent.com/render/math?math=r"> with this new dynamic growth rate.

<img src="images\Logistic equation.png" alt="Logistic equation" style="zoom: 67%;" />

This model is called **logistic growth**, and it always makes this S-shaped curve. The graph of this equation looks like below.

![image-20201112211708972](images\Logistic curve basic.png)

Below I've animated it to change the values of <img src="https://render.githubusercontent.com/render/math?math=K">, <img src="https://render.githubusercontent.com/render/math?math=r_{max}">, and <img src="https://render.githubusercontent.com/render/math?math=N_0"> vary. Notice that if the population starts over carrying capacity the growth rate will be negative and bacteria will die until the population returns to carrying capacity.

![logistic growth ani](images\logistic growth ani.gif)

Notice something important: we've never specified *why* the per-capita growth rate decreases with more bacteria. It could be limited space, or competition over food, or any complex combination of factors. All we've said is that <img src="https://render.githubusercontent.com/render/math?math=r"> decreases linearly as <img src="https://render.githubusercontent.com/render/math?math=N"> increases. 

This is a common trick. We could of explicitly added resources and space and whatever else to our model, written down the rules of change for them, and simulated everything. But it is far simpler to keep track of only the number of bacteria and keep everything else in the back of our minds as we design the bacteria's differential equation.

This differential equation also has an analytic solution, but it ain't pretty.

<img src="https://render.githubusercontent.com/render/math?math=N(t)=\frac{K}{1+\left(\frac{K-N_0}{N_0}\right)e^{-r_{max}t}}">

Once equations start becoming more complex than this it is often impossible to find an analytic solution. By impossible I mean you can mathematically prove that such a analytic solution does not exist. In these cases we have no nice formula that gives us an answer; we have to rely on the computer to run our differential equations forward in time.


## But I want more than just bacteria in my world! (Lotka-Volterra Competition)

A world of only bacteria is boring, no matter how the grow. Let's add another organism, say cats. This is as easy as adding a new state variable that tells us the number of cats. Let's call this variable <img src="https://render.githubusercontent.com/render/math?math=C">. (But note that often in two variable models the first species will be called <img src="https://render.githubusercontent.com/render/math?math=N_1"> and the second <img src="https://render.githubusercontent.com/render/math?math=N_2">.)

It would make sense that cats and bacteria both grow logistically, and it would make sense if they don't care about each other. Bacteria can eat whatever junk they find in the dirt, cats can eat tuna, and they never interact. Such a world could be described with the following system.

![logistic cats and bact](images\logistic cats and bact.png)

Here <img src="https://render.githubusercontent.com/render/math?math=r_{max, C}"> is the maximum per-capita growth rate of cats and <img src="https://render.githubusercontent.com/render/math?math=r_{max, N}"> is the maximum rate for bacteria. (Often people won't bother writing the "max" subscript, but we will.) Likewise <img src="https://render.githubusercontent.com/render/math?math=K_c"> and <img src="https://render.githubusercontent.com/render/math?math=K_b"> are their carrying capacities. We would also have some initial number of cats and bacteria: <img src="https://render.githubusercontent.com/render/math?math=C_0"> and <img src="https://render.githubusercontent.com/render/math?math=N_0">. Below is what this system's graph looks like. Notice that we now have two lines, one for cats and one for bacteria. Our world now has two creatures and we can keep track of the number of each.

![image-20201112214910758](images\Logistic cats and bact no interaction.png)

This is fine, but what if we change it so that each species *competes* with the other. Maybe bacteria also like to eat the cat's tuna and so they fight over the same food source. How might we do this? We can pull the same trick we used for logistic growth: say that the bacteria's per-captia growth rate decreases as there are more cats, and say that the cat's per-capita growth rate decreases as there are more bacteria. 

This can be done by subtracting from the rate of growth. It is usually written something like

![logistic cats and bact with comp](images\logistic cats and bact with comp.png)

This might look complex but it's not that bad. Focus on the top equation. Subtracting <img src="https://render.githubusercontent.com/render/math?math=\frac{C}{K_n}"> from the top equation is makes the per-capita growth rate of the bacteria decrease as cats increase. It works the same as how subtracting <img src="https://render.githubusercontent.com/render/math?math=\frac{N}{K_N}"> causes increasing numbers of bacteria to slow down the growth rate. The <img src="https://render.githubusercontent.com/render/math?math=\alpha_{N,C}"> is just a scaling constant which tells us *how much* the cats hurt the bacteria. The larger <img src="https://render.githubusercontent.com/render/math?math=\alpha_{N,C}"> is the more harm cats do. If <img src="https://render.githubusercontent.com/render/math?math=\alpha_{N,C}"> is negative then cats actually help bacteria and increase their growth rate. If <img src="https://render.githubusercontent.com/render/math?math=\alpha_{N,C}"> is zero than cats have no effect on bacteria. 

The same goes for the bottom equation. Often people will have different symbols or conventions for naming the parameters, but as long as you understand the meaning of them you can read the equations. The graph of this system shows that we now can have much more complexity in the dynamics.

![image-20201113103300546](images\Logistic Growth Cats and Bacteria)

An animated version is below.

![logistic growth ani with comp](images\logistic growth ani with comp.gif)

## Phase Spaces 

The concept of a phase space is one of the greatest insights humanity ever had. It is a tool that allows us to think about many problems in terms of *flows*. 

[I'll expand on this section later. But for now the 3 Blue 1 Brown video I mentioned at the beginning introduces phase spaces at time [11:00.](https://youtu.be/p_di4Zn4wz4?t=663)] 

### Isoclines

Isoclines are parts of the phase space where the change of a state variable is the same. For example, a zero isocline for bacteria would be all the points on the phase space where <img src="https://render.githubusercontent.com/render/math?math=\frac{dN}{dt}=0">. (Ie. all combinations of bacteria and cat population sizes where the bacteria has a population growth rate of zero.)

[I'll also expand on this later. For now see [this writeup](http://www.tiem.utk.edu/~gross/bioed/bealsmodules/competition.html), which goes over the competition equations and isoclines.]

## Lotka-Volterra predator prey

Coming Soon<sup>tm</sup>

While you wait, the [Wikipedia article](https://www.wikiwand.com/en/Lotka%E2%80%93Volterra_equations) is surprisingly readable.

---------


