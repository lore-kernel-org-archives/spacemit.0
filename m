Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794948709;
	b=uAcCy4fcM7ThZt9BrLp6WugfWKWx7vQCIyhnjX0v59/W6jA+UcpW0tTVahkj101/lpwZ
	 IAztHQf7RsG0xxFIJzWJqYNyhNCFVIdUNOodT/BSs5RhpT/067fx2eMecoiGqZC8zMkCC
	 sTzE8dYwSWmFrGu0KHH5xK4S5BswPmV3jIcQEqbGpO5MLKizN/+XffUffQzx5V9HYeGOF
	 UEEKhrfUq4xrFEkGgoKSA3sXmWmu0YGMKQhbYITZ6gRpnXffcI3JDD/uUyG3j5zBxB87/
	 CPOWuYynbG6q7mrDI7vv4hZvfZDi6UO+8VBlyHZhjgTvvN02ksc0O2f8kkJUp4n7U1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794948709;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=H3h9IxdpOr+oov0x9AuL8BUQNJ9C7SGtsH7YFmYPEqA=;
	b=Zr45O9fkxOYxp+W2VGicG9xjhtOerGoh0L+FsC5cbINeM8m/fPzG+Bo4MXdQ7irjkU+F
	 AkGm3Q39BQWQi08LRaVZ+9XJ+0xYXdXY0p8KNpZ0C+0w75DHH7sibI2gapWTAtv1GxLTw
	 KAqBR70cKAaLc4mXJpcxjsO7e2kztIDVJomrdf8D/ftzhNX0tgGdtRa93uu+mAB8Br/Rn
	 J2XJzjsOnpUAGH0a1YSy6gCugYMi8ubHYF4uRl+vfhUrcUhrWy9kSRByo+/eoTGZjTIiQ
	 HSAynnmd0WzfPAH4l97Ir1usyUuVBbY1ihI2l8DQBayhWwPJOW6tBdhDQl4vHHQh+vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pE6T5YZq;
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62A0606A32A
	for <spacemit@lists.linux.dev>; Tue, 17 Nov 2026 20:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C62A0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pE6T5YZq
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b4e04eda5aso1792227b3.1
        for <spacemit@lists.linux.dev>; Tue, 17 Nov 2026 12:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794948708; x=1795553508; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H3h9IxdpOr+oov0x9AuL8BUQNJ9C7SGtsH7YFmYPEqA=;
        b=pE6T5YZq7rp8T49a4MDCmhBBZKnj/51yXUW360wylDcWgOFQ7FmfxrmVSVtUIM7bZs
         HYQ/NVYe+TVIAR59CeD7w8FojnlcyUOgZFzzlmWnNJ9j1M9/mEz0fcyzD5z+EstxEvfz
         BZkeZSLkjQhRTe8utiTjPL35GpP2qVmD5HQCvtIEn7wnFBrTLhvynnnmc9PCLs8fOdh0
         kL96I2Ld4J3VpazyNBsFKVgQdrC3/ArRL8mP5HN+B5PJsKbTWGEHbdi0M0iVRQ7MOgec
         /jLpOPCjBkfVlzPvoCVM8Co7nf4q6ZaCvdvGZMKeQvJohZhjZFX/d0q6lk18f19w8dQO
         A15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794948708; x=1795553508;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H3h9IxdpOr+oov0x9AuL8BUQNJ9C7SGtsH7YFmYPEqA=;
        b=M/vLIHjbqSheM19RWTZidOx6UAlgNHZWFcVTS4F+Gvjbc/b3itBh1CFPRZqxJ3S4wl
         etl4g2LQJS635nOSymv8BlvmB4fAlWL4eH2FoBWsGwYTSqgxFytwSLQZ8+FQVHU1I1Cl
         gntOrH9YdiHPEQY1EhNe2i2c9gnOyO1pBnAth0S8xP9wzxzeV3Uhv/WLA/uW3Wc6SdTD
         EQUGSraXpMqFzqpaTzTsupOEyC4Jt89JDLgNE4E3oYYc5XikaG44SLfcSxzYzyoZbUN6
         veLpmSSaFDWUOsAQy1mIzXDGfhl+kpkLpFg+LrkT0ikTev5XaHhBJO4N1ioRbwpO8tql
         oKDA==
X-Forwarded-Encrypted: i=1; AL+hErGcC7xN/u7OtJBfVQWAx0qojWdsE+kqMe6CxR6RUCXMmOkpj3zNPVX2rbcrKCsf+1b5ywDkkohqJA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9YTLAzetzNN34a3QgF1JGlywCF0Eh6ODoW+q6gAFwqexauADXH
	AqQ+fBmT+hOIOT8RCvSWd1ao9gVgFbXur+dLG4kWMRW17nTHv87Bs/Pa
X-Gm-Gg: AZFdTZe/EVIf2uS2EnD7vJ/qF7bWsthEJtIrljGDdDF98AGFI0e18dFNEj+CVIstcHu
	xxwBsqvVDmu/NA01CnfPR7WNA2qV+2ZA0YfPKAZR4PAi3YaJdWpkRFXYMditRdHv5wypJOn5uuf
	LJ9xcXfrlX+WjjGQrQWX9yeeNxT0q9+Oi00dHE9jxcs61nVKM6OCX45dShvdjGhc8q2RO7bVcUp
	GhoJ4+9+K5V+kUX0VHLBNR8UQnyeciZ3aCUGsok5mKtIa4/VQX24d1Adtr8lqoruOjpzpM6O46V
	hZUS2QWrZlrM/1pkYDet40VHcPYh2/0wy225F3HunHN7vHJgP7Ecllrx3b0tH3iJBFnKYm+6Ko6
	hDPMXkOCHtSV/BU7fu3O57hyt9M4o4Ijcs+vhUC7GVXovItCGWnXWdAWApCr0qmUxpBgSpSZeOa
	0SQMMRUT2sv3o1DBuUOyX0NQb4PojVCA6eHyww4UfjtL3IHqmvLe/MiWFDUVz81vLTLZT7BrBLX
	Uyn/D8adCPDX5ZpYKjisd2liHNM6cf9Uh+lPGyW3VjDGgp+A97Y4g3pYQXXG3Oazl3igJEVO2C8
	DQp6aWSTicbULixUCoxRj7Tr
X-Received: by 2002:a05:690c:306:b0:8b0:e479:6872 with SMTP id 00721157ae682-8b4fed09583mr3173897b3.17.1794948707375;
        Tue, 17 Nov 2026 12:51:47 -0800 (PST)
Received: from localhost ([120.244.9.31])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4fe057c1esm6086647b3.20.2026.11.17.12.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 12:51:46 -0800 (PST)
Date: Tue, 17 Nov 2026 15:51:42 -0500
Message-ID: <f4b8c87eb0676500661ebea67363ac27.docular.xu@gmail.com>
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
Subject: Re: [PATCH v2 15/17] riscv: dts: spacemit: k3-pico-itx: enable the
 DisplayPort output
In-Reply-To: <576146d4f2752c3c3f6ec6c42812cb9956406383.camel@icenowy.me>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
 <20260809-k3-display-v2-15-327d7910bf71@gmail.com>
 <576146d4f2752c3c3f6ec6c42812cb9956406383.camel@icenowy.me>
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

On Thu, 03 Sep 2026 20:09:42 +0800, Icenowy Zheng wrote:
> The connector available on the Pico-ITX mainboard isn't a DisplayPort
> port -- it's a USB Type-C port instead.

Right, it is a Type-C receptacle, and the commit message should say
so.

> I think you need to model the Type-C port and alt functions of it.

I am not sure that can be done on this board. The redriver/mux in
front of the receptacle and the PD controller that steers it both
sit on the EC's own I2C bus, and their interrupt goes to the EC too.
The SoC has no bus to either chip; all it gets from that side is the
DP1 HPD line.

So a usb-c-connector node would have nothing to link to here.

Guodong
