---
layout: post
title: "How I tackled a hard problem in a new language"
author: "Marcus Hammarberg"
date: 2023-03-06 10:54:35
tags:
 - Programming
 - TDD
---

I've just started a lot of new things in my life; programming [Scala](https://www.scala-lang.org/) (and Python), data engineering and a new client.

Luckily the things we have built until now is algorithmically pretty simple and ... what was that? Calculate the what-now temperature?! The *wet-bulb* temperature? Wash your mouth with soap, young man! What on earth is that?!

And you want me to write this in Scala?! This is horrible.

In this blog post I'll walk you through my thinking and application of experience to write one of the most complicated calculations I've ever put into a program, in a programming language that I've never seen 2 months ago.

It actually took me all of 1 hour to get this to work - and still be confident that it works.

<!-- excerpt-end -->

## Wet-bulb temperature

Part of this clients request is to supply some weather data for a certain location and time. And in doing so they also wanted us to extend the weather data with the addition of the *wet-bulb temperature*.

I don't know what that is, nor do I particulary care, but having a clue what it is is always a good idea. Google and Wikipedia to our help:

> The wet-bulb temperature (WBT) is the temperature read by a thermometer covered in water-soaked (water at ambient temperature) cloth (a wet-bulb thermometer) over which air is passed

Haha - where do they even come up with these things. Ok - the next sentence is also interesting:

> At 100% relative humidity, the wet-bulb temperature is equal to the air temperature (dry-bulb temperature); at lower humidity the wet-bulb temperature is lower than dry-bulb temperature because of evaporative cooling.

Sounds like a test case to me.

## How to calculate it

I then search for "calculate wet-bulb temperature" and was presented with a nice calculator at the [OmniCalculator](https://www.omnicalculator.com/physics/wet-bulb).

It further helped me to understand that I only needed two inputs; temperature and relative humitidy in percentage. I had both of them in the data already.

At OmniCalculator I could also try to calculate some of the things. I used my current temperature, just to see:

```text
Temp: 2.53°C
Humidity: 89%
Wet-bulb temperature: 1.479 °C
```

Eeeh - ok. What about something weird from my time in Indonesia:

```text
Temp: 38°C
Humidity: 85%
Wet-bulb temperature: 35.66 °C
```

I still don't get anything, but ok, this is a start.

Look it even has a [How to calculate wet-bulb temperature section](https://www.omnicalculator.com/physics/wet-bulb#how-to-calculate-the-wet-bulb-temperature) let's loo...aaaaaaaaah Mother of GOD!

![Wet bulb calculation](/img/wetbulb-calculation.png)

I have no formal math training and this scared the crap out of me. What even is `arctan`? Raised to the power of 3/2! Is this is a joke?

Ok - now I was really worried, but I pressed on.

Surely I cannot be first in this...

## Previous code?

I actually had some previous code to start from, but it was implemented using Python (that I also don't really know) and Pandas (that makes my knowledge of Python evaporate like a wet cloth... no, wait ... that makes it harder still to understand).

Someone else maybe had written this before? Yes. Yes, they had. I found an [implementation in JavaScript](https://codepen.io/marisamorby/pen/qBmERPZ) that I could look at:

```javascript
//Calculate Wet Bulb
var WB = T * Math.atan(.151977 * Math.sqrt(RH+8.313659) )+Math.atan(T+RH) - Math.atan(RH-1.676331)+ Math.pow(.00391838*RH,1.5)*Math.atan(.023101*RH) -4.686035;
```

Still, very weird. But checking the code helped me a bit:

- They are using the same constants `0.00391838` for example. So it lines up with the OmniCalculator.
- Secondly, they are using `Math.atan` in place of `arctan` and after a quick check I understood that [`arctan` is called `atan` in Scala](https://www.google.com/search?q=scala+arctan&sxsrf=AJOqlzVDu7tExv69y5zZtM02qmu0ueMp0g%3A1678097765122&ei=Zb0FZPKAB7mHxc8P9-a2gAw&oq=scala+ar&gs_lcp=Cgxnd3Mtd2l6LXNlcnAQAxgAMgQIIxAnMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEOgoIABBHENYEELADOgUIABCRAjoLCC4QgAQQxwEQ0QM6BAgAEEM6BwguENQCEEM6CggAEIAEEBQQhwI6BAguEEM6CwguEIAEEMcBEK8BOg4ILhCABBDHARDRAxDUAjoNCC4QrwEQxwEQgAQQCjoFCC4QgAQ6BQgAEIYDOgcIABANEIAEOggIABAIEB4QDToFCCEQoAFKBAhBGABQwwRY_h9glydoBHABeACAAXGIAYEHkgEEMTAuMZgBAKABAcgBCMABAQ&sclient=gws-wiz-serp)

## Implementation - my strategy

Since I don't know the math and am very new to Scala I realized that I needed to create tests to ensure that I got the algorithm correct. I now could check that using the OmniCaclulator as my source of truth.

In Google Sheets I generated a bunch (20+) test cases by creating one column for temp, one for humidity. I then randomized some data within reason:

```text
Temp: =RANDBETWEEN(-20, 40)
Humidity: =RANDBETWEEN(5, 99)
```

See [Summary](#summary) for why I choose those numbers for humidity.

(It might not make sense to caclulate the wet-bulb temp for that cold temperature, but I'm just checking an algorith so I don't care)

I then ran each of these pair of values through the OmniCalculator and added a third column with the result.

I now had a bunch of test cases.

## Implementing in Scala

### First write a test

I knew some Scala and decided to write a test, and for the first try I hard coded the initial values I tried before:

```scala
class WetBulbTempTests extends AnyFunSuite {
  // other code here


  test("WetBulb(Temp=2.53, Humidity=89%) == 1.479") {
    calculateWetBulbTemperature(2.53, 89) should be(1.479)
  }
}
```

and then hard-code the implementation, just to get references and stuff in place:

```scala
object WetBulbTempCalculator {
  // other code here
  def calculateWetBulbTemperature(temperature: Double, humidity: Double): Double = {
    1.479
  }
}
```

After some fiddling with refrence (not really, since IntelliJ is great in helping me) that, unsurprisingly worked.

### Then add many tests

That was Red and Green. Let's add some more tests. In fact, I rewrote that test so that it looked like this:

```scala
test("WetBulb(Temp=2.53, Humidity=89%) == 1.479") {
  calculateWetBulbTemperature(2.53, 89) should be(1.479)
}
```

Now I had one test, but I want many to ensure that I'm doing this correctly. I used my favorite code generator, Google Sheet. Remember I had columns for `Temp`, `Humidity` and `Results`.

1. I added a column before the `Temp`-column where I added `'calculateWetBulbTemperature(`.

    - The `'` is important to make Google Sheet understand that this is a text.
2. I added a new column between the `Temp` and `Humidity`-columns with the this content `',`
3. After the `Humidity`-column I added a new column with this content `') should be(`
4. Finally after the `Results` column I added a new column with : `')`
5. Finally I dragged these values across all rows I had `Temp`, `Humidity` and `Results` for.

Now I copied them into IntelliJ and BOM loads of test cases:

```scala
calculateWetBulbTemperature( 38 ,  5 ) should be( 14.828 )
calculateWetBulbTemperature( 18 ,  92 ) should be( 17.04 )
calculateWetBulbTemperature( -9 ,  84 ) should be( -10.117 )
calculateWetBulbTemperature( 28 ,  65 ) should be( 22.974 )
calculateWetBulbTemperature( -6 ,  53 ) should be( -8.58 )
calculateWetBulbTemperature( -1 ,  63 ) should be( -3.697 )
calculateWetBulbTemperature( -12 ,  70 ) should be( -13.532 )
calculateWetBulbTemperature( 23 ,  98 ) should be( 22.77 )
calculateWetBulbTemperature( -5 ,  49 ) should be( -7.825 )
calculateWetBulbTemperature( 23 ,  31 ) should be( 13.26 )
calculateWetBulbTemperature( 42 ,  53 ) should be( 33.284 )
calculateWetBulbTemperature( 44 ,  27 ) should be( 27.966 )
calculateWetBulbTemperature( 5 ,  58 ) should be( 1.381 )
calculateWetBulbTemperature( -7 ,  60 ) should be( -9.254 )
calculateWetBulbTemperature( -11 ,  16 ) should be( -11.8 )
calculateWetBulbTemperature( -4 ,  96 ) should be( -4.452 )
calculateWetBulbTemperature( 28 ,  81 ) should be( 25.355 )
calculateWetBulbTemperature( 10 ,  48 ) should be( 4.918 )
calculateWetBulbTemperature( 22 ,  92 ) should be( 20.997 )
calculateWetBulbTemperature( 27 ,  92 ) should be( 25.945 )
```

(The spaces was automatically fixed by IntelliJ). Yes, I put all of those checks in one test case. Sue me!

If I could get all of those test cases to work I was now pretty confident that my code would actually be correct, according to the OmniCalculator.

### Draw the rest of the Owl... write the code

The next step is huge, since I didn't see a way to do this in steps.

But after copying the JavaScript code straight into the `calculateWetBulbTemperature` I actaully looked awful. I commented it out and then carefully structured the code into lines, putting each part of the formula on it's own line.

I then checked against the formula from OmniCalculator and before long it looked like this:

```scala
def calculateWetBulbTemperature(temperature: Double, humidity: Double): Double = {
  temperature *
    math.atan(0.151977 * math.pow((humidity + 8.313659), 0.5)) +
    math.atan(temperature + humidity) -
    math.atan(humidity - 1.676331) +
    (0.00391838 * math.pow(humidity, 1.5)) *
    math.atan(0.023101 * humidity) -
    4.686035
}
```

The JavaScript code used the `Math.sqrt` instead of `Math.pow(X, 0,5)` that I have above. I decided to follow the formula as close I could.

#### Optimize for readablility

Let's pause here and just appreciate how much you learn about the code by just writing sensible lines. Compare this code to the first version I got from pasting the code into the editor:

```scala
def calculateWetBulbTemperature(temperature: Double, humidity: Double): Double = {
  temperature * math.atan(0.151977 * math.pow((humidity + 8.313659), 0.5)) + math.atan(temperature + humidity) - math.atan(humidity - 1.676331) + (0.00391838 * math.pow(humidity, 1.5)) * math.atan(0.023101 * humidity) - 4.686035
}
```

It's the same code, just less readable. I always optimize for readability for the next developer (Hey it's probably me) first and if hard-pressed other values (like performance) later.

In this case, the act of formatting the code into it's constitutent parts also helped me understand it.

### Running the tests

I now ran the first test and belive it or not, but it worked. Running all the other tests ... did not. It failed on `17.04`. Now I was in real trouble, because fixing this would be impossible. For me.

Until I saw that the error message said that `17.04` is not equal to `17.03832515115`. A roundning error. I can fix that!

So I updated my implementation to round to 3 decimals, and changed the test data to use roundning to 3 decimals:

```scala
def calculateWetBulbTemperature(temperature: Double, humidity: Double): Double = {
  val wetBulbTemperature = temperature *
    math.atan(0.151977 * math.pow((humidity + 8.313659), 0.5)) +
    math.atan(temperature + humidity) -
    math.atan(humidity - 1.676331) +
    (0.00391838 * math.pow(humidity, 1.5)) *
    math.atan(0.023101 * humidity) -
    4.686035

  BigDecimal(wetBulbTemperature).setScale(3, BigDecimal.RoundingMode.HALF_UP).toDouble
}
```

This part actually ended up taking me about 20 minutes to figure out. Yes, I'm new to this...

## Summary

With that I'm pretty confident that my 25, or so, test cases and this *stolen* implementation would do the trick. If not I can always add more test cases later, but I would be hard-pressed to think that it would fail.

There's cases where OmniSharp doesn't give an answer (for humidity above 99% and below 5% for example), so trust my alogrithm implementation to handle all other cases too.

I was very proud when I was done, but really I just used test to verify my work and translated and re-formatted the code. The code was for the most part stolen.

I hope you found this useful.
