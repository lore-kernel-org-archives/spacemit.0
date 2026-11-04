Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793817292;
	b=KoASxmSwfhXlTDqGCWJhy3+H4TuEnndO1LRFiw9eXL5ltv+MUDbQ0T7+d/95H7f5w/wB
	 OkRigoQwZfP5Xv4+b2hoDIQYYppxrmlnhuA2c5DJw665slrPGOMYVEAEI+7OqFBIUoBPu
	 C4UhgSXdGgImdIkBLWqvHAGf/+nRskQkOc4WStZYGRxYTwecaMNyEg/8ylV1vUY8hi3/T
	 3VCiDpQikqBvyGsJcDiDDzw3287zinwZFHzIPNuSEAqkE2FdFzWITs5iS+OxfPHpkWjC+
	 mmjo0G7KzmmpBOsSBxo14r5noBJzsBZS737mogW40pQOXqb9BkU4Gbnirja07/h/7Fg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793817292;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=inKoJkd5OXoLymkRd5+ohV9ATRnfy1E/adzijjekINI=;
	b=1F/DLIhPpB5NJcNLXB1JhgRtzxg33NUs6RjzjUT2RoPpQCWCovQ2Il8aKXZ9TSBQQKbb
	 xrkTezgwjnqL4kQwYxHcRmYU4f2xmWAPkrcdAg6BEsTciXDWVGoXFQD7NvEWuwAYH4OcY
	 vq0SPbMfCHPl45O4+6mFT2BSSWqiDMx+qaOZO/z3Bs+M4pVUn++Cma9/1JOibXjneErf4
	 SC4c3DWzX4a1gqFkefmWK+cHWZ1e/kLMRrRjqcKIo07xnAZ9FLBLfNgzTusd1zeM66JSF
	 PKU2RIFCUWuy9E+7w1+r62VUiUOzqY4gsfYxSbi7GaoandrQt53N8Gxpq5TliJH89cg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hUC4pAwE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C923606A339
	for <spacemit@lists.linux.dev>; Wed,  4 Nov 2026 18:34:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C923606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hUC4pAwE
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6798eb0d190so921628d50.3
        for <spacemit@lists.linux.dev>; Wed, 04 Nov 2026 10:34:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793817291; cv=none;
        d=google.com; s=arc-20260327;
        b=UG4/xUR+eOr+WKcU+Z0Ag7WDmcGtr2bOLji7twioI4DMp3CaTzrtzQwsjfh3EGra9U
         L90IpO6vEUMLhQbaoPO1aHTA+GoYonxqoUFN3cGf7i8XjH/vq1VTYEJacPlZ0mmarj05
         ZLEDRT/NmYW1hsGsFezjhlgOUBLxBMMV7aAHU/8HQwvLI/HolY7JwiuLsyMT9cJBSz3P
         a/a6btlnYOfAbf/tmCtjWhynKia7R4LM+6iZN06C36cf8dGrB+9kLSBY4iW95gbjpkSy
         gUi1LkhHpn8mZgM5TPlwgAAqegq7Y258PWbjD0e11VxHePVPOw07WwUgq29cfzYAcGid
         0THg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=inKoJkd5OXoLymkRd5+ohV9ATRnfy1E/adzijjekINI=;
        fh=f2mclPvVZ1uarM5OUayo8xa3+np1/52M3zIPJEex6a8=;
        b=G4bovMbuDcUMWQrE5k9ChkM71es2MmQgoyAmI2D8a4vPoWHZ3+xmbSyci92hfSovzd
         Fts+Zwm03SAZmjTGkcPKz0bJfjve55D5FhtvJLTxRqxYGEs8OVP+JEm1wJ0kDRvG4/LG
         boxaRdcKgBWLsYBvpIbLI+t7oPzIdmNjzxLCcV74XubtFwQekfVFaoVvks3wUHnuxdhG
         AMYcm0OUwQjQt5XDtjwlCCZShqVOO5q7CCwDvG+Iu97TWQoCf/V83EdSNFnOmTQx3v2v
         4mRcWsQ9t+xj/QREF1bsZJBiLSDgIqRTCXQjAx9mI1M33sFRCv7RtZ4SHBksdw7OAS6l
         uF8Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793817291; x=1794422091; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=inKoJkd5OXoLymkRd5+ohV9ATRnfy1E/adzijjekINI=;
        b=hUC4pAwEyePssy8TCbgHp91tbwudkUEJcJQy8xYhLtcG83vM91yxGa52Svy4RIRpEJ
         ovC4pYBl5pLEKblQhWS5+3EowjVMKuBv56hosu4wrD/eN8hJb0bk9qkApNX+lHQr+RCC
         SMyXKXqWT99HeiVXaKle3Shwl4KFcm1rk3DFAk+Mq7o7mc5+qCYG403L/OHsdzpbPoeO
         V8p1dcL7iG4bStzF68+yotlnnosH3jRN9IHuWaK2Kx0qd4xXobkMV6pzZtTURPmtTVL8
         2OjwrV4EI3e+96lSL3u0IKW2FFRdcRBgaXweFfKhEM74kgGkFnCnCyKlwzPKKb372kBK
         cPbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793817291; x=1794422091;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=inKoJkd5OXoLymkRd5+ohV9ATRnfy1E/adzijjekINI=;
        b=ElnCVHP2n4YnG45dIqkw42n+rvN5PyR0V5MlhSzTQ/bjmPIBvPKS0pixXuNwpLHBYM
         EMJfFGY0qbZwyLplowJ4KYBFxq0TtNqB6gMW83D/MLMOm7uByMpZODSBjeKNr5xUW+7B
         ddT2GMkFnnOE7pLg7lArfLzZ59KB5hSsRbMI83J3UkquIl74+Xn32Lx+uK1TjYXiumcP
         TOkQQHLhTIibb+mHDsEmq733XR6JUCjkAzqhbizQ+aMzRJrrNQ2dnkg0E5MCl4b2JZUn
         1trX8ePbRyW78sEz0i4pBrKaN6+TOwjGbGo57rLH1lxuoMvla9QNk/k8AvQAtgcyHGth
         gBGA==
X-Forwarded-Encrypted: i=1; AKwUvBzvSr3aqfGxiZdEaNz26DcIEfrfcNoyc5q8ciKon29dwMzUniLXW5CWkKyu4npsSWYuxog5jmubyQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z9GIjs2iaj7sDyJ0S1zTeohPZsVzxQ54ixmMqVqHLMAt2mpah+K
	LFS/8xQkHqRyE0qveMdhJujET7WMGl6zD09qYNXWwfGKO226SSh2McbiFPZnT3I6ooPmZX69uf9
	FUO/i49nZkvp2vLHL7Usu3xIc4b32TWs=
X-Gm-Gg: AYBFou2Cq2X8k/LSMCPw1woDzthf7Xq/mrWGov4dix1EWQJyGNsM6jdOfDi20GNFrNo
	lKv2/ni1jhFedvFxoB8jGYKR8dS4LzN2wFBd5EtJ/C3VHFZjTr/6R5M16ShR/xUs3sv/SM/Rk1z
	Mi2X7c0V4mGg+MQuuduAxW127Vfqatx66KebShcQ61n5+gzWaVvgfIh+xKuc3pBcoYECax/xlzZ
	HoLeywG6poc/AUoMm+Ayu48RiA4/ED6qpMiv/1YS4iLVs9TVEt3fOoVbqZF4oIpU6URx8wZgbc2
	CO4LmBBS7K340yPnw60wwbyQBY3URZ1jMuhvrJ6OLYorsO6TU7UWsfnAns/WiS0uGa1PivLxuAL
	ohlJvKkMuwBlilkLmuhfrs6rGFI7CcFpJrmeMkw==
X-Received: by 2002:a05:690e:1183:b0:677:d419:8a27 with SMTP id
 956f58d0204a3-67ba501b9c2mr13354407d50.51.1793817291284; Wed, 04 Nov 2026
 10:34:51 -0800 (PST)
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261103-spacemit-soc-timer-v1-0-36722421db6e@linux.spacemit.com> <20261103-spacemit-soc-timer-v1-3-36722421db6e@linux.spacemit.com>
In-Reply-To: <20261103-spacemit-soc-timer-v1-3-36722421db6e@linux.spacemit.com>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Wed, 4 Nov 2026 19:34:00 +0100
X-Gm-Features: AclHuK_BL_NkBC94LItzmxoqmdRwZHsCG21WJll4bbRrLdBM3Wvnf0wDs-TvvBg
Message-ID: <CABdCQ=M_FwJOEG9Lhzahk=qA-qmqMH1QeGg7dfFPWdwT=4J63Q@mail.gmail.com>
Subject: Re: [PATCH 3/5] riscv: dts: spacemit: Add the K1 APB timer
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yixun Lan <dlan@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El mar, 3 nov 2026 a las 9:56, Troy Mitchell
(<troy.mitchell@linux.spacemit.com>) escribi=C3=B3:
> [...]
> +               timer0: timer@d4014000 {
> +                       compatible =3D "spacemit,k1-timer";
> +                       reg =3D <0x0 0xd4014000 0x0 0x100>;
> +                       interrupts =3D <23>;


K1 timer specifies interrupt as <23>, but K3 uses <26
IRQ_TYPE_LEVEL_HIGH>. The IRQ type should be consistent.
