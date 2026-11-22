Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364307;
	b=F0mHi+3u/7KQfp9qwMRe/Inm76OSlNdqrt6vD6xIiglRoWX+R7n+VbC7N42wreg9jW9n
	 OnKVLN6tv370gba+OKJfPsfxwskyQZHmWQE4DkhjVRlrmnrBI9KDg0jgSwRlG7PIFyL8l
	 JAXwqcdFjM9/WD/Z8GlgOhPPw2yhQbaSxsnWaTjXIP4P5GPX8Lokd0I9NJFxe72/783Od
	 wxHzsbi95LfRNZdUl1XGLwyeUcWKYSZNcPIDN1ivSHcNz2RbhgXx9WrBNK3blQHpAugO5
	 9PgGoYimXxVe7THMwmcEqoBy9BRy5BxusBZ3TY7XG7ZJWj2jEU332bdLK4sfxWnfjkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8ZiEeOYhVKS03CHr35HdwHPjYPpUXJNlNyaUVNFPqXQ=;
	b=kbaTieBvp03lvD9p7+N7zbqZ2KbnP/UmlY+9aAReFUlf//AqQ8U4fbOR03psx+J1veHN
	 XYFquGu2ni3tQL0aVMwAkzYTFYsgJ8dufHPkkfs/RKJ9ZLCzVYa7adWW7fjedFvhBc7KR
	 un1X/ctE/ruM04SgDEMun6LuWrtYpxMpRdvqOutqpHDl5F/hJSqCuSDwtWRm9azOOdZ4o
	 8DXvUEy9HvEfIlfym1tz9VA8NVY/CRd4YF63+lupjGL7eD2HtgMs8wYWPf5TW9btZChY7
	 FCypy08ztcTtBuzUQ974xY0u94+x6IanAwE1SnsBZzL1hcNZf/oywqEqUrTJ3cJadZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=jqSwKNDI;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DFC606A32A
	for <spacemit@lists.linux.dev>; Sun, 22 Nov 2026 16:18:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47DFC606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=jqSwKNDI
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso31058755e9.0
        for <spacemit@lists.linux.dev>; Sun, 22 Nov 2026 08:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795364304; x=1795969104; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ZiEeOYhVKS03CHr35HdwHPjYPpUXJNlNyaUVNFPqXQ=;
        b=jqSwKNDIcjZ0Nvx5SuDsqff5uWHvXiI3FE7It7oH1vGmTYY4nvMjpjm6iraEm5uBt5
         1nUriYh+Tl7R3jYgzmIdrEkMnBaaVHJy1XpTEwZxFZkRsKfjwQCHmH8VkuLdISy2+k4W
         SExOK3S+/C5sXe9qRwxylqEypdnY+ip08g8QxEfSNPvmCI0bmeEH0d9y2FSPOq71d5JQ
         yvgYtpkWqqXF9cD2X0exFyteLavN4QzvWWuOjVSWVCyuMRqgbCDiUaE2JGGvEnAMSoiF
         uTF5Lw3SIRyNiYgljepLYea0wHMeGcoJMiTWVkVpByX4Y9+O9Bg/cdpiV+NqL8bwDI3V
         +ZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364304; x=1795969104;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ZiEeOYhVKS03CHr35HdwHPjYPpUXJNlNyaUVNFPqXQ=;
        b=RmUF07Vf/3g++0hrVMOu1atRQv3X7LP/Wz1FrEAZwcT//iSmVLtUKVKeS/8sErWxp2
         LLArdvkxW/ynG10QoygxGfHThlZ6A+FUyCRbjVzPXq8eP4jKdYa3HUkx8b+Boo0iD8ka
         mqQLZeVUE57jXkdo3bUl+hnoyqTIsm9AUsa08NzGgeFm8pqtXvqMDn1Lxr3icOvlwQAX
         ytQpqGdr5xdqlwYUurRVkxcHUXnyBUDpfGF80QBQUGRlShzysI/luzx39zrzDlAhb5aL
         hgW+SacwLHXIZJmsrjlLL8ib+pyrPq2udYgJyB4wKO84aYrEtZ17oedgvigIhQc2NANx
         SjAw==
X-Forwarded-Encrypted: i=1; AL+hErFh9y59QFl+BByZTl9s8WbTwCWSIC4eCW8fhhrCJw4vvnAgkotdD45Y8wQjuK9RZ1UOJaU7mbzr6g==@lists.linux.dev
X-Gm-Message-State: APuU4Z8Dq1TA8plVbFzVmCMCN2B1MpMUjTnqZR7VPRhjsdsbnKTtGMpO
	+eX1sYGuIE8yvxQEMQAVDRJkstc5aAdKeD0iWMXPFc9zD7s37yZfK+3oGIf2ekmYp4U=
X-Gm-Gg: AZFdTZeWblpf41hXx3Ah+XjVIdvy03mdFEQlgpmYznjiaz2X3k5Iw7nuEmAdMVR0fto
	/AZcb/ZRrQCqZg0AI5iVNvqaajoxKZYoYDC5myeviSDvhTLLkhWtLhHabqSBug1NoS9k7Ci6GK5
	tLGpdwKiaf45wCZ/ZQZyneXSEVkr2B8yE1FjonMSxpC4rUy/oKP9TKEWOVqr37iEnyp4jaAJml7
	+IAJrS8JqEx4inyHHEWKNLE88TX5I45patJOjyWPNIX0SWETjxr45V3O8+AzySWHzsBvoj6/CN2
	DiTkzfbw5SVieZ7Wjh6vwjdmowfnl+QBq4JPmeozfLAmeZr1CLtneyOadomdBTCT9lF8yDa6Dd2
	FfByliLLLkuvk+yZqRisJIZ+DUrrTvEneo+cOPyoc4e05ymvIIvvZy8Lln39nnMc+eSmUWmDF/3
	GCamLSfqI2sMDU7Dzt+gk7VmD5wgdIGsm1U4i4e5BfhA2x/3klIB0IjgFpBHHIzgUEwbPFXdlVm
	UAEQKmR85KUQZx2u5oziyIMdyZkzBWdVd5PhbriUv1r4nkjNmG6vbCTpZFU9mQo8mtUr2qRl28J
	9VawUdaTEaEkFCE55Bl9ZIOBOJbHugmxbnWhLCVn6sacQZ9f
X-Received: by 2002:a05:600c:e553:b0:4bb:9457:3c93 with SMTP id 5b1f17b1804b1-4bb94573c9amr46862925e9.2.1795364304705;
        Sun, 22 Nov 2026 08:18:24 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8d4f9aa8sm226037545e9.4.2026.11.22.08.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:18:24 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Haylen Chu <heylenay@4d2.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Guodong Xu <docular.xu@gmail.com>, Icenowy Zheng <uwu@icenowy.me>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Sarah Emery <sarah.emery@canonical.com>, 
 Ze Huang <ze.huang@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Cody Kang <codykang.hk@gmail.com>
Cc: Cody Kang <codykang@vsit.ai>, dri-devel@lists.freedesktop.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
In-Reply-To: <20261121-k3-display-v3-0-ec419e8e96b8@gmail.com>
References: <20261121-k3-display-v3-0-ec419e8e96b8@gmail.com>
Subject: Re: (subset) [PATCH v3 00/17] drm/spacemit: add SpacemiT K3
 display support
Message-Id: <179536429642.2728475.2044119204203952258.b4-ty@b4>
Date: Sun, 22 Nov 2026 17:18:16 +0100
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=207; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=v3hfU9UHf+Kw6j8mPInDkRCmcdQcn/tFYuhWer9PVLA=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNnMouffLtac7bcg5TPvFslVKz/IiM43L2d2W3La8FzzF
 i6bCx9Xd5SyMIhxMciKKbLUcFeLv5PU+jJrus5tmDmsTCBDGLg4BWAim44zMmxxe2hesHqmrEzE
 C5a4iu+CTLL9sfqpvwrzRPpPFr2X/8XwPyhe6sxK569/On8WiM9u/vRjfl5c4ZyfsjXJvPYlub7
 z2QA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Applied to clk/linux.git (clk-spacemit), thanks!

[06/17] clk: spacemit: k3: parent eDP/DP pixel clock to the PHY PLL
        https://git.kernel.org/clk/linux/c/dd010f2b662d

Best regards,
--
Jerome

