Received: from mail-ej2-f2.google.com (mail-ej2-f2.google.com [74.125.228.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDB637AA92
	for <spacemit@lists.linux.dev>; Sat, 25 Jul 2026 08:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784967261; cv=none; b=M5SBfoBC6Gp7yMX0e7onGboO7jOoOsg0KEj19EU7ZRL36Wb+p7fJ4hxN0FhI3agS/oTd0XrPkIayCXPAHIyWKpkJCh4agA3AIsidNcQaH3n1hu4Ug7wg2wz2QjHXIMkdiXsuerx10YCfFrEvYTWwXYuZ0a7oUJWihP0pneOkqVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784967261; c=relaxed/simple;
	bh=gPeXPPGLbFmRB2bRAKpa2gFojTcQTquw5RAY2mSvs50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XP5aU1lRzvkJx1nJOfrG7V9Qcig9hipxa1K91NsdE5S3DRCXuxuUAj5UcodKOtXK+1ICwCtD5aLqHOH1z4digQMbZ533uQnbFf1a/a5XjyJ3HDUp4om6rQadVb616xOSedSeDOJvDK4QjjORkQ1DJQvZyFUBTj88KOXfAE2jU4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o+diVcEl; arc=none smtp.client-ip=74.125.228.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o+diVcEl"
Received: by mail-ej2-f2.google.com with SMTP id a640c23a62f3a-c159467cca6so52438566b.0
        for <spacemit@lists.linux.dev>; Sat, 25 Jul 2026 01:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784967258; x=1785572058; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gPeXPPGLbFmRB2bRAKpa2gFojTcQTquw5RAY2mSvs50=;
        b=o+diVcElQJC8eTX8PSwh55RDbFOSnuij9+X+U+XmQfbKsdImnRsiNMbb1PmWqGGC83
         YyS57n+Sgd/P0EZCMleTNtzIo4HEGtp2+xeIJSPK6aqPO5LfUZOVQ1ZrbAhKSJilH7Fu
         Z7RGgNQ/baNS/DXyheflOxd+6VZup44VI3rBwhstwWdv+CGOTX8nuloKyTbbtXeFtKxo
         C8Q4jKc9EHZ2b4BA1Rf21ZKlLoRe25xUjHu6tZV5SfNPY0zjRKXiWpuIvksS/ktYWMkr
         nsHyf+vk6gpRLvXWGETypiH988gXC/COZzYktzJZvf2B+6dZtvWof8hNOIQZNobm2QFq
         QONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784967258; x=1785572058;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gPeXPPGLbFmRB2bRAKpa2gFojTcQTquw5RAY2mSvs50=;
        b=itURDo+R1G3raISHUnkbZ5rStVo8tVlgulDeqt7cJk58dbaBjpI5ReCu3V98XPydv1
         ixD557RhZDcZRyLAKHctl6UOPod7vVWEs4SBJB47conevE4KBdPkZZNIGhAwuO7P50Su
         QU7Eo6E2L4LwD1180Pecnxlv1o3s4ADSiBjAd1zpL+0UPtjBhF6a17SlCL9fo9vuCBSu
         oirFzcb6Zez7uSSZRKFpdfjs+m9NOYlU4GEpeap9BIS4VEOgWgGAL0vgHKgyo8Y1Z5I/
         3Dw5k+CiApUqto3SpLri6Vzw3TQBFOP/vlZ3UjRb8P/H9aDQrLJS05Vgjb/5FGC7bhgT
         ylPg==
X-Forwarded-Encrypted: i=1; AHgh+RotZj30tXBWyzhpwSTCNj+iM2tSVaqnYiRZJ3jFm3jid/T30p70AsciVLHfT9e+fCXKHWdNMcSshw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwFrijF03agAb9Jz3mhWqire7iyUf1/vqaBKosLfSj6lGVwll4/
	JpsO5Xbku8lVHoZdljp9Z20ygTML2vW23Znn0jahJzWbJ9TMASJOJzE+5hJ2uHST0EzNwQ==
X-Gm-Gg: AR+sD117b+RYsg1t0IbH7Rkcmu3kEpUgMrq6hb1SyNoSdFfcJV7BJzi94HaotBgwSog
	kX6i0b+cW9GhKDyByWLp78DSmKcuxjCn7Qo/jwPR/FwRL+8vRovuKqUhuzTExLSDrDZ0cIfs/SJ
	nIJsiysv7KY3xlfgQGbY+nUtb7fe4hYHatnjZDdHR64V1cSF2D8LuNIHpn4P1qmtKEGiycez5xx
	yjb+wrlmjuYTtxUxSKIgx7Dw453TW6ivqpKO6+cHzyDKJBmd++HK/x65uOvdf74LfRkGnyecEg2
	SYAmmDN0FrB0PwIL21eM3ug+bqeYrTvOe1a25npp0KdyJFU1lU7mymyalC6ayyjDa8kaA/2JdY1
	3KKvq3tSOxiowT0KcKxbwkf3TT+bWH3cic/ApG9dwsi27MiattbQL
X-Received: by 2002:a17:907:1caa:b0:c15:ccd6:79c5 with SMTP id a640c23a62f3a-c1f1eecc34bmr64140366b.33.1784961423771;
        Fri, 24 Jul 2026 23:37:03 -0700 (PDT)
Received: from localhost ([2a0c:59c0:1::208f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ebc828sm440790366b.43.2026.07.24.23.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 23:37:03 -0700 (PDT)
From: Cody Kang <codykang.hk@gmail.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Haylen Chu <heylenay@4d2.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Cody Kang <codykang.hk@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 00/17] drm/spacemit: add SpacemiT K3 display support
Date: Sat, 25 Jul 2026 02:36:26 -0400
Message-ID: <20260725063628.3499-1-codykang.hk@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
References: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Apologies for the duplicate posting. The patches are identical in both=0D
threads, this series and a resend series, see [1].=0D
=0D
Please use the resend [1] for furthing review comments:=0D
[1] https://lore.kernel.org/r/20260725-k3-display-v1-0-6de34d80e86c@gmail.c=
om=0D
=0D
A delivery failure on gmail side appeared to have lost the cover letter=0D
and eight of the patches from this thread. For about two hours I can=0D
only find 9 (4, 6, 7, 11, 13, 14, 15, 16, 17) of the 17 emails in the lore=
=0D
link. So I decided to resend the series with a different mail server.=0D
=0D
Sorry for the noise.=0D
=0D
Thanks,=0D
Cody=0D
