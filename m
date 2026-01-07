Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C46C322B69
	for <spacemit@lists.linux.dev>; Wed,  7 Jan 2026 14:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767794971; cv=none; b=Ep+mOMsJR861Ova4fE/u5PjB3214/Lg89aDpXXWe3iZ150/aTERN828iH6vCZ6sBh6iD0Q5XaBTkiGkU/x+Zwnc/pRXmucbsxwzL3L+K8mQFZyqSK0oqk3cfiSPSMI4tl1NziK3axyIKIgb4bhW9m5xQsSGeRSYKFbCu0FyS4Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767794971; c=relaxed/simple;
	bh=o+CRaV666z5N98g0zrWQ+oTRAL2ghObwdkDLLmds+mw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iSUSzJlrXPOjrWUvpFooXkFZYCmjqxkrZA6dAX0sRZT26hyYfZVEcFZ8uhPNbBFGFNf/0fBfDQ9gr3cHC7hdgz5wLEF0q1nFhcx3YcHjk5QPB0T+4iXwiV/tl+AubTANqxrDEHJaO9bJ5+aFFXNFcYTDZXSJSBrzwNAidv8Y72U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uI5cDTSm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uI5cDTSm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6497C19422
	for <spacemit@lists.linux.dev>; Wed,  7 Jan 2026 14:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767794970;
	bh=o+CRaV666z5N98g0zrWQ+oTRAL2ghObwdkDLLmds+mw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uI5cDTSmFRR5wTwqMz1zK5zwht6zvrsLfPAfaG/xvgHfPv6ayTSg1yzUBjMbNzPmY
	 ZX3Jv/vSXOJ20vzfMBicXQHi1wCoxU/3FSRk7jYMPCySttNlXbBO7t5ZOLRbgrsDuk
	 37OKi9wQNTjrzeBCbOfqDG8BnXzfOSv7JbLPHNgpzipbwDGGeM3nU+0NsUnafrz1rx
	 5rG9qnVoQU3D5QKFrZfNiU+RKw7kIRAERDF59t9QxWUTYQt3Kli6IrkLZUImy4M7FE
	 wru7NuKVChz7sQf+N4opRiWI82bzxL5WLRhurHpruyluPcEG1iNh3aVzBfxmL9wMJ0
	 NfBjvWZApRTIQ==
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-64455a2a096so1765629d50.3
        for <spacemit@lists.linux.dev>; Wed, 07 Jan 2026 06:09:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUg7z9fZdqoa3E4TmAfoXaWOHkgQJOicyUKeDcXyqrqgNbGrbjRjUK77ZTLXr088NX7D1N4mozPmQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx88DarSASPH6UQOjkcLMnSela0rHyxylHymgPDVTmoWXI8M8iG
	WoLLh0MBOksyey2rkCsLYUI/JGPdmb7asnCqtqPU4kI/lkrZZlZ7AH+Zpj/dCksbpVR4ezNEW4I
	rKbSMxzkImYoVIN1idDCytGEdGH2kkt4=
X-Google-Smtp-Source: AGHT+IGVJM9u88lYk0P1zu24w+D9Abmp3Tgpsp7039pR3VGD21RawjWoaVZAeFtTaqSswOj71vp7ze28kyoqG0dQd7Y=
X-Received: by 2002:a05:690c:4910:b0:78f:bede:57c0 with SMTP id
 00721157ae682-790b5758118mr54075567b3.23.1767794970275; Wed, 07 Jan 2026
 06:09:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260102-02-k3-pinctrl-v3-0-30aa104e2847@gentoo.org>
In-Reply-To: <20260102-02-k3-pinctrl-v3-0-30aa104e2847@gentoo.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Jan 2026 15:09:19 +0100
X-Gmail-Original-Message-ID: <CAD++jL=9n98C-awde_ZQ_OmfDUsbmcNsgJcTfcwsYghgMZHqmw@mail.gmail.com>
X-Gm-Features: AQt7F2prYO2wsLFjbT7JVZq2qxObPCjIw8OX61DKF7WP4Vo2QsoGwU2QDnedbJ0
Message-ID: <CAD++jL=9n98C-awde_ZQ_OmfDUsbmcNsgJcTfcwsYghgMZHqmw@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] pinctrl: spacemit: add support for K3 SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 2, 2026 at 8:01=E2=80=AFAM Yixun Lan <dlan@gentoo.org> wrote:

> This series attempt to add pinctrl support for SpacemiT K3 SoC,
>
> I've removed the RFC tag as the driver is tested on K3 SoC.

Patches applied for Linux v7.0!

Thanks for your nice work.

Yours,
Linus Walleij
