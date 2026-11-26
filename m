Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710275;
	b=aPDkHEGKTS3lYj2RM407lTiWcXgdDKUCmzh9AVKck0/qLIFCQp7jfrX9n8JMhOe05GeC
	 6qesiPDTA389f3G6zm/Sxha3XQFQKfEEFWRyUXc1pPTTnnbeU9CNbDeRgFy3RYRFleN9h
	 AtYTOUdWbBIXAimj0VQcuspjLqcIlqVamSTVMe8WnDt/hoo0yyIGR3RkziC2/diAmF0Hd
	 3ZYDVfkmj/ktRZsSmiRWkfeysmDUylGIaIxJDKygfbbiT7CKANJNO69Gy8q9dnJDVvcDJ
	 8LjYTwT3CRQibD0lQCqeMjhYSYcZaskVnmGZ9WnIICV+LzWUqC3CK6wRvfDGxoTFEFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710275;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:To:From:
	 Subject:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=Mp9D7pFPwCc0xm6C56ewwnHz36Xm2c9SF3YyvxKT0jc=;
	b=fgHUvfIo59arte+VPhYFyDuG4MLzutsMgqzUt5R2KPuM+aSeoRJeXRtatJ/mQqL669SX
	 7i9E6pC5SrV+SOaAEWLG/YDHahSoLwZFyxOBmJ2s7QB0KzTF3JniYCJyKnov9yEU4Sh0x
	 TmyGhoDZLLHYJANk07U2R5lRhDh3YDoEZgH11ELqjZf9Ww1IzRpYtyPCpS0NMMZU4EWhm
	 a95xlTjq5zbDdBMArjEQD17+N2c0L+5PZAgzc17/VBcI9Duvfb7ZXsh5vT1+AybzMItPP
	 4xzTI/ZwQFTC7sSAUzfXVBtVPwFbSrSbaVn+x43iqokK2nmUywbqwXJ01V3PXuLkCEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=bAivDR2C;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FDC606A32D
	for <spacemit@lists.linux.dev>; Thu, 26 Nov 2026 16:24:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5FDC606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=bAivDR2C
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7C795C2B9D2;
	Thu, 26 Nov 2026 16:24:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EA25860558;
	Thu, 26 Nov 2026 16:24:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B33F111E6914A;
	Thu, 26 Nov 2026 17:24:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795710264; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Mp9D7pFPwCc0xm6C56ewwnHz36Xm2c9SF3YyvxKT0jc=;
	b=bAivDR2C35PhwnrRDbM0ubJtlM8WREdKoDtv8oyGFcLEbdkTrz41SLrg//H1eEUqhCzFlJ
	lzuFHTRbfcWExSuvEE9gNsYQb4b1644KMpczPnQVW3dK6wmMubxf3e/h+WOm9/GI3wYPt5
	6Vhj6/ihGRqvUv/ieBsQE8bp3ELAtBxFtdWj/htVxu5K9LON5kvq/IYvgWVKAJc48nGOQn
	j8ITNyt1NNe//9eE6bFqxqQnWcotDBl1xgwZjV41q0K7GWuwAckrnF+Qa6/5TCbSExclVV
	hA8sGg2w597segnATDIotV4Awrtdx4o40lkojytTIBzXrZrrqowzfZUAkBvpFw==
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 17:24:03 +0100
Message-Id: <DN5A5LAYR6AW.X45Z2L7J1T4H@bootlin.com>
Cc: "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Yixun Lan" <dlan@kernel.org>, "Troy
 Mitchell" <troy.mitchell@linux.spacemit.com>, "Vinod Koul"
 <vkoul@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Manivannan Sadhasivam" <mani@kernel.org>, "Haylen Chu" <heylenay@4d2.org>,
 "Michael Turquette" <mturquette@baylibre.com>, "Stephen Boyd"
 <sboyd@kernel.org>, "Brian Masney" <bmasney+clk@redhat.com>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Paul Walmsley" <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Yao Zi" <me@ziyao.cc>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, "Icenowy
 Zheng" <uwu@icenowy.me>, "Jerome Brunet" <jbrunet+clk@baylibre.com>, "Sarah
 Emery" <sarah.emery@canonical.com>, "Ze Huang" <ze.huang@oss.qualcomm.com>,
 "Dmitry Baryshkov" <lumag@kernel.org>, "Cody Kang" <codykang@vsit.ai>,
 <dri-devel@lists.freedesktop.org>, <linux-riscv@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, "Luca Ceresoli" <luca.ceresoli@bootlin.com>
To: "Guodong Xu" <docular.xu@gmail.com>, "Cody Kang" <codykang.hk@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 12/17] drm/spacemit: add Innosilicon DP/eDP
 controller bridge driver
X-Mailer: aerc 0.22.0
References: <20261121-k3-display-v3-0-ec419e8e96b8@gmail.com>
 <20261121-k3-display-v3-12-ec419e8e96b8@gmail.com>
 <9ec2f818084f2e723e8b82218a302258.docular.xu@gmail.com>
In-Reply-To: <9ec2f818084f2e723e8b82218a302258.docular.xu@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

On Thu Nov 26, 2026 at 2:16 AM CET, Guodong Xu wrote:
...
> Luca (added to Cc), is module unload something your bridge hotplug
> series [1] is meant to cover?

No, I'm afraid it does nothing related to modules.

It's complicated enough without! :-)

> [1] https://lore.kernel.org/r/20261118-drm-bridge-hotplug-v3-0-44bb3b4a82=
8f@bootlin.com

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
