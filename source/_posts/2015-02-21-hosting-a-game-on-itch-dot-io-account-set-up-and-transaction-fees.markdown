---
layout: post
title: "Hosting a game on itch.io: account set up and transaction fees"
date: 2015-02-21 11:25:39 -0600
comments: true
categories:
- tools
---

## What is itch.io?

According to the [faq](http://itch.io/about/faq), itch.io is a service for handling hosting and selling individual and bundled games, soundtracks, art, etc.  It has some handy features to [manage and track gamejams](http://itch.io/jams) as well.  It was [created](http://leafo.net/posts/introducing_itchio.html) by [@moonscript](https://twitter.com/moonscript).

In this post I'll look at the fees charged itch.io and the supported payment platforms and how to set up an account.  The [faq](http://itch.io/about/faq) covers these and other topics in more detail so make sure you peruse it.

<!--more-->

## Fees

There are a few payment options available on itch.io.  Here's how the fees break down.  I'll use the example of selling $5.00 and $2.00 games to show the revenue you could expect to receive after taking out the various fees.

It's worth noting that, at of the time of this post, **itch.io is not collecting fees**.  I'll still present the revenue calculations with the itch.io slice factored in, but itch.io won't start collecting a percentage of the game price until a later, unspecified date.

Itch.io currently provides three options for handling payments: [Amazon Payments](http://payments.amazon.com/), [PayPal](http://www.paypal.com/) and [Stripe](http://stripe.com/).

### Supported currencies

PayPal appears to be the least restrictive in terms of the countries and currencies it handles.  Stripe handles U.S., Canada, U.K., Australia, and Ireland.  Stripe has an [open beta for some European countries](https://support.stripe.com/questions/what-countries-does-stripe-support). Amazon Payments only handles U.S. currencies.  Non-U.S. purchases through Amazon Payments are [only allowed via credit card transactions, and there's an additional charge](https://payments.amazon.com/sdui/sdui/about?nodeId%3D77175#aspd_cost).

### Fee structure

The fees for [Stripe](https://stripe.com/us/pricing) and [PayPal](https://www.paypal.com/webapps/mpp/merchant-fees) work similarly, assuming you're processing less than $3,000 monthly.  There's a base fee of $0.30 + 2.9% for each transaction.  Amazon Payments works similarly if the price is above $10.00, but below $9.99, there's a $0.05 surcharge + 5%.

Itch.io will charge a 10% fee for each transaction, but currently this charge is waived.

### Down and dirty

So let's do the math for the two example prices I mentioned above:

For Stripe and PayPal the numbers look like this:

    $5 - ($5 * 0.1) - $0.30 - ($5 * 0.029) = $4.055

    $2 - ($2 * 0.1) - $0.30 - ($2 * 0.029) = $1.442

I'm not sure how the rounding works.  I will have to reach out to itch.io and the payment handling services to see how they handle tenths of a cent.

For Amazon Payments the numbers look like:

    $5 - ($5 * 0.1) - $0.05 - ($5 * 0.05) = $4.20

    $2 - ($2 * 0.1) - $0.05 - ($2 * 0.05) = $1.65

Keep in mind, for each of these calculations you'll get an extra $0.50 and $0.20, respectively, since the itch.io surcharge is not in effect.

That's how the numbers breakdown for these price points.  I'm not planning on charging money right now, but it's nice to see the real amounts you can expect to see.  I am really bad at reasoning about these sorts of percentages in the abstract.

## Signing up

[Registering for itch.io](http://itch.io/register) was easy.  I created an account and checked `I'm interested in distributing games on itch.io`.  That's it.  It's very straightforward.

Now I have a relatively spartan page at [zerosalife.itch.io](http://zerosalife.itch.io/).

## The next step

I'd like to brand and personalize my itch.io page, but I don't think that the time for that is now.  Somewhere down the road, I'll look into itch.io's powerful customization tools.

The obvious clear thing to do with my new itch.io account is to release a game.  Tune in next week for exactly that!
