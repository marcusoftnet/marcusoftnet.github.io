---
layout: post
title: "Grading aggressivity from a transcript using LLMs"
author: "Marcus Hammarberg"
date: 2025-02-28 04:00:00
tags:
 - AI
 - Marcus private
---

Just out of The Meeting, between the president of USA, the President of Ukraine and the American Vice president. Just baffled with what I saw.

After hearing the meta-discussions about what was said by who and how for years now I just realized that we probably will have a discussion about *who* really was aggressive or really just wanted to cooperate.

I realize that this is something that LLM (large language models) are really well suited to solve. So I tried two. This blog post describes what I did.

<!-- excerpt-end -->

## Get the transcript

I first wanted to give the LLM an audio file, but that would not have been clean enough. Instead I checked the transcript at YouTube but realized that it would have been a lot of work to clean it up.

Luckily I found an [article that had the transcript from AP](https://apnews.com/article/trump-zelenskyy-vance-transcript-oval-office-80685f5727628c64065da81525f8f0cf).

I removed the names and called:

- Vice President Vance - Person 1
- President Zelensky - Person 2
- Trump - Person 3

I turned this:

```text
Vance: “Sure. Yeah.”
Zelensky: “OK. So he (Putin) occupied it, our parts, big parts of Ukraine, parts of east and Crimea. So he occupied it in 2014. So during a lot of years — I’m not speaking about just Biden, but those times was (Barack) Obama, then President Obama, then President Trump, then President Biden, now President Trump. And God bless, now, President Trump will stop him. But during 2014, nobody stopped him. He just occupied and took. He killed people. You know what the --"
Trump: “2015?”
```

Into this

```text
PERSON 1: “Sure. Yeah.”
PERSON 2: “OK. So he (Putin) occupied it, our parts, big parts of Ukraine, parts of east and Crimea. So he occupied it in 2014. So during a lot of years — I’m not speaking about just Biden, but those times was (Barack) Obama, then President Obama, then President PERSON 3, then President Biden, now President PERSON 3. And God bless, now, President PERSON 3 will stop him. But during 2014, nobody stopped him. He just occupied and took. He killed people. You know what the --"
PERSON 3: “2015?”
```

## Prompt

I wrote the following simple prompt:

```text
Please grade the attached transcript and  grade each person on aggressive, irony and willingness to cooperate.
```

And after the result I asked it to:

```text
Summarize your findings in a markdown table
```

## Result

I asked Gemini, using the Gemini Advanced Flash 2.0 model, and then Chat GPT and the "Reasoning"-flag. These are the two models I have easiest access to right now.

Below you can find the result from each.

### Gemini

Gemini responded like this:

```markdown
Certainly, let's analyze the transcript and evaluate the individuals involved.

**Overall Assessment**

The conversation is confrontational and tense, marked by a lack of cooperation and understanding. Person 3 displays highly aggressive behavior, while Person 2 exhibits a degree of defensiveness. Person 1 attempts to mediate but ends up escalating the conflict.

**Individual Grades**

**Person 1:**

* **Aggression:** Moderate. While Person 1 starts calmly, they become increasingly assertive and critical of Person 2, particularly towards the end. [cite: 12, 15, 16, 28, 29, 30, 39]
* **Irony:** Low. There is little evidence of irony in Person 1's statements.
* **Willingness to Cooperate:** Moderate. Initially, Person 1 appears willing to engage in a constructive dialogue, but their frustration grows, leading to less cooperative behavior. [cite: 2, 4, 12, 39]

**Person 2:**

* **Aggression:** Low to Moderate. Person 2 becomes defensive and pushes back against accusations, but their overall tone remains relatively calm. [cite: 11, 13, 17, 19, 25, 34, 42]
* **Irony:** Low. There is minimal use of irony in Person 2's responses.
* **Willingness to Cooperate:** Moderate. Person 2 attempts to answer questions and explain their perspective, but the defensiveness hinders cooperation. [cite: 11, 17, 19, 34, 42]

**Person 3:**

* **Aggression:** High. Person 3 consistently interrupts, makes threats, and uses belittling language towards Person 2. [cite: 18, 20, 21, 24, 26, 27, 31, 32, 33, 35, 41, 45, 47, 49, 51]
* **Irony:** Moderate. There are instances of sarcasm and ironic comments from Person 3. [cite: 24, 47, 51]
* **Willingness to Cooperate:** Low. Person 3 dominates the conversation, dismisses Person 2's views, and shows little interest in finding common ground. [cite: 18, 20, 21, 24, 26, 27, 31, 32, 33, 35, 41, 45, 47, 49, 51]

**Key Observations**

* The conversation is largely one-sided, with Person 3 controlling the narrative.
* Person 2 struggles to be heard and is repeatedly cut off.
* Person 1's attempts to mediate are unsuccessful and may have exacerbated the situation.

**Conclusion**

The transcript reveals a tense and unproductive exchange. Person 3's aggressive behavior and unwillingness to cooperate create a hostile environment. Person 2 tries to defend their position but is ultimately silenced. Person 1's efforts to mediate are ineffective.

If you would like a more in-depth analysis of specific sections or aspects of the conversation, feel free to ask!
```

### Chat GPT

Chat GPT responded like this:

```markdown
Below is a brief evaluation of each speaker’s tone and approach during the exchange. (See citeturn0file0 for the transcript details.)

---

**PERSON 1**
• **Aggression (6/10):**
He is assertive and challenges the other speakers—for example, when he criticizes the “chest-thumping” approach and later calls out disrespect in the Oval Office. His language is forceful but remains within the bounds of a debate rather than outright hostility.

• **Irony (5/10):**
PERSON 1 uses a fair amount of sarcasm. His remarks about “pretending that the president’s words mattered more than his actions” and his repeated “just say thank you” come off as both pointed and ironic.

• **Willingness to Cooperate (5/10):**
While he does call for a more “diplomatic” resolution and urges a focus on resolving disagreements rather than media battles, his tone is combative enough that it sometimes limits the sense of genuine collaboration.

---

**PERSON 2**
• **Aggression (4/10):**
PERSON 2 is more defensive and questions the other speakers rather than launching broad attacks. Although he challenges points (e.g., questioning if PERSON 1 has ever seen Ukraine firsthand), his overall tone is less overtly aggressive.

• **Irony (2/10):**
He rarely employs irony. His contributions are mostly straightforward and earnest, without much in the way of sarcastic or ironic commentary.

• **Willingness to Cooperate (3/10):**
Throughout the exchange, PERSON 2 appears resistant and somewhat confrontational—often steering the conversation into a defensive posture. His insistence on making his own points and his reluctance to fully engage with others’ suggestions suggest a relatively low readiness to collaborate.

---

**PERSON 3**
• **Aggression (8/10):**
PERSON 3 is the most combative voice. His statements—warning that the interlocutor is “gambling with World War III” and asserting that “without us, you don’t have any cards”—are highly aggressive and confrontational.

• **Irony (5/10):**
Although his tone is mostly forceful, PERSON 3 does sprinkle in ironic commentary (for instance, the repeated contrasts about who “has the cards”) that carry a mocking, almost cynical edge.

• **Willingness to Cooperate (2/10):**
PERSON 3 is very dismissive and authoritarian. His repeated assertions that others “don’t have the cards” and his refusal to entertain counterarguments reflect a very low willingness to engage in genuine cooperation.

---

This breakdown provides a subjective “grade” for each participant based on their aggressive tone, use of irony, and cooperative stance as evidenced in the transcript.
```

## Summaries

The summary tables looked like this

### Gemini

| Person | Aggression | Irony | Willingness to Cooperate |
|---|---|---|---|
| Person 1 | Moderate | Low | Moderate |
| Person 2 | Low to Moderate | Low | Moderate |
| Person 3 | High | Moderate | Low |

### Chat GPT

| **Speaker** | **Aggression** | **Irony** | **Willingness to Cooperate** |
|-------------|----------------|-----------|------------------------------|
| PERSON 1    | 6/10           | 5/10      | 5/10                         |
| PERSON 2    | 4/10           | 2/10      | 3/10                         |
| PERSON 3    | 8/10           | 5/10      | 2/10                         |

These scores reflect an evaluation based on the tone and approach each person displayed in the transcript.

## Conclusion - Marcus own thoughts

Trump and Vance was much more aggressive, more ironic and less willing to cooperate. Even the AI could hear that. President Zelensky was much less aggressive, less ironic and wanted to cooperate.