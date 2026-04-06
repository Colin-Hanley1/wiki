---
title: "MATH 457∕557 - Homework 8"
type: source
created: 2026-04-06
updated: 2026-04-06
tags: [stochastic-processes, math-457, homework, markov-chains, poisson-process]
sources: [HW8_MATH457_557_Spring_2026.pdf]
---

# MATH 457∕557 - Homework 8

**Course:** MATH 457∕557 — Applied Stochastic Processes, University of Alabama, Spring 2026

## Summary

This homework marks the transition from discrete-time Markov chains to continuous-time stochastic processes, introducing the Poisson process and exponential distribution.

## Key Topics

- **Poisson process and exponential distribution:** The Poisson process N(t) counts events occurring at a constant rate lambda. Inter-arrival times are independent Exp(lambda) random variables. N(t) has a Poisson(lambda t) distribution.
- **Memorylessness property:** The exponential distribution is the unique continuous distribution satisfying P(X > s+t | X > s) = P(X > t). This means "the future is independent of the past given the present" — the continuous-time analog of the Markov property.
- **Radio lifetime problem:** Applying exponential distribution calculations to model the lifetime of electronic components. Computing probabilities of survival beyond a given time.
- **Customer arrivals:** Modeling the number of customers arriving at a store in a given time window using the Poisson distribution. Computing probabilities of specific arrival counts.
- **Fisherman catching fish:** A Poisson process model for fish catches. Computing the probability of catching a certain number of fish in a time interval, the expected waiting time for the next catch, and conditional probabilities.
- **Inter-arrival times:** The times between successive events in a Poisson process are i.i.d. Exp(lambda). This characterization is equivalent to the Poisson counting definition.
- **Conditional expectations given elapsed time:** Using memorylessness to compute expected remaining time given that some time has already elapsed without an event.

## Key Takeaways

1. The Poisson process is the continuous-time analog of a sequence of i.i.d. Bernoulli trials — it is the simplest continuous-time counting process.
2. Memorylessness of the exponential distribution is the key property enabling tractable analysis; it is the continuous-time version of the geometric distribution's memorylessness.
3. The Poisson process has three equivalent definitions: via independent increments, via inter-arrival times, and via the infinitesimal rate.
4. Many real-world phenomena (arrivals, failures, radioactive decay) are well-modeled by Poisson processes when events occur independently at a constant rate.

## See Also

- [[math-457-557-homework-7|MATH 457∕557 - Homework 7]]
- [[math-457-557-homework-9|MATH 457∕557 - Homework 9]]
- [[Poisson Process]]
- [[Markov Chains]]
