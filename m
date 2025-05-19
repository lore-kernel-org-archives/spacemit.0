Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB57C267B88
	for <spacemit@lists.linux.dev>; Mon, 19 May 2025 11:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747654740; cv=none; b=ro9UtfJSJYYp5g4idWjvMXDz8VgLZWPlJKp4f6PCKWQ/hY9xaBpGPwBSoiomCZuzVb+MqLUOWyOPpERkYYnzTnKO/kR5EakQSzn7uHMsIB/2sJFaAoIFh70p0L4QxCvGNSMAvvv5RmHqd352cNcqbulIzBdhJE0nQk2a7b8J9cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747654740; c=relaxed/simple;
	bh=TMHxhEkJeLRrFVomKdfUPmg32HngiwuN7Y8XouZQTSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QvoaxQ5BY9rzNqEcdQYJ0O8dl+Iqc0oFTfhwaESm1OCQek7vTWpzZBasjxl5V1HEUxaEE9vybfrkDnC8zPblvPVsomYOBjXUA92UsZJb2IRP+FIGRYVTYvFqf27dmbrFmEvr5aLHswQl25hKoDGQl1bITXnqkzxKc22UBSHpzKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XsU2K3ma; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XsU2K3ma"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e7387d4a336so3501795276.2
        for <spacemit@lists.linux.dev>; Mon, 19 May 2025 04:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747654738; x=1748259538; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jGbkzJ0eqqimJI7DwVKRZ7T05jAEAZTanGLLnplCIgc=;
        b=XsU2K3ma6aWSzqLFJouaVGKis/fC87Pn2Az7Q0DO+87zf9xpwzx2ikyHpyNYFDuaEA
         U7Vo3I5rjQ6tvkjfALidB7d4fosnJnoUBgGpAfqoozqZ5qd03SQe5bxdpMSrUF7tnO0X
         j6faMu6PhkXYt7khQl72sDFmJ4FZp+sK+KULPzuVEuLGkkZJ8g3D5L+9R1ZUQt8GrVsy
         yqn+MM1ZCsUt2Iglr8AZlBWsIdQYfvgBaLkBhnSwJEna30QLCid/5lJqFxC/LtxnHjGo
         +kfa9XT0QhVJRhF87Hkkjd2VpYynVdUD+X9oAKgQmtL84StSH8ofklq45sjwCT7boFB+
         ySpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747654738; x=1748259538;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jGbkzJ0eqqimJI7DwVKRZ7T05jAEAZTanGLLnplCIgc=;
        b=By5k2h8t5fBpc7felqy3e5BG1M/Fh1hbRHZek012Xwtjs1uHt0XCnGirWsOjSyJsVk
         ENPpRSbbvXWK0hYkND2nhCroNvz2TFhRbVGepBy8dyCAdUbzJzYkw0qLDlankOYYOVXz
         fR7kkwBz6lItxJLJVcoTeKgrqIenh6h4xy6TaWjvloSInGP6vFkP2mpHcx/u5lcLqKdm
         1Dwzdht6krrjPLP81g1cvYmX7QBlGSsRsMwowROr9HtxrWrNR3W+f3m9goorVCVNytUl
         6YH6BtiGU4A4xw6A/S1ZrkhnQBxFmbEKECgGj/Z9ASXYGIvH/PwjggvDJuy97waQ/1fP
         Wzsw==
X-Forwarded-Encrypted: i=1; AJvYcCV3jZ0yVsLPQqcS6aB5AutoOYCpPZWQGpF0B9ByhyIPqOvJyrE1dg8nVMAQOQ8aDKDAfYASKcJzXg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwQWwjU8Amoz75U9c6E/JvKMRWXC14A9vv0Ve/lZCdgci1n7bX3
	tc8AJjKiU8fclhTVPDZCIck7CN+PvssRfIMdRPsMiSrowKDAXHAHlUb6+Fb3SMtx3+WnFP3wD5V
	AqpZswvhuUyOpPN81HCuMzRgIcvaUnsBMq0XCuPAFig==
X-Gm-Gg: ASbGnctxf9eVdDwZ2LPU3oP5vI/OFh6oCN+y8LyMpLEEsQlFI6/cu7t0/SxUFZEBoxs
	gEBkYJzSj8O8rhJBvUuuiFcyMqwOc5a3qvlMYV5PhW1l24KnnXZ22slpRYogV1bj8EceylhHagf
	k0jBJq7vujMRf07Qb9QDGP71TbFUvp/EGbhg==
X-Google-Smtp-Source: AGHT+IGEhk9xvOXamJcUf2c7oYgnHzt7/Q6Jc8A16RlKxL4KhnX0gE0Bk6C5w2N1j0qtNoul2O4nnkYi1A17Lqm3muU=
X-Received: by 2002:a05:6902:1547:b0:e7b:9763:6676 with SMTP id
 3f1490d57ef6-e7b97636a60mr5570580276.17.1747654737919; Mon, 19 May 2025
 04:38:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250509-20-k1-sdhci-v3-0-526c35feaa20@gentoo.org>
 <20250509-20-k1-sdhci-v3-2-526c35feaa20@gentoo.org> <4cee9284-8f71-4214-8bc2-48bcb4030e40@intel.com>
 <20250512075631-GYA517379@gentoo>
In-Reply-To: <20250512075631-GYA517379@gentoo>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 19 May 2025 13:38:21 +0200
X-Gm-Features: AX0GCFuvP9LYuHS81_oe6T9DU2l0mF54pVYJmbBwMEiyFEMW40gm2OmA7P10SVI
Message-ID: <CAPDyKFpgCMsaP=CZx210Ov=gTCkez-fwEPMwKTGHrzF51p5_TA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mmc: sdhci-of-k1: add support for SpacemiT K1 SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 12 May 2025 at 09:56, Yixun Lan <dlan@gentoo.org> wrote:
>
> Hi Ulf,
>
> On 09:04 Mon 12 May     , Adrian Hunter wrote:
> > On 09/05/2025 16:22, Yixun Lan wrote:
> > > The SDHCI controller found in SpacemiT K1 SoC features SD,
> > > SDIO, eMMC support, such as:
> > >
> > > - Compatible for 4-bit SDIO 3.0 UHS-I protocol, up to SDR104
> > > - Compatible for 4-bit SD 3.0 UHS-I protocol, up to SDR104
> > > - Compatible for 8bit eMMC5.1, up to HS400
> > >
> > > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> >
> > Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> >
>
> If this isn't too late (as v6.15-rc6 is tagged), I'd like to seek
> the opportunity to queue for v6.16 as no big changes during these
> two review cycles..
>
> I also know people who would expect to have a full rootfs support,
> and this driver is sufficient to bring eMMC up and will make their
> life of development easy..
>
> But if you have different opinion, then I'm totally fine to delay
> it to next merge window, thanks

I have been busy the last week, apoligize for the delay.

I just posted a few minor comments on an earlier version, I didn't see
v3 sorry. Anyway, should be pretty easy to address those comments. If
you manage to send another version within the next couple of days I
can certainly pick this up for v6.16.

Kind regards
Uffe
