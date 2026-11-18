Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016953;
	b=h9rEJ2ErqrZXOEFDwySJcPtfNMhIV8E1l2MiVDMVeQB0/3JQNcXn8537BLxDY+yQinqE
	 +WedaJMvHazrnjqk+eDrF2T18lkt1yLVonurtQW8Nn7q7xsZuEKBfd5wBL5oxirgtJMmq
	 E1fKcIk3ZWd1Tes2KoSCbuJ8THSv+xDJGvEH5lyWQshANKl9/4RCVtAes4liaUpypkJjL
	 B26B4N21P2Mefp8QhJY9yu3XHM7rWYS9lp7ySrln7YKraNaQ78GKGIGENscWZKNQLFQPC
	 p6I02/n8lS02J0eF4foczvdCayYzbc8txYPBJi7AC5KVNOASXiW/YLNu3vXxofL2rqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=cer8YfO6jgJ8rX/jlVTUPHJd3RGw4HKBsstgFxqYGYA=;
	b=3PwJ7ji0hbIGsKfiTpA3Is3N4gQHSwcr+MMdLzErki0wpdlswyLSTv9D5Lr8bNpglC8d
	 Q6mE2G5vaYjwmFWg///1ZVavMozXpti0WIp7LYm2azn7+N7OXMYebeAATK4SBnNLvnzOv
	 n3F1Qc3gLpF5hLfylNBl+iuDCdoN+ZM/4exzfvNSw/hBixY/Aym3R6B21sZkLKnRt/DIW
	 cYWj+vcxhNDXzEQoOE6wkL/CWmBWPGEnYoVsrni15u/DXx6g1d+/XKOH0iPH4v5iCRfVJ
	 lWr+/G5WBxgLvYiOeZB98r/Ga4YhWQKz+moKDHx5u96f03264X7oXeuVLUCu928ThrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="BFaHNMQ/";
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545E3606A33E
	for <spacemit@lists.linux.dev>; Wed, 18 Nov 2026 15:49:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 545E3606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BFaHNMQ/
Received: by mail-pj2-f10.google.com with SMTP id d9443c01a7336-2effa00323fso3181145ad.1
        for <spacemit@lists.linux.dev>; Wed, 18 Nov 2026 07:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795016952; x=1795621752; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cer8YfO6jgJ8rX/jlVTUPHJd3RGw4HKBsstgFxqYGYA=;
        b=BFaHNMQ/AtiUJCUw0lSMptp+GyYsdPhryljfunSwYM5r9ETnn3FCw3BJ+K+B6jimpt
         iW2ovcAwuq827k4lHKHIW9qfcvm4tqyM+7ravujpEzBrmGY8q1VTpDX2huA0uLFOLwJT
         VZ2s2DxopOlf+DDluL8qFepzKmzQ+7pYSUyVMP6TB3dFoLK5/Xv9FJM9h5p020pgxjA2
         4D711W+Q7nsBYxGHvHqVEj8hkc0QjoliJxy6Cykce26atFotHsVLRqdEleaxcS8lcXmN
         tEOTYybmC4vyHKIvbMzAlZOKkMEw11UwFh7cxuF6FKSReWcVWCHl8b0V8FNdtVji0nHT
         qrrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795016952; x=1795621752;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cer8YfO6jgJ8rX/jlVTUPHJd3RGw4HKBsstgFxqYGYA=;
        b=sG+Z3/lfYsgbZLLJ/gJUsxfb5aWlgyd2beoiHuaOjijxgBMYkSd6OSO3m3cbI+BfD+
         l1lMakijx/29C1qbHvEabofONdeaXZE5eBENRaTFHxO4rl80CcSucuunSA3wJ2NCNVo5
         F0jC1LHYoNQwacW3uhWESoGKI95Qe2Fu7N/V6/tdjCTANU3xR1mSuhM6R9uyFZ9Wa2N6
         8aGzUjzodr/bj4ZH416QrvWBP7EnUzX99O9KdBvGl+opW3o9V71gLuwbPIvzcQ1Wx31c
         tS0zAiPL7LCm6djQioLo2OHH4fW2zxHpTgB3hFn77+R+p1g5AlZxX4CKRaqloth0B6Zw
         ehcw==
X-Forwarded-Encrypted: i=1; AL+hErEdmEYtAVZtK2b34Gr7X+Jhj4zT5fABAS9cOvoF7GOf5c3e2c1u/zzS/oAlggA1TtS+sz9FDLWJkg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8ULM8w2AIbF4q/XZFVms0lQyBnL7hj+uqfFHrE0LAJ1aVBRLXW
	QqWSHRU8kQB+t7xDU/RO0tVopz7jfiet2Q1sr0g3O9Gcqx9CM/FbYQXq
X-Gm-Gg: AYBFou2dxViIegdo0ld8jQX7KhOt4bN7aw/1KVyb/k5ktUNDK5KU5VLUIsgKWav3tHR
	ylNATJQGFEVu91QKl2iut26QKi/cL0ycoB/k9foxKWSnzX77EBW2fqiRux3E3VExen09nIncunj
	CCqJCMwv4Dh7LM8YjNCOQMLvH9aQDPwbT7h8cOrJRuYynOj1eP7quiM1B71qzd+Q6a6BB6eik5U
	QtcVsPecu9tVZLZgCVX0ElqcrscjjX+uN7ByyBBzd7xxnvwEkEJmzjFCBvz+40e6q27Lx3+mT+A
	ytCNDV6DrLli8JJNOhEyCydqJJOwwEr2sdIvQvmK2VGG2BWyWSWL4CUHoLekOIY7zT3dGZa6XXJ
	6ZRYh6b8gkDDV2FLnXtZKkB3T+j9LeJw6rEJ0ynzsdOqxIn/Ig/hquQqyCJOXkVE0mJ1NsFfX8p
	8RQEWheBFgrHv/LwTC4gHwsyxMt08Ieey3S6TOC3U95WqL3iFSTn1zKwylO7N7J3eQbhgM9W6rY
	34pDXwf+zpwhNX1xDR2afFu0y2K9gRJNpUsackLot2psaYKApeHa7zt8So54/Rq85dhhTEg+0No
	Pg0=
X-Received: by 2002:a05:6a21:6e0c:b0:3e1:bb35:476c with SMTP id adf61e73a8af0-3fe8bdd7c38mr2965829637.72.1795016951931;
        Wed, 18 Nov 2026 07:49:11 -0800 (PST)
Received: from localhost ([2403:2c80:6::107b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c6660c2e4csm1055183b3a.22.2026.11.18.07.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:49:11 -0800 (PST)
Date: Wed, 18 Nov 2026 23:49:05 +0800
Message-ID: <e4eb5f5b7ed8b3b6bf47d709e4344e0a.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Icenowy Zheng <uwu@icenowy.me>, Guodong Xu <docular.xu@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
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
Subject: Re: [PATCH v2 15/17] riscv: dts: spacemit: k3-pico-itx: enable the
 DisplayPort output
In-Reply-To: <9d97d5dbcc619a9c52904ff8c6704a91fe8351e7.camel@icenowy.me>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
 <20260809-k3-display-v2-15-327d7910bf71@gmail.com>
 <576146d4f2752c3c3f6ec6c42812cb9956406383.camel@icenowy.me>
 <f4b8c87eb0676500661ebea67363ac27.docular.xu@gmail.com>
 <9d97d5dbcc619a9c52904ff8c6704a91fe8351e7.camel@icenowy.me>
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

Hi Icenowy, Guodong,

On Wed, 18 Nov 2026 14:25:38 +0800, Icenowy Zheng wrote:
> 在 2026-11-17二的 15:51 -0500，Guodong Xu写道：
> > On Thu, 03 Sep 2026 20:09:42 +0800, Icenowy Zheng wrote:
> > > The connector available on the Pico-ITX mainboard isn't a
> > > DisplayPort
> > > port -- it's a USB Type-C port instead.
> >
> > Right, it is a Type-C receptacle, and the commit message should say
> > so.

Agreed; v3 will say Type-C receptacle in the commit message.

> > > I think you need to model the Type-C port and alt functions of it.
> >
> > I am not sure that can be done on this board. The redriver/mux in
> > front of the receptacle and the PD controller that steers it both
> > sit on the EC's own I2C bus, and their interrupt goes to the EC too.
> > The SoC has no bus to either chip; all it gets from that side is the
> > DP1 HPD line.
>
> The ChromeOS EC firmware exposes some control for a Type-C port, you
> can search for `google,cros-ec-typec` and `google,extcon-usbc-cros-ec`
> compatible string in arch/arm64/boot/dts for more details.
>
> Although the K3 Pico ITX hardware connects the EC to the SoC with some
> not-so-embedded interface (eSPI), which needs to be handled first.

Thanks for the pointers, and thanks both for the review. With that, I
think in v3 I will leave the dp1_out endpoint unconnected, as it is in
v2. Let me know if you disagree.

Cody
