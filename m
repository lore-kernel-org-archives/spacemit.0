Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794952088;
	b=RMfFeW9KkemlE3R5fJg7NDYb6GUA9fKicVREjMlKLHU+FfatlQCEJleRVYOX9mPG2w0N
	 ZMsFostBoZAWL/6Wfa99f8ASkJURhqWV/HFHGH5NC45ZGwcI0MJMGK4rKZngpQphqEHGD
	 JKf1lliatQ3zQLkg6aUZ5TVgfSUwb91lHFXtcTEV5QbUs85AZfr0bgEmpoTN0ebdLmMhd
	 tbxOcq7m8jZy21zk1ywMBL4sVjM7PhS17LZyBQsYNvWI0c0KhyFA3ukFfZ9MVMeKAy2N4
	 Yb9DYq/+yMZVM1qCc1atFiB+84utHIvZTe+FED4zl2rudTTLwlhRC32LjItvxkwbqbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794952088;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=gWhTP+MsEZH11Xk/IKOvm1ABoNQtFuyWT71ie9/W1Ho=;
	b=bPvOrQzz8drQlhChtZ/rmyAMmAth8GUYKPb+AKmEnvhfnQVD1kgkra6n38ulNdUSB+5j
	 psC4+KE5BfXP76oXdEbQ8uycXwHEAhcpnJBosSg3iB5TW2PTi0mNbGZu4YE3T9QuiAe0l
	 AiseAGYKCmpaytQBG0PUo0tnvJDWy2NBEWBqKgnYPqvmHFhAVZwxdUKGrS3UvWp6CfS1i
	 VqGZpNFyBiTD4mxM7RAVmKgFmcZOHxQolOH7FurECb3SxSG1ebk0aZZ9P40iTwoGFZMBl
	 RxM5PeWFO8nTCarlTI7qla1VPo9DLR3Mx/0/NECRgsKWwXLh+IficpcavcmLVv3dBtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="HOs/tYHX";
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5A1606A32F
	for <spacemit@lists.linux.dev>; Tue, 17 Nov 2026 21:48:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC5A1606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HOs/tYHX
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b4d86f5328so1923947b3.0
        for <spacemit@lists.linux.dev>; Tue, 17 Nov 2026 13:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794952087; x=1795556887; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gWhTP+MsEZH11Xk/IKOvm1ABoNQtFuyWT71ie9/W1Ho=;
        b=HOs/tYHXBitJy9Icx8ZpJx6Ldvx2kX5NkhOIQEKI623nRpsmuGaG+qlHJho/bbas4Z
         rJLI63Q8wzauM01UKDadH33U6y8fSG+cb4DNv2dEqW4tq2kyySRl/ayyuz6igcYnMe45
         s3Q8y71gZmfTYWlUU7QH4McQEuMOYdPdjZBuqTPE7iIrixRVw2IHuU+uucmNfFvwtt1+
         jdRZPUQ3CKqtkvEN4g7ok/8nuUXft/9jWN7fYUXfnE1anl4950gVuccBBcyIHe3c8XvX
         PugrHAUqz0VBrdhzDqQwOxjpK6qv6CSYJ6j8bp1aCkYZLABUa1aWD1NyrETeAS8BX4tA
         e5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794952087; x=1795556887;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gWhTP+MsEZH11Xk/IKOvm1ABoNQtFuyWT71ie9/W1Ho=;
        b=q5xCmyayRT+Ax/42YQ8FU8oDMNF/iZU4ny0JmL7NJO79d35BZw/5hg/ox9+ssXfbfR
         a/OB3JqfYGy5RNI6M2vWdjjg+qdeO0ZZZ0H6Wq3+vi8W5bMFV/3izpiOY6mAWITtXs9U
         Zi3bTCd6coSAk3Cl8OpLyE67+SX5R3IgVwTGq97DAd31PsbkUe5Z4gp5cvZ2DsvOz0Q8
         egaBP5qtkIGg+3dvlm/Af9EbuXkl2HZ1d07YEob3HWYjIqi27SKVAOP47I0MkqtbOE/M
         CwZpHnfrCceNn0mEAO9q9k8TmStM/oRqTDFtZ8d5ILfhaeqwqIF85arbFMssZ5G7aL8q
         ROKg==
X-Forwarded-Encrypted: i=1; AL+hErGQvUFoxipBscgn80i4BJtpGQq1NlymAR9v4TbAzl/V91ljOSCg/iBsHnMZrB8nODEaN+qIoaCebw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8hdnL9n6rtA1VcIL63PFZGNf/uY64NAsu/VCJtU6YydV2UdL0r
	ofeGxBMOsT3bMUeP2XhIUFySRMvy4d20TURAZrStP71gVwRSPU2ee4la
X-Gm-Gg: AZFdTZcFy7+RcutH0P/e9GnfGY00TAz2a5cDLWGYKta7L6tQEZCXD9KyCI/fJwZWk1j
	z80KYZ1m1Nr+2qX6PDOtR1UDGfawkZOQAdWqFmS2YM69TUInddxKHRiI8uV/M8zAert+uMfpB2h
	FK9uDpfUCCGW7BayQo/fFMyo8zUTVnfnyCq6tl0TNGernaU+AOMbjNboZASGZ+1S7GOlMkwHbgM
	TeaxKlLUMI85kRvO31ARNyMcSTJqE2wBbDiLm8wzIzTzUQfJuV7gVsvn6PzYOQg0CY1jo9jNwuG
	S4YW37s6CpZplJDVza/kMWfmQTAUhSVY54aJHl1C0Nq12jdLU9ntgeHujlAsbI5RDXQcUNgohsr
	nDqyph8i7EDKi32/U9+ppPMFpoP62PP+/MWaWP+v0YQ0qekciwEO7nkG+9hPZ88fOnZ1BpnEMgq
	NTDd+BZEvIlZ+4witdxTAPkEH8DoIgLJvLhQmP1r3jKF3SnY3T3W9iV3Mx1/MixVNDXQyGvw64E
	rf4l+LNY0MOCrusTx3sGrLVMXcNDspwme9WhYv5kogbWN1n+MUoj8ELEbVv1Xw7iiRXKUMgM6s3
	muuulOhWBttq3bV05v6FmoEt
X-Received: by 2002:a05:690c:6502:b0:8b4:e2dc:3f2e with SMTP id 00721157ae682-8b4febccf0fmr3038007b3.8.1794952086607;
        Tue, 17 Nov 2026 13:48:06 -0800 (PST)
Received: from localhost ([120.244.9.31])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4fe030a65sm7195267b3.15.2026.11.17.13.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:48:06 -0800 (PST)
Date: Tue, 17 Nov 2026 16:48:02 -0500
Message-ID: <19ceb44df3141049a955c2c30fe64766.docular.xu@gmail.com>
From: Guodong Xu <docular.xu@gmail.com>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Cody Kang <codykang.hk@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 07/17] drm/spacemit: add Saturn DPU register model
In-Reply-To: <edd7ae1b38ebc687d0b2bfb2509c40fb8a45e625.camel@icenowy.me>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
 <20260809-k3-display-v2-7-327d7910bf71@gmail.com>
 <edd7ae1b38ebc687d0b2bfb2509c40fb8a45e625.camel@icenowy.me>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Hi Icenowy,

On Thu, 03 Sep 2026 20:08:10 +0800, Icenowy Zheng wrote:
> 在 2026-08-09日的 21:14 +0800，Cody Kang via B4 Relay写道：
> >  drivers/gpu/drm/spacemit/dpu/saturn_regs/dpu_int.h |  25 ++
>
> Is the slightly different K1 Saturn DPU registers considered?

I compared them with the K1 BSP you mentioned offline [1]. Judging by
the block, field and interrupt macro names, I agree with you that the
K1 and the K3 use similar IP. But there are also important
differences between the K1 and K3 registers, which is why I would not
propose reusing these tables.

For example, the blocks sit at different addresses, and most fields
are at a different word or bit. In dpu_int.h, CFG_RDY_CLR is bit 4 on
the K1 and bit 5 on the K3, and the underrun bit is 9 and 8.

IMHO a K1 port should add its own compatible, its own field header
and its own backend file next to the K3 ones. What do you think?
Hopefully you agree with me.

[1] https://github.com/spacemit-com/linux-6.6/tree/k1-bl-v2.2.y/drivers/gpu/drm/spacemit/dpu/saturn_regs

Guodong
