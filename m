Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795124338;
	b=L86yNyV2rYjSYVC0CKyQ90bvlEXJHQ46o/SHT5HPq6vxSbU+yB0OVixvptIbiTsRd1yV
	 uoHNsE2mrDXetqApdU8lBrESoCdYeaNr6zsatmnTe5y54wXXzUTU7egxaFzSNx8OuJgWm
	 2fSIckn2HfnpzdBlkIn+baqAYylUsqzua8whdxLp5jBTjeJUIlL/UJOzTxHTnt0e0syBG
	 u809+ehKdyQDNZLfvVpnEEhi37IxmHP6U1wIACLdFeRr7epX5reD8fgPbqmlqabxwbnan
	 VK3YMQ9ezcWRQTHEqqswJcmAQpVP3alPSQ9bgEQ+JuT9p+oomMMEyZiWC4MrjWVO3Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795124338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=kZCnjg9SNOEIBkstvPO0BHnnQE09Drv6532P18ADAkU=;
	b=joB1CHl+jaYDJyr6tn4Xz6/cLyvRslpFJmdOVrBolAzgfl0v+XmD0sECDUHn06aVjXOl
	 8N322lMCdFka/QnLQA4i2i/iGyr4wRiwzWh1tWzI8xg9kSHLbWAwxxb0NwIJuN9/MgMgn
	 9jTEptlmNNsbf9Zvof57s93HntOpfhGT0A3yBejlvjru3c9aQNm269QN8pAE4m4B+3SFI
	 FB5lcltd24YNy7x/z+ePKih8tdlsMLgZ91AQbDWXkJ9CmxtztDqucJVHKkE/PvOmr4Gpm
	 kToqooEHBREV/bLm+GROjGwbv5Q58WgsZORFlBpDAmS3haaLLmvQpLJfo/J+NuK0TFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ealZ1J7P;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B78E60A260A
	for <spacemit@lists.linux.dev>; Thu, 19 Nov 2026 21:38:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B78E60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ealZ1J7P
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b4e2fcc300so2158577b3.2
        for <spacemit@lists.linux.dev>; Thu, 19 Nov 2026 13:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795124337; x=1795729137; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kZCnjg9SNOEIBkstvPO0BHnnQE09Drv6532P18ADAkU=;
        b=ealZ1J7Ph1lA4T1ZAx75mGtpAz+tc2kp7twBNBeIT7xDBDmHt5Ks9nRZWU2LLc+B/V
         1HITszgatGoXQcqlQO1QoATyzRcuNiHwYuXqO6ajg6P7dpA6i50xmCT7U5kk/Ys7TqDa
         +mQWUaX+7Rkb1TlmLvMZebXrgG5qmlceQ1VK20ZOGYWY5ijJqn1LG0j3GevM0XUnW7lR
         3E5h6k7WEPImTvXJV23TSBGmj6fgZTtyk5R+0KDbM2tEYshF9sBVMIhYMOW1Rdo1sKrs
         CmcCr4eASPKu/crgdiNhskYUSDjucv2xp8X3NiwMI5Lcf495fHJQq6+K6v3fjRp4G5OA
         cAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795124337; x=1795729137;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kZCnjg9SNOEIBkstvPO0BHnnQE09Drv6532P18ADAkU=;
        b=xqC5lk+0sx9jQTF2H+d9Soaf07643F69nsrx9t6jFomdOzvYPgncqrCMNfx3SOo0I5
         7CxNXU2wafcI6nO5GK8JWVc8r1uBlTafWML+znWfJBUS2hrqhQNf4enU7IngYTquElVz
         EPkvHwxSdA2e37oHNVyQjvlFNzwvybejrtgP8VKRCYfDK8W0u/WJqQOe2W9qt5AQAtTh
         sPoxMq0Zsoc7PKET90EUJCLJaB/PbdnBm44y9zxpjzCcr8YH0W4lGk5C2NRZ5h+StnCQ
         cEY1UoDdU96eIZB40CpFrXbFUZlUHdHSVznQXg0kCC5GP8uYhZ6YWQw8dhWteHOoMvwv
         jo9g==
X-Forwarded-Encrypted: i=1; AL+hErHsW+s9Q3ic5C+iwwm7agdf7lmWijE9Ubx9Y9drYfW6dpOwVoAhx7Xvj6Toggl5aui8ZS7oZFPhJg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9kOFeCobaejLd9AN94r98E+u7UeVw/8IVfit13m2e/T4CoftJ8
	lZk202DAxmYFhO/HgYJSTYY+L+dBMzhj+xpT0uiPxXsT4lzNMCiHcDkd
X-Gm-Gg: AZFdTZcC2hho4r1K9U1+j0Y3GaG7+Z+8cXxV0sBI2YmTljFgFdCnwODOCRgJnGXSTAU
	F1ooFMCASvHtQdJ085h5E5M4p1KOCoUZydsr5vO4TKz6NmMRjxOJMgXUjgTHfm59FCqVfBadbeG
	ZRfY+FrhRZI9frPmhmC+uzGQNKJ4tF3bR8hOTEGJkCaOLTLg6N70ZS623uMrdAoeuCfllIqDvs5
	Qo2akjUFjzBoAMPklcPvGXbXQDN0UPrRTPnwmlsMcoF81sGFs5skLv1FjsymU108oNiP7Mfezju
	iOfv2zuETJM5VValgodGSGfNOTXTWFP7cXRzXOvitm0X5Z2g4YP6SYNtBVck7J/NLNDNOgpzwMW
	bxfwCYZvIRkHJuT9uIRM6M9sjUfhpKs7d4ZcY5zhj5vW/OIHAoZjZ41F/d8sLkWGDl0Pwv2JGdz
	h37ZLZdwYYfKCw3j/88oAJ+12gxonLYSEk8Y58QAE9cEYFtNSEJ8Nd1aFK3+KErE/6XP1fddqT6
	/t9T+iG7ac+LH5M3+A0ZGTBR+tvZRk+4bEZFiw3i5vQuj9n+KJqHiw5n/D0dKWI8hZA/uqvhK64
	vhIohzCJiKhCkKXPGITWHX8G
X-Received: by 2002:a05:690c:c9e:b0:8b0:95a7:37e2 with SMTP id 00721157ae682-8b5204ebe00mr4585427b3.80.1795124336861;
        Thu, 19 Nov 2026 13:38:56 -0800 (PST)
Received: from localhost ([120.244.9.31])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df33b7502sm663093d50.20.2026.11.19.13.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 13:38:56 -0800 (PST)
Date: Thu, 19 Nov 2026 16:38:52 -0500
Message-ID: <7072ab495239e6bd28e2e9ed75244e24.docular.xu@gmail.com>
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
In-Reply-To: <bffbf989f2c99aa8c463719347930aca44962615.camel@icenowy.me>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
 <20260809-k3-display-v2-7-327d7910bf71@gmail.com>
 <edd7ae1b38ebc687d0b2bfb2509c40fb8a45e625.camel@icenowy.me>
 <19ceb44df3141049a955c2c30fe64766.docular.xu@gmail.com>
 <bffbf989f2c99aa8c463719347930aca44962615.camel@icenowy.me>
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

On Wed, 18 Nov 2026 18:18:11 +0800, Icenowy Zheng wrote:
> 在 2026-11-17二的 16:48 -0500，Guodong Xu写道：
> > For example, the blocks sit at different addresses, and most fields
> > are at a different word or bit. In dpu_int.h, CFG_RDY_CLR is bit 4 on
> > the K1 and bit 5 on the K3, and the underrun bit is 9 and 8.
>
> Yes, this IP weirdly doesn't consider register map compatiblity at all.

Exactly.

> > IMHO a K1 port should add its own compatible, its own field header
>
> Well I don't think field headers would work for a mainlined driver;
> maybe things like regmap_field could be used to mitigate the
> difference.

Fair point, but maybe that can be done when the K1 is added. For now,
in this series, let's make sure the field header and its users are
self-contained, so that K1 support is easier to add later.

Guodong
