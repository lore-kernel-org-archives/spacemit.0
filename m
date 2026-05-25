Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA8A3A6B68
	for <spacemit@lists.linux.dev>; Mon, 25 May 2026 08:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779698879; cv=none; b=ZK6yg5w3EC0Gfqc8a9ozuF3umLXmjdUKWlZSPKPivMHgVliebJd2C74oF1p72i/UlwsUsDIaDwzKxTRySzNdHxTuobdnMXlbuooKcHIM9HKypyxRiYNdiNR8lBZQiqckKuyFalSB8yy9XY7srjIbLzvYhKfXCAtfCxrq0eyEeZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779698879; c=relaxed/simple;
	bh=FBpRH8Z/da6LFKxE2gt1Yw5SEYEq7GdWXOLZCB2Um+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VEQrD9RbDZDLvyGrFR1LdFw5kfWAFkMXipQpp61gMpUfo3gJXHRBQgdQ5gAo2yK55qnjRiLN/+phh/DzJkm/wNmqur89FU2kWYM30rXcqo2uhpw8DrzxJEKdJ8Bt9VSVklFtbB7G2GqD1FSWqRpNXzZfZr8aOE8lOoxeWffkW6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h3X7fIVk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h3X7fIVk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46CD41F00A3E
	for <spacemit@lists.linux.dev>; Mon, 25 May 2026 08:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779698878;
	bh=Uiez2tUH2lHzvinGDgjZTRw1gLY54bFofTb+3SZa2AI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=h3X7fIVkXFqcRMVu0vwPhrdLPxDBY24EoTdRpcPfjUB7D88HSdGbkXMAOKn203Rqd
	 0DzIRM399hU19P7lZ46lThAdDzUllgFmSZFU6VfePho2oBIZq0NujvomUwOplXdLIw
	 vhu1OOYbrv281Vz2W1AuiHCBEQmsS8mJ5gVYROpnFr4JVPowSDKF2+/AlpO1s0LFXl
	 vSnai+Th2Iu0Xt5khb2l72inbHXQ+u4h/xgMe4gyUoTMuzsFmuSarRN8ZiFqLd9E/j
	 NB/nY6r5SY0Uxfjoh5mmYiED1PGcnA6NXkTNgh7ORNE1IsVynEyi7H3mtlAnqBuJgp
	 EEt0O8gUPtVrg==
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-484df1dce93so6253897b6e.2
        for <spacemit@lists.linux.dev>; Mon, 25 May 2026 01:47:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+1uDRdeinw7MYRc9jknG1aEFxXrYflFCh4/BpgktngGkdJq5cG11g9cewBEmL4Xe/wIJ29mBLzkA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyQmbu/gtENKAlXhAuqx/yfTQUTm7NnA6/WAf84Da715mffSdyK
	VHHYkNcINXgdULIUDNGe/FazCNyQ0u5tjjp1tbUFNbA8Sul/L5A2A2CspC8JcPF0otMFSqbkb61
	Lf6oOomp6CrTp8qSkfrC4v2w19Wm4HvQ=
X-Received: by 2002:a05:6808:3a0e:b0:482:48e1:cdf1 with SMTP id
 5614622812f47-48549ed026fmr8979404b6e.5.1779698877682; Mon, 25 May 2026
 01:47:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260519164007.122574-1-gaohan@iscas.ac.cn>
In-Reply-To: <20260519164007.122574-1-gaohan@iscas.ac.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 25 May 2026 10:47:43 +0200
X-Gmail-Original-Message-ID: <CAD++jL=1zGiwyqut3m-9h2VSTEbu4yGfUe6eo6b2azHm4kSJ+Q@mail.gmail.com>
X-Gm-Features: AVHnY4JnR7v4dqg5BWRjELg39bXhmUzIb9bOP06stD31r1dff2wvUSgEgPdnLIU
Message-ID: <CAD++jL=1zGiwyqut3m-9h2VSTEbu4yGfUe6eo6b2azHm4kSJ+Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: spacemit: fix NULL check in spacemit_pin_set_config
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Yixun Lan <dlan@kernel.org>, Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>, 
	Anand Moon <linux.amoon@gmail.com>, Junhui Liu <junhui.liu@pigmoral.tech>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, linux-gpio@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 6:40=E2=80=AFPM Han Gao <gaohan@iscas.ac.cn> wrote:

> spacemit_pin_set_config() looks up the per-pin descriptor with
> spacemit_get_pin() then checks the wrong variable for failure:
>
>         const struct spacemit_pin *spin =3D spacemit_get_pin(pctrl, pin);
>         ...
>         if (!pin)
>                 return -EINVAL;
>
>         reg =3D spacemit_pin_to_reg(pctrl, spin->pin);
>
> pin is an unsigned int pin id, where 0 (GPIO_0 / gmac0_rxdv on K3) is a
> valid pin, so rejecting it here drops the PAD config write for the first
> pin of every group. On K3 Pico-ITX the GMAC RGMII group lists pin 0 as
> its first entry, so its drive-strength / bias configuration was silently
> ignored.
>
> The intended guard is against spacemit_get_pin() returning NULL when the
> pin id isn't in the SoC's pin table. Check spin instead, which both
> restores PAD setup for pin 0 and prevents a NULL deref on spin->pin.
>
> Fixes: a83c29e1d145 ("pinctrl: spacemit: add support for SpacemiT K1 SoC"=
)
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>

Patch applied for noncritical fixes.

Yours,
Linus Walleij
