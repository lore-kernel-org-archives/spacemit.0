Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81B526D4F6
	for <spacemit@lists.linux.dev>; Mon, 19 May 2025 11:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747654944; cv=none; b=ldLQfsc2Bgp/4hGNyg+GfggI2Uc3scTFddtHXTCnVI5X8SVSixoijryRQz8iE84s7rq62rgUv6l0m8GUE7aYjlGpTbE2ae9Wdt/OgBz9BKHflgnHt5F9WCmpHzQaCjpNgpWQoDhUjUcgKRIHkFNFQRFX7dO6HJyOeChDLfwPOgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747654944; c=relaxed/simple;
	bh=QpvRVedBrBMy10NIbVtvjYN30CB+eR89OGKIdjlaWu0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DmEbyMhazRIUgNHz7/omyqDLK4NliB9F6u2QEYmxXaaQD/sNacqLgpShehghDmECw5m4AkQphGX0kbY1Qc7QPUPEXBrQ59Py5qV4vK62cocs/IrWrzpuaQgupDGBrwe+02g6l+eheCd6m5agSfh/leDHbUqZJ4NEbBWBtWkuGU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WKa0JOlO; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WKa0JOlO"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e733a6ff491so3874579276.2
        for <spacemit@lists.linux.dev>; Mon, 19 May 2025 04:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747654942; x=1748259742; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xi4QP+tb++uj0FmPaNWal/Va1UBFazasXzcN4zOZKIQ=;
        b=WKa0JOlOI9Kd+G2dsBmwNzOewUYhXXITL0NW/1l6436uB6MXRA/GEXO28+U3UNDNWw
         sfl08D++/l9JG5Fd/b3s+aUMVOr+5rXaaoMtpY+PbgJ3bicggceXljBPevh3CgnQTFaX
         WO1pIf/seqL3djcsbhuUjgYoW7UpiGEmE//pguIukXlHtDaTWqGH+mYhpLStGZAKE2aw
         zXLPFIfEHN80T2M1ljJxlv0fsRVG/Oaj8zr9YR93ml5CG4LDjW/7MwP3WvwHsq/wwk51
         P0AQaxdE4dc2ledEcxIoqXxJv8RM27G6M5HwiPIvpF7FbxbQbnU46Ncr2ZeDHoy+ei6I
         VHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747654942; x=1748259742;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xi4QP+tb++uj0FmPaNWal/Va1UBFazasXzcN4zOZKIQ=;
        b=GzJJudyK2AtaOUyFGQncIYoFOtYluAQ5O9YK6bhJ/2fgctfdTIzYAb/tTCqvWHmH12
         wx7WHHR/lKFcnkZmpUsEAIX5heGrb6PB3IlpBG78Vyy7VtAalSXjRT3pNf0CXM2Wbrq7
         QSnCOc7dJgKIXu77ywFxpFDqZ5XyR1hN4139Ak8bLfI9jp8GGnp4njcxMl3kaoDBcABP
         ucDy3jzvZMKWfte43YiwGHQcBUiJRNgPnzphf2DZhX7T8RQuUKwDf6d3BMWmasMQvQr+
         0He8eA8NdtrEj/MEYA6B1KLHicJbH7Jtbo+drNfT2GsJimT0udNszcDWyxvVJGGVT2qo
         Q6Og==
X-Forwarded-Encrypted: i=1; AJvYcCUvNSTr8fkYTWSK9bcccf7sDD3njWqA6ECHsqiqXVEag/csh+eMW5NPI9lNjcn47y+kpgvTAkmW4w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8Ie4Db/rTQaK7WnlZ0p+aOl6M//pOhfDGm5FBhgRqshhHTrxy
	7pFXFGyr6YXeeMXBuBNKxhlKbPtnc16KfXWbgee6rRuiM6a+t5NhtP/wC99nYVkanYEtVlNji7j
	6ac4QsoPKBofIiHiVGjJ0E4MPEvkTLB+Cl1TooabU2A==
X-Gm-Gg: ASbGnct0t7+v9ilHG0A/6ZCGSkl8HWMZ8OAfCv2d8ZGyyzxEeCtFmBG7KSL0yWvnMdW
	j+skcdJL7OUBEahMufPnyi3/9/VK1M5atKOESjqheTVhv93B+ZL/pzeCLA3LjS9VXdl/jCpVVj3
	SjO/zuhScqGlsfVIpTAR8ZeOlLWMsVOPYpcA==
X-Google-Smtp-Source: AGHT+IFE9YTmql2J1EDYOQW1GURLdO1CuAEE1Qnz48P0JUcDipJN0t2wX+uqL9weWpYsYzTJL1jtg61xH036CqGhtyI=
X-Received: by 2002:a05:6902:10c3:b0:e78:f2a8:a69b with SMTP id
 3f1490d57ef6-e7b6d3dd2dfmr14389495276.17.1747654941775; Mon, 19 May 2025
 04:42:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250509-20-k1-sdhci-v3-0-526c35feaa20@gentoo.org>
 <20250509-20-k1-sdhci-v3-2-526c35feaa20@gentoo.org> <4cee9284-8f71-4214-8bc2-48bcb4030e40@intel.com>
 <20250512075631-GYA517379@gentoo> <CAPDyKFpgCMsaP=CZx210Ov=gTCkez-fwEPMwKTGHrzF51p5_TA@mail.gmail.com>
In-Reply-To: <CAPDyKFpgCMsaP=CZx210Ov=gTCkez-fwEPMwKTGHrzF51p5_TA@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 19 May 2025 13:41:46 +0200
X-Gm-Features: AX0GCFsB9fU8obeLDfkKRVtLEIl-4TRtUdQD79rwTQ1raKLz78xB0D2YGIo8yS4
Message-ID: <CAPDyKFrtH9AeHCiyJLv+F+tdVKJkhxcvcFj+wgqmAqN2CoC0jA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mmc: sdhci-of-k1: add support for SpacemiT K1 SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 May 2025 at 13:38, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Mon, 12 May 2025 at 09:56, Yixun Lan <dlan@gentoo.org> wrote:
> >
> > Hi Ulf,
> >
> > On 09:04 Mon 12 May     , Adrian Hunter wrote:
> > > On 09/05/2025 16:22, Yixun Lan wrote:
> > > > The SDHCI controller found in SpacemiT K1 SoC features SD,
> > > > SDIO, eMMC support, such as:
> > > >
> > > > - Compatible for 4-bit SDIO 3.0 UHS-I protocol, up to SDR104
> > > > - Compatible for 4-bit SD 3.0 UHS-I protocol, up to SDR104
> > > > - Compatible for 8bit eMMC5.1, up to HS400
> > > >
> > > > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > >
> > > Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> > >
> >
> > If this isn't too late (as v6.15-rc6 is tagged), I'd like to seek
> > the opportunity to queue for v6.16 as no big changes during these
> > two review cycles..
> >
> > I also know people who would expect to have a full rootfs support,
> > and this driver is sufficient to bring eMMC up and will make their
> > life of development easy..
> >
> > But if you have different opinion, then I'm totally fine to delay
> > it to next merge window, thanks
>
> I have been busy the last week, apoligize for the delay.
>
> I just posted a few minor comments on an earlier version, I didn't see
> v3 sorry. Anyway, should be pretty easy to address those comments. If
> you manage to send another version within the next couple of days I
> can certainly pick this up for v6.16.

Ehh, nevermind. I don't want to hold this back. I have picked this up for next.

Please address my comments on v2 as patches on top instead.

Kind regards
Uffe
