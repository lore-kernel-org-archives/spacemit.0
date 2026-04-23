Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29AD269D18
	for <spacemit@lists.linux.dev>; Thu, 23 Apr 2026 03:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776916019; cv=pass; b=R/Le1TEVX/fQ7OCO7AteCkx+MjZ369a7HoZo+D18KMhDme8TIkN308a17E9bZX/tjWLqtB3uPtJzgJQ0Cs4lIOwdBjMqHozFKVj2wQv0vjrPWvfxBaLYALCJ9EtsIwVKRHZFFxS/ghSiFYX50nspWgMcDjo9Sctk8Fvu0ZyEQWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776916019; c=relaxed/simple;
	bh=WeNkOMzbwUsxL+mQAEdQI1bS1CFi3gSHibm8joPuWt0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kPPx6V3VneKTBApbxKvGHG9v1f2flc9NsKJ9SVu8p9a6L58o+8DQ/c0Bcj7ruNFxeP2EF6cznBpVJ3Pb+mrURbf+GTRF7E+Tw3HdPGDummRjSjHlFupP/nd8oBMniY7uxUOjirD0zEFYpLtRtC4RtLt0qu7sLTt1rBZto0QdnD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bpNLczQG; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bpNLczQG"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b9c01854477so45790366b.0
        for <spacemit@lists.linux.dev>; Wed, 22 Apr 2026 20:46:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776916016; cv=none;
        d=google.com; s=arc-20240605;
        b=Q4rZ5diKBRuGYTvbf/LZryAPM6GlHpRXFHb3fB7g0Hi5U/ca6NAvKnPVw9wTIWCtm9
         UaV925Vo0gk4Wnj6rjYYGenGxJzxexdYVgdbr9GFDiK6HkQIR3ZS2LfAWgbmXfPAPKyL
         X4DBwwwcRjXkVtbQfFKs8ZSSSTiPCPinNBc7WgD2rpeDR1dSriKt41IKutDqX8URvYTv
         Q9TpaAbzpr3TTIAoQ8xpSOoe4dr5wliCGyIh35v8+NAyag59g057wA1Xrigj+sixpF3i
         YMPB53NqnaoUzpJI2Of3pSgGPgbDX4HmxqXQrqp9eKIQ1GZtTeB5C7LTChWPVp1UDDzx
         KDfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c9GSW2Phd9oXEma1/9uB2odB8s4SQeX9sU39sUkX9FY=;
        fh=lRLjTWHsW2MLzPOtwat84p89vY8RVy0kVkjMJqskFDQ=;
        b=Uwe93PEG//igXcREGccGh5Y4zg+1rMtzpXzF3LTayQpolGPMLYSvnJIFaDIOn++l5I
         6o6wFo24I/1shg0bj7ihfRp6Iw8cVKIytLd90tP4nYIAdAW/j5CAY5BZ3Z+t5WEEwg5Q
         xkEcT9oQHO5a/X5SkDuEMDOxMNiJe5phgHLzxm+dtOwtI5O6xwzjkEP+lNDqarzaWkri
         FLiLtfwjORirXfZXnYI0g8+q/jtXrpHK2osl4mty8G5z/AP90BNpeRwNjR6l5O4kHKlv
         EtEid3LfPXgUSgXv1I1MIRPlLGouxOUtCoWgFzbcthj2BpA+hyEuRU32Q07Nj8g9nGEk
         CZkg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776916016; x=1777520816; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9GSW2Phd9oXEma1/9uB2odB8s4SQeX9sU39sUkX9FY=;
        b=bpNLczQG7IQE+SVMQANMZIMVYnKoSUHGfztfXpX0oUCN2pnh31baQvbQhECSfWrU46
         nXz81DHLzNm728MlAqh5QXqyCg6dmqM+pRBSw9hdJ2U2yTmdA7g186gZK2du+cafB5WR
         TlbzEehmbD7nRnJFcS3xbaYiJ0Q66eZsadhD5QnuxnxieX/7i+JFTmwm8S6vsSdMNRpB
         WJbx4+LwtMHNr0+VBgdgUF/KOnGzGrqu+iBu8tc6Ut6We/PT1jl6Jza2ZxtVpdaLv76Q
         z4vYaH2gSiGBELahxn1goCYqMk0+sW8rSFHCQqDbqd6su+E7tFc+QEYyukWRbtja+IKc
         WC7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776916016; x=1777520816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c9GSW2Phd9oXEma1/9uB2odB8s4SQeX9sU39sUkX9FY=;
        b=l/6zXBs61czzMFmikvWmTonRVzUCRSZKvsew4dfNtEQPHnKSFwy0yA1Kr12AyVPV4i
         yHaz63JsUISXDcYgS1cQRQjYmqttoxEOEeEeSopUNBuF4mrjUUl2Z7RYGGEfq1Gnycf+
         o884pXq6yPVqxsAtn3bo7Td9MIuXbH0UaD1ZFuNI3mW5wnjoMjrIfDTS+tJdhzCBwfBA
         3BhdYK9VLK/CHzG4LYwB+VSafWebm79T3sNXYMt6p1EyfKs3vFgrG3P1m9rYwgZusWUi
         HQzvzD3gMkJXzQzDODF0kjB6IsjXX9eTiJpko7beETJ/zBVELnGCTVwqQHRPyzJ70jm0
         U0KQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Jbwd98ytdVxgSWAI07MhOSx4bH/jeH43F90vZK6pfAC5m27yeUo18kYPohR2fFqhYynMp/+LFyw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxKwJ6i34xJkK06Pr9Nlv5qcjIHNTlnZ/ZLgl+uobrcxgE4ET8t
	OcEUsEnFN2nIhRwqT7f7FcPNkSUsWkguxSz/3dmQxIZnxLzAVGtFtVWwCt+lZqByTnj5x8eZYUS
	1uIK7gF563jnQqJ7ABg7mJq6fX7IfsNs=
X-Gm-Gg: AeBDies/7YYWI0F3JM2oCTJI4f8+dfSUGpTPxTsVhb4hpjjgL4sB/3LfIfEafFAQ+fj
	c0O27vHZkE+dNE3Xs53F5ntKTTNFmSoBzFoYmbNWSz0TzqcR6eOApj4d3SWD0Ml/B2ApQjRuaVO
	9hAb8VaFWxC1YkZzVe6AFyS+GAwPWdogpjyRLNgy/rC65QAl0GJlk22NzTcbFwLQ7d4fF43avyY
	j8M82i+hKrNpvc/7HAgdxuEqj0Ulf+nL88X8hyxGHvcJgN7osWnLqgICJfTKj3aYVA+OtrNoZly
	C8ZuI88XvDjzUwA=
X-Received: by 2002:a17:907:1c10:b0:ba8:7b3:176b with SMTP id
 a640c23a62f3a-ba807b322c2mr525199966b.49.1776916015972; Wed, 22 Apr 2026
 20:46:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260119-patchv2-k1-thermal-v3-0-3d82c9ebe8a4@163.com>
 <20260119-patchv2-k1-thermal-v3-3-3d82c9ebe8a4@163.com> <CANAwSgTOmbb+Vzhck1riVaFM89zYLdMe3dn6DRHrc7p+rkR2DQ@mail.gmail.com>
 <DHZM9D696P6G.NVPMN20XXM3H@mailbox.org>
In-Reply-To: <DHZM9D696P6G.NVPMN20XXM3H@mailbox.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 23 Apr 2026 09:16:40 +0530
X-Gm-Features: AQROBzAWkvO9UaeaqqzBdwiPl2IRb1rnMdxCjeOVlETl66PPfZzCcgEwKW1aUrg
Message-ID: <CANAwSgQCOoC7aZWhekqmVS3OTTyzTyDaSxsTsdfMUphxx8vX+Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] riscv: dts: spacemit: Add thermal sensor for K1 SoC
To: Shuwei Wu <shuwei.wu@mailbox.org>
Cc: Shuwei Wu <shuweiwoo@163.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shuwei,

On Wed, 22 Apr 2026 at 16:07, Shuwei Wu <shuwei.wu@mailbox.org> wrote:
>
> Hi Anand,
>
> Thank you for the careful review.
>
> On Wed Apr 22, 2026 at 1:56 PM CST, Anand Moon wrote:
> > Hi Shuwei,
> >
> > On Mon, 19 Jan 2026 at 08:13, Shuwei Wu <shuweiwoo@163.com> wrote:
> >>
> >> Include the Thermal Sensor node in the SpacemiT K1 dtsi
> >> with definitions for registers, clocks, and interrupts.
> >> Additionally, configure thermal zones for the soc, package, gpu, and
> >> clusters to enable temperature monitoring via the thermal framework.
> >>
> >> Signed-off-by: Shuwei Wu <shuweiwoo@163.com>
> >> ---
> >> Changes in v2:
> >> - Update compatible to "spacemit,k1-tsensor"
> >> ---
> >>  arch/riscv/boot/dts/spacemit/k1.dtsi | 101 ++++++++++++++++++++++++++=
+++++++++
> >>  1 file changed, 101 insertions(+)
> >>
> >> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dt=
s/spacemit/k1.dtsi
> >> index 7818ca4979b6..0fe7396ea6e4 100644
> >> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> >> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> >> @@ -338,6 +338,96 @@ osc_32k: clock-32k {
> >>                 };
> >>         };
> >>
> > I feel the thermal zones appear to be configured at significantly
> > higher temperatures
> > compared to the thresholds typically used in commercial-grade and
> > industrial-grade device
> > test environments 1.2 Test Environment
> >
> > [1] https://www.spacemit.com/community/document/info?lang=3Den&nodepath=
=3Dhardware/key_stone/k1/k1_hw/avl_veri_sop.md
>
> The official definition of this temperature range is as follows:
> "The CPU delivers stable and reliable computing power from -40=C2=B0C to =
85=C2=B0C,
> complying with the demanding requirements of industrial applications."
>
> [1] https://www.spacemit.com/community/document/info?lang=3Den&nodepath=
=3Dhardware/key_stone
> /k1/k1_docs/root_overview.md
>
> Therefore, this does not mean that the chip cannot continue to work above
> this temperature.
>
> The datasheet also defines another temperature, the Junction Temperature,
> which represents the chip's temperature limit. Exceeding this temperature
> may permanently damage the chip.
>
> [2] https://www.spacemit.com/community/document/info?lang=3Den&nodepath=
=3Dhardware/key_stone
> /k1/k1_docs/k1_usermanual/4.Electrical_Characteristics.md
>
Ok,
> >
> > Thermal zones should be defined as part of the SBC board design,
> > with the option to integrate PWM-controlled fan support in the future.
>
> These thermal zones describe fixed hardware properties of the K1 SoC itse=
lf,
> and are common for all K1-based boards.
>
Ok,
> And this is also done in Allwinner D1, StarFive JH7110 and some other chi=
ps.
>
Ok thanks.
> >
> > Thanks
> > -Anand
> Best regards,
> Shuwei Wu
Thanks
-Anand
