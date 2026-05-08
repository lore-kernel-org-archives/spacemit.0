Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734AB37647B
	for <spacemit@lists.linux.dev>; Fri,  8 May 2026 07:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778225904; cv=pass; b=GuEYWELZBHpJEnAowrmgs5jrONdE5SHPdfvzP6s1eRR3rcm6CF2p07wdkJbs37p++PM0tpsVJl7c5adDPrxJF9aVgZCQ1x46zvu+R+uruRnSP+1Ri8hZn7RgeLQUFnNLy8BWcLCo6wfbH2JK64F0tgN4htIeEO6dTnYyZVMw50Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778225904; c=relaxed/simple;
	bh=6aATJC1nNlunUfoHj/tEG6tUZGVIMEVHXuhSNjICmY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dqQxolQHBxPZB7wB82PaI2UNUtpS/tO3w2SQ+WOXpzWvvzlqCPN6G168rT+sh5l2RWvePA0Rc5lxmAm+J2Aj7yPfxFdrOlYbafb8TUaaRkqdLaz30gknmCAgaWYq8MehcKEA30Z4N7nqh6W+U+lMe0thAxVkr4RhIzeoy6VwnEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tc0E2df5; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tc0E2df5"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-678a16429c6so2484026a12.1
        for <spacemit@lists.linux.dev>; Fri, 08 May 2026 00:38:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778225902; cv=none;
        d=google.com; s=arc-20240605;
        b=WeMcHDGIHdcCdaivc0hETIofqLgXoffe01hOckyE85nA4Li0BINQqwRigCUsiFTDH9
         e+X8OqVlrk8OWyyHoknqHmKa08MrdgNRAiEBWBLpTBJ5AHQ1KVz+r4IYQwALzqq0C48W
         35f8cehSYetN8Ad07dNA91SJ/kvo4K6f6aWpuncvS/0qFuOFEW/tvpmC0p560vYqc7Hl
         xyUJBRK5JsT52oi+yyjJlwxxrzoE2B9TM1vcT6Lxgc2GytT1Co0GRscO+FPUlpDAaBXf
         F1F03qw6DwFxQz5gRapI8h6muBDpnY1jjiBBVC7Ai9ibxcXbcoM8J+3dnacTvj25l2UX
         sRLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wnUmQt9B21/QPu1v+NfQ7ZTcUk5k+/bIm65L2mzXgNg=;
        fh=ZvUCXDUVeFQcytOH+wY5/xDQ7QASDhi8N7PnHygeV1U=;
        b=fGj14UZL6ThdTrV2WVet/NhTqIXsD/QgbiICt+5Mu3BrKvM06LeEiZYQ3muWyLBM2s
         5X0Ub3HaiQCry6BugWvqHI28IRwrGf1he5JWizvb7LaT2Vlw3FXTMLzyxsHf36Zl820Y
         37o+SyDLsTvU12YvGJyipJ/W1kI6Qz/5KcsIXfkkCjOxhkkEyi84LGKKPx1NyP+Gkq91
         9bB9clVj3TLi5gGg44d+AjAUMEBVyqe7mI+5ctdufWgQKlql9YwJxUrpgJsst0WfP+5l
         KD1M2HIOPTuSIpmrcoeJvQYaR8EobTjmgC+ivU64PuJcxxY+dFHNgkt/hj97R28hBJU2
         XZVA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778225902; x=1778830702; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wnUmQt9B21/QPu1v+NfQ7ZTcUk5k+/bIm65L2mzXgNg=;
        b=Tc0E2df5vXC/y+ANdnUW10PIu1JilUco8QNzJFHFLEJsFDVjHzDCGXstMcLzvJGEwH
         q7NgjtHJraexx8XHHhA6X+3hYH+KAf+R2pPhPafM03TPHmMC6KOJIQs5mIVhMFxZf23g
         igMlgMRvZayvJZgsGD3Fidf/eQKCkZYVdWi4BRYWKkLq1r1pJVsfnPdTl3R88cyBpz+Z
         sDKDWG5WWVeS7qrcm3q31ToCd7p0Lb8n32KegjWX6VrjOhvfXHtRLG6xEXOTb3affiZW
         BmalZEKj5Zv4cr0zanK0OnkqrAzmA3cIKOSe277nSzUHEszEXblVmV2AbFyLvaO3Q05j
         aOxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778225902; x=1778830702;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wnUmQt9B21/QPu1v+NfQ7ZTcUk5k+/bIm65L2mzXgNg=;
        b=UKj8oPz4OZKtP0yoOesRqcQXPKUZjJfZrwfLVQBKQ8RrBlbI+drItQoX/Tp56ve7W1
         IGHFr7usD3V7VJCHvyE7GbEVWEpibOLD8ucCmIGjLxOSh78hNdmWIprjF9VI4FBlbaoe
         NvLUMr+OFXGJ95tZI6z1qJQwUonVBYKXqJgvqWQsjwlJJQPiFqfKmTuX/2RyM6LER59H
         XUjDODVfEmG0e2vxDLMdaC9BJoxRnBHb7gAD0IhhrgaTKcCe6C8cY9D/z7dgvdxHSb8p
         Lqo6qz66YMFs7AYOU69ySKHN1Tkhw1c4Sy0atKbvI8wf1UBquid26cA234VfGUoDTQdD
         zHPg==
X-Forwarded-Encrypted: i=1; AFNElJ8Lw3QvcvyPxuh4oUpuUDeT8gvyLAmokM3X9w4fL4p0pebFuRRVzlDFTV6QfI5vZAJRsAMRYrZzXQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxwKeZ5xlmM/Vc+IDcfOjIin47DnKyB7fg5IO3CYmFDKfZuL/v1
	PZSyUhpoSnD4dGaJU039imVWOsOeSOfG7JutmSOb4mQeiJ9Kt0QA7doe+e6Bd5KC+8PT6A4zAjV
	lQFp5CFrlrwla1CUzeH2EwqxzR6n1HtU=
X-Gm-Gg: Acq92OGd92bnOTMaqprMzp2WQNn3X7/ttVAe2kT/5KrnxloEDkkSzdroSh3N8XjfTsp
	14GosEnHDnjW/eLImjDBGASTO1qM4WF4QPEZyj/aEe9yyr838igAkJuQl+kaTUL5vPn+3S6PbTM
	XQv9KsIN1NOUxsGvodJADuAQ9qTMhnZ6+Ft+FMyIvxdn7aphOS8TqGrLmXh46T9M25htg3MY+Sa
	fZ0o+Nid6+pNURnO1M6sQbuXyCdWGzvbabl2atzq2SC8rZZ39fssLwMDTjYASUjXQMZHiU+oXfj
	ljXu
X-Received: by 2002:a05:6402:4506:b0:676:5872:c686 with SMTP id
 4fb4d7f45d1cf-67e0dbfa7cfmr2991549a12.2.1778225901513; Fri, 08 May 2026
 00:38:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260502051906.8160-4-linux.amoon@gmail.com> <20260507065002.1883127-1-amadeus@jmu.edu.cn>
In-Reply-To: <20260507065002.1883127-1-amadeus@jmu.edu.cn>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 8 May 2026 13:08:02 +0530
X-Gm-Features: AVHnY4Kd-iqq5DoAuuzBN_ypRWIrf5NA0GuLPJKYH14dL74okotkJ850fDUYxoU
Message-ID: <CANAwSgTyGjGOMaEbwYeu7TX51OtSE0E2T0-ftsvr513J6ANbvA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] riscv: dts: spacemit: k1-bananapi-f3: Correct USB
 hub power hierarchy
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, dlan@kernel.org, gaohan@iscas.ac.cn, 
	huang.ze@linux.dev, krzk+dt@kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, pjw@kernel.org, 
	robh@kernel.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Chukun,

Thanks for your  review comments.

On Thu, 7 May 2026 at 12:20, Chukun Pan <amadeus@jmu.edu.cn> wrote:
>
> Hi,
>
> >       usb3_hub_5v: regulator-usb3-hub-5v {
> >               compatible = "regulator-fixed";
> > -             regulator-name = "USB30_HUB";
> > +             regulator-name = "VCC5V0_HUB";
>
> Suggested changes:
>         vcc5v0_hub: regulator-vcc5v0-hub {
>                 compatible = "regulator-fixed";
>                 regulator-name = "vcc5v0_hub";
>
Ok will update this if there is a positive response.
> >               regulator-min-microvolt = <5000000>;
> >               regulator-max-microvolt = <5000000>;
> > +             regulator-always-on;
>
> Why always on?
The driver side does not manage enabling / disabling this regulator.
>
> > @@ -361,6 +362,7 @@ &usb_dwc3 {
> >       dr_mode = "host";
> >       #address-cells = <1>;
> >       #size-cells = <0>;
> > +     vbus-supply = <&usb3_hub_5v>;
> >       status = "okay";
>
> This is incorrect. See the previous reply.

I replied in the previous email.

Thanks
-Anand
