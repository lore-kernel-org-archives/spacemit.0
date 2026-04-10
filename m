Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE22D377EC7
	for <spacemit@lists.linux.dev>; Fri, 10 Apr 2026 22:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775859605; cv=none; b=mYUsUBhy6RWSbUu4Ja07+F6VvRFTKEwbRLi0UY05KomHEJCjsOhIwjWlwpWCvpWt1cC5rRAnn0EL26JAqMeOFQUuOcKwwsRaYE7AN00eSjuTrARxbo5HdH4VfhzEg108DJr1UQYRJMZYsaNPckfsk+XmB/aZNtCtH0rUXtdXmBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775859605; c=relaxed/simple;
	bh=CfBrxZMHYu+JoYASsbBXZuZ5K6ehZtv5W3IhWdspxyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N/8spB3J078lGT+cKuic8gFw8V3HDBdCJOPCzvyGXyfBTUEs8t6feQ8XA8g9pgI8/U7R03ukelRAChivt9q7M5h0uO6j+l1tl+u+Hqj2ZV2A4XtjsT5k8ANu3XPMSufeVb02sX0cFe6Jn9Qnj2xmsPplIzDYun1skXUl3IU5UUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g06rx4q5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g06rx4q5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61A6EC2BCB3
	for <spacemit@lists.linux.dev>; Fri, 10 Apr 2026 22:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775859605;
	bh=CfBrxZMHYu+JoYASsbBXZuZ5K6ehZtv5W3IhWdspxyw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=g06rx4q589ILyCvwnQmkQeiuRueotxmE6556VBmrLHVTnDJtrsBGu1hbmJ0Ia9u5j
	 7sjWRgo/SlWng+ljVRrgxYjnqtwH3n8p1AKapCASkQQ9M+c9O7lbptbY1bn5fn0osJ
	 qKGmWulAfW/hq2gnnx3W5ph0W8NBpH65Ff8vyhfkaq4gflKZ5/VmaH6OlMG4EcfknU
	 MyFJaOurXtMlKR6ChVuh3kl8spxU61HZEDHNnoWkZR0HEs2zLfgxkPYjaX+QgcS2Lt
	 c9cn2MwB4wQiXu9yOCPkW8J2gev5Xqwsi+z8x7w4YOPoMvxpu+BxSPLHtks4qMc3nB
	 4tMwm2zQPfkow==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-79495b1aaa7so26711857b3.1
        for <spacemit@lists.linux.dev>; Fri, 10 Apr 2026 15:20:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUTkXj/OvoET9DXTQbTOLlpVgUN6mZR8RZJgv7iJQ4cWciZ4Eb7sbqhbUNHb3SrxlSUmSUdJGoaiQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzwCQ2K8eZpBMeT1aAMEjc/bVfCuFv7C85SljEdRf4u7a0sf4Ni
	sQHp3LDzHLFArg/mNsJF527tgowYDpSWAoaleAN/DLCXZhbOlp+vor3zt/hfI39VAMFdHOSgMhY
	PMOAiPM3Izo6BcemEk72X3iT3qAHujDA=
X-Received: by 2002:a05:690c:e653:b0:79a:5508:5831 with SMTP id
 00721157ae682-7af6f909682mr40933627b3.20.1775859604680; Fri, 10 Apr 2026
 15:20:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260403123040-KYC0145825@kernel.org>
In-Reply-To: <20260403123040-KYC0145825@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 11 Apr 2026 00:19:53 +0200
X-Gmail-Original-Message-ID: <CAD++jLkQfUwhvDOCkhK2NtRyXrb6y9rwpDckR6h0G3+dzYwW3A@mail.gmail.com>
X-Gm-Features: AQROBzCuH10sUCp1pWYa5W_5SjPJMPxeW_gppQj455tR-xLUJ3z2UWA4xLhfFaI
Message-ID: <CAD++jLkQfUwhvDOCkhK2NtRyXrb6y9rwpDckR6h0G3+dzYwW3A@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V SpacemiT Devicetrees for v7.1
To: Yixun Lan <dlan@kernel.org>
Cc: soc@kernel.org, Yixun Lan <dlan@gentoo.org>, Arnd Bergmann <arnd@arndb.de>, 
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yixun,

I looked into this pull request.

I'm sorry if I do stupid mistakes in handling it, I'm new to maintaining
the SoC tree. Bear with me.

On Fri, Apr 3, 2026 at 2:32=E2=80=AFPM Yixun Lan <dlan@kernel.org> wrote:

> Aurelien Jarno (7):
>       riscv: dts: spacemit: drop incorrect pinctrl for combo PHY
(...)
> Yixun Lan (9):
>       riscv: dts: spacemit: pcie: fix missing power regulator

[Fixes]
fatal: Not a valid object name linus/master
Commit: c68360c0d636 ("riscv: dts: spacemit: drop incorrect pinctrl
for combo PHY")
    Fixes tag: Fixes: 0be016a4b5d1b9 ("riscv: dts: spacemit: PCIe and
PHY-related updates")
    Has these problem(s):
        - Inspect: Target SHA is not ancestor of Linus' master branch,
which means it is fixing commit in your branch
fatal: Not a valid object name linus/master
Commit: 8a9071299dec ("riscv: dts: spacemit: pcie: fix missing power regula=
tor")
    Fixes tag: Fixes: 0be016a4b5d1 ("riscv: dts: spacemit: PCIe and
PHY-related updates")
    Has these problem(s):
        - Inspect: Target SHA is not ancestor of Linus' master branch,
which means it is fixing commit in your branch

So this means you introduced bugs and fix them in the same pull request?

Why?

The practice is to squash such fixes into the offending patches when
presenting pull requests. But I went ahead anyway, trying to not be so
picky. (The commits are there, in your branch indeed.)

- Checked that it was in linux-next OK
- built DTBS OK

Pulled in, thanks.

Yours,
Linus Walleij
